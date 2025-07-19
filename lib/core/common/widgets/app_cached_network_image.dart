import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final Function()? function;
  final BoxFit? fit;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.function,
    this.fit,
    this.errorWidget,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      debugPrint('AppCachedNetworkImage: imageUrl is null or empty');
      return Center(
        child: errorWidget ??
            Icon(
              Icons.person,
              size: 50.scaleIconsSize,
              color: AppColors.secondaryMain,
            ),
      );
    }

    final String decodedUrl = Uri.decodeFull(imageUrl!);
    debugPrint('AppCachedNetworkImage: Loading image from URL: $decodedUrl');
    
    return InkWell(
      onTap: function,
      child: kIsWeb 
        ? _buildWebImage(decodedUrl)
        : _buildMobileImage(decodedUrl),
    );
  }

  Widget _buildWebImage(String decodedUrl) {
    return FutureBuilder<Widget>(
      future: _loadWebImage(decodedUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppLoader();
        }
        
        if (snapshot.hasError) {
          debugPrint('Web Image: FutureBuilder error: ${snapshot.error}');
          return Center(
            child: errorWidget ??
                Icon(
                  Icons.person,
                  size: 50.scaleIconsSize,
                  color: AppColors.secondaryMain,
                ),
          );
        }
        
        return snapshot.data ?? Center(
          child: errorWidget ??
              Icon(
                Icons.person,
                size: 50.scaleIconsSize,
                color: AppColors.secondaryMain,
              ),
        );
      },
    );
  }

  Future<Widget> _loadWebImage(String decodedUrl) async {
    try {
      debugPrint('Web Image: Attempting to load: $decodedUrl');
      
      // Try multiple CORS proxies in sequence
      final List<String> corsProxies = [
        'https://api.allorigins.win/raw?url=',
        'https://cors-anywhere.herokuapp.com/',
        'https://thingproxy.freeboard.io/fetch/',
      ];
      
      for (int i = 0; i < corsProxies.length; i++) {
        final proxyUrl = corsProxies[i] + decodedUrl;
        debugPrint('Web Image: Trying proxy $i: $proxyUrl');
        
        try {
          return Image.network(
            proxyUrl,
            fit: fit ?? BoxFit.cover,
            width: width?.scaleWidth,
            height: height?.scaleHeight,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return AppLoader();
            },
            errorBuilder: (context, error, stackTrace) {
              debugPrint('Web Image: Proxy $i failed: $error');
              // Continue to next proxy or fallback
              return _buildFallbackImage();
            },
          );
        } catch (e) {
          debugPrint('Web Image: Exception with proxy $i: $e');
          continue;
        }
      }
      
      // If all proxies fail, try direct approach with different headers
      debugPrint('Web Image: All proxies failed, trying direct approach');
      return Image.network(
        decodedUrl,
        fit: fit ?? BoxFit.cover,
        width: width?.scaleWidth,
        height: height?.scaleHeight,
        headers: {
          'Access-Control-Allow-Origin': '*',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
          'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
          'Cache-Control': 'no-cache',
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return AppLoader();
        },
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Web Image: Direct approach failed: $error');
          return _buildFallbackImage();
        },
      );
    } catch (e) {
      debugPrint('Web Image: Exception in _loadWebImage: $e');
      return _buildFallbackImage();
    }
  }

  Widget _buildFallbackImage() {
    return Center(
      child: errorWidget ??
          Icon(
            Icons.person,
            size: 50.scaleIconsSize,
            color: AppColors.secondaryMain,
          ),
    );
  }

  Widget _buildMobileImage(String decodedUrl) {
    return CachedNetworkImage(
      httpHeaders: {
        'Access-Control-Allow-Origin': '*',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
      },
      errorListener: (value) {
        debugPrint('Error in AppCachedNetworkImage => $value | url is => $imageUrl');
      },
      imageUrl: decodedUrl,
      fit: fit ?? BoxFit.cover,
      width: width?.scaleWidth,
      height: height?.scaleHeight,
      progressIndicatorBuilder: (context, imageUrl, downloadProgress) {
        debugPrint('AppCachedNetworkImage: Loading progress: ${downloadProgress.progress}');
        return AppLoader();
      },
      errorWidget: (context, imageUrl, error) {
        debugPrint('AppCachedNetworkImage: Error loading image: $error');
        debugPrint('AppCachedNetworkImage: Failed URL: $imageUrl');
        debugPrint('AppCachedNetworkImage: Error type: ${error.runtimeType}');
        
        // Try to get more details about the error
        if (error is Exception) {
          debugPrint('AppCachedNetworkImage: Exception details: ${error.toString()}');
        }
        
        return Center(
          child: errorWidget ??
              Icon(
                Icons.person,
                size: 50.scaleIconsSize,
                color: AppColors.secondaryMain,
              ),
        );
      },
    );
  }

  String _firstCharacter() {
    return AppConstants.currentUser.nameUser.toString().substring(0, 1);
  }
}
