part of '../widgets/widgets_imports.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.color, this.fontSize, this.fontWeight});

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color  ?? MyColors.white,
      ),
    );
  }
}
