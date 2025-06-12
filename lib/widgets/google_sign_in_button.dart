part of '../widgets/widgets_imports.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({super.key, required this.onTap, required this.text});

  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        width: double.infinity,
        height: 50.h,
        child: Center(
          child: Image.asset(MyAssets.google, height: 35.h, width: 35.w),
        ),
      ),
    );
  }
}
