import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/extensions/num_extensions.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../domain/models/favorite_screen_model.dart';
import '../manager/favorite_screens_cubit.dart';

class FavoriteScreensSection extends StatelessWidget {
  const FavoriteScreensSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building FavoriteScreensSection');
    return BlocBuilder<FavoriteScreensCubit, FavoriteScreensState>(
      builder: (context, state) {
        print(
            'FavoriteScreensSection state: status=${state.status}, favoriteScreens=${state.favoriteScreens.length}, availableScreens=${state.availableScreens.length}');

        if (state.status == FavoriteScreensStatus.loading) {
          print('FavoriteScreensSection showing loading indicator');
          return Center(child: CircularProgressIndicator());
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    AppText(
                      'الواجهات المفضلة',
                      style: TextStyle(
                        fontSize: 18.scaleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryMain,
                      ),
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.add_circle, color: AppColors.primaryMain),
                      onPressed: () => _showAddFavoriteDialog(
                          context, state.availableScreens),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                if (state.favoriteScreens.isEmpty)
                  Container(
                    padding: EdgeInsets.all(20.r),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: 48.r,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 12),
                        AppText(
                          'لم تقم بإضافة أي واجهات مفضلة بعد',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.scaleFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        AppText(
                          'انقر على زر + لإضافة واجهات جديدة',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.scaleFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    height: 110.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: state.favoriteScreens.length,
                      itemBuilder: (context, index) {
                        final screen = state.favoriteScreens[index];
                        return _buildHorizontalScreenItem(context, screen);
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalScreenItem(
      BuildContext context, FavoriteScreenModel screen) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.only(right: 10.r),
      child: GestureDetector(
        onTap: () {
          if (screen.routeName.isNotEmpty) {
            try {
              print('Navigating to: ${screen.routeName}');

              // استخدام الصفحة الفعلية إذا كانت متوفرة
              if (screen.page != null) {
                print(
                    'Using actual page widget for navigation: ${screen.title}');
                AppNavigator.go(
                  screen.page!,
                  name: screen.routeName,
                  extra: screen.extraParams,
                );
              } else {
                // استخدام طريقة التنقل البديلة إذا لم تكن الصفحة متوفرة
                print(
                    'WARNING: No page widget found for ${screen.title}, using route-only navigation');

                // Try to navigate using an empty container
                AppNavigator.go(
                  Container(), // Empty container as fallback
                  name: screen.routeName,
                  extra: screen.extraParams,
                );
              }
            } catch (e) {
              print('Error navigating to ${screen.routeName}: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('تعذر الانتقال إلى ${screen.title}'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          }
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 70.r,
                  height: 70.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      screen.icon,
                      size: 28.r,
                      color: AppColors.primaryMain,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<FavoriteScreensCubit>()
                          .removeFavoriteScreen(screen.id);
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 12.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            AppText(
              screen.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.scaleFontSize,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddFavoriteDialog(
    BuildContext context,
    List<FavoriteScreenModel> availableScreens,
  ) {
    final cubit = context.read<FavoriteScreensCubit>();
    final alreadyAdded = cubit.state.favoriteScreens.map((e) => e.id).toSet();
    final screens = availableScreens
        .where((screen) => !alreadyAdded.contains(screen.id))
        .toList();

    // Sort screens by title to make them easier to find
    screens.sort((a, b) => a.title.compareTo(b.title));

    if (screens.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا توجد واجهات إضافية متاحة'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController searchController = TextEditingController();
        List<FavoriteScreenModel> filteredScreens = List.from(screens);

        return StatefulBuilder(builder: (context, setState) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: AppText(
                'إضافة واجهات مفضلة',
                textAlign: TextAlign.center,
              ),
              content: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    // Search box
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'ابحث عن واجهة...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          filteredScreens = screens
                              .where((screen) => screen.title
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    // Screen list
                    Expanded(
                      child: filteredScreens.isEmpty
                          ? Center(
                              child: Text('لا توجد نتائج مطابقة للبحث'),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredScreens.length,
                              itemBuilder: (context, index) {
                                final screen = filteredScreens[index];
                                return ListTile(
                                  leading: Icon(
                                    screen.icon,
                                    color: screen.page != null
                                        ? AppColors.primaryMain
                                        : Colors.grey,
                                  ),
                                  title: AppText(screen.title),
                                  subtitle: screen.page == null
                                      ? AppText(
                                          '(تنقل بالمسار فقط - قد لا يعمل بشكل صحيح)',
                                          style: TextStyle(
                                            fontSize: 11.scaleFontSize,
                                            color: Colors.redAccent,
                                          ),
                                        )
                                      : AppText(
                                          '(واجهة كاملة متاحة)',
                                          style: TextStyle(
                                            fontSize: 11.scaleFontSize,
                                            color: Colors.green,
                                          ),
                                        ),
                                  tileColor: screen.page != null
                                      ? Colors.green.withOpacity(0.05)
                                      : Colors.grey.withOpacity(0.05),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: screen.page != null
                                          ? Colors.green.withOpacity(0.3)
                                          : Colors.grey.withOpacity(0.3),
                                      width: 0.5,
                                    ),
                                  ),
                                  onTap: () {
                                    cubit.addFavoriteScreen(screen);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: AppText('إلغاء'),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
