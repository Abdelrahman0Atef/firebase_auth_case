part of '../sign_in_imports.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key, required this.vm});

  final SignInViewModel vm;

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
                  MyStrings.signIn,
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
              obscureText: true,
              onChanged: (data) {
                vm.password = data;
              },
              hintText: MyStrings.enterPassword,
            ),
            15.verticalSpace,
            AuthButton(onTap: () => vm.login(context), text: MyStrings.signIn),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  MyStrings.dontHaveAccount,
                  style: TextStyle(color: MyColors.black),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(MyRouts.signUp);
                  },
                  child: const Text(
                    MyStrings.signUp,
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
