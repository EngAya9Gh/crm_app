import 'package:flutter/material.dart';

import '../../../constants.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({
    super.key,
    required this.title,
    required this.onTap,
    this.colorbag = Colors.white,
    this.colorarrow = Colors.black,
    this.colortitle = Colors.black,
    this.isicon,
    this.subtitle,
  });

  final String title;
  final VoidCallback onTap;
  final Color colorbag;
  final Color colorarrow;
  final Color colortitle;
  final bool? isicon;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorbag,
        ),
        child: InkWell(
          onTap: onTap,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: colortitle,
                        fontFamily: kfontfamily2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      if (subtitle != null)
                        Text(
                          subtitle.toString(),
                          style: TextStyle(),
                        ),
                      if (isicon == true)
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: colorarrow,
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
