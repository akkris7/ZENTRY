import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final double height;
  final double width;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  final FontWeight? fontWeight;
  final List<BoxShadow>? boxShadow;
  final Function()? onTap;
  const CustomButton({
    required this.title,
    this.textColor = whiteColor,
    this.buttonColor = Colors.blueAccent,
    this.isLoading = false,
    this.height = 50,
    this.width = 50,
    this.fontSize = 16,
    this.onTap,
    this.boxShadow,
    this.fontWeight = FontWeight.w500,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
          boxShadow: boxShadow,
        ),

        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}