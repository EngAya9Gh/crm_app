
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class LoadingCommentWidget extends StatelessWidget {
  const LoadingCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
              color: Colors.white24 //.withOpacity(0.2),
              ),
        ],
        color: Colors.black12,
      ),
      padding: const EdgeInsets.only(right: 8.0, bottom: 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.circular(width: 25, height: 25),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(height: 30),
                    2.height,
                    ShimmerWidget.rectangular(height: 30),
                    5.height,
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          ShimmerWidget.rectangular(height: 65),
        ],
      ),
    );
  }
}