part of '../sign_up_imports.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key, required this.vm});

  final SignUpViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Form(
        key: vm.formKey,
        child: ListView(
          children: [
            50.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.name,
                  style: TextStyle(fontSize: 32.sp, color: MyColors.black),
                ),
              ],
            ),
            35.verticalSpace,
            Row(
              children: [
                Text(
                  MyStrings.signUp,
                  style: TextStyle(fontSize: 24.sp, color: MyColors.black),
                ),
              ],
            ),
            15.verticalSpace,
            AuthFormTextField(
              onChanged: (data) {
                vm.email = data;
              },
              hintText: MyStrings.enterEmail,
            ),
            10.verticalSpace,
            AuthFormTextField(
              onChanged: (data) {
                vm.password = data;
              },
              obscureText: true,
              hintText: MyStrings.enterPassword,
            ),
            15.verticalSpace,
            AuthButton(onTap: () => vm.signUp(context), text: MyStrings.signUp),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  MyStrings.alreadyHaveAccount,
                  style: TextStyle(color: MyColors.black),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Text(
                    MyStrings.signIn,
                    style: TextStyle(color: MyColors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
