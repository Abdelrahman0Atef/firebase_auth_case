part of '../widgets/widgets_imports.dart';

class AuthFormTextField extends StatelessWidget {
  AuthFormTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
  });

  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return MyStrings.fieldRequired;
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.black),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.black),
        ),
      ),
    );
  }
}
