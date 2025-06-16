part of '../widgets/widgets_imports.dart';

class AuthButton extends StatelessWidget {
  AuthButton({super.key, required this.onTap, required this.text});

  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.black,
          borderRadius: BorderRadius.circular(8.r),
        ),
        width: double.infinity,
        height: 50.h,
        child: Center(
          child: CustomText(
            text: text,
          ),
        ),
      ),
    );
  }
}