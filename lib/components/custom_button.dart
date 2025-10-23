import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? callBack;
  const CustomButton({
    super.key,
    required this.screenWidth,
    required this.text,
    this.callBack,
  });

  final double screenWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * .45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFF6247AA),
      ),
      child: MaterialButton(
        onPressed: () {
          callBack?.call();
        },
        child: Text(text, style: TextStyle(color: Color(0xFFFFFFFF))),
      ),
    );
  }
}
