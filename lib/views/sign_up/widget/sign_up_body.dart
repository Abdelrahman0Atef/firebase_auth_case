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
                CustomText(
                  text: MyStrings.name,
                  fontSize: 32,
                  color: MyColors.black,
                ),
              ],
            ),
            35.verticalSpace,
            Row(
              children: [
                CustomText(
                  text: MyStrings.signUp,
                  fontSize: 24,
                  color: MyColors.black,
                ),
              ],
            ),
            15.verticalSpace,
            AuthFormTextField(
              onChanged: (data) {
                vm._email = data;
              },
              hintText: MyStrings.enterEmail,
            ),
            10.verticalSpace,
            AuthFormTextField(
              onChanged: (data) {
                vm._password = data;
              },
              obscureText: true,
              hintText: MyStrings.enterPassword,
            ),
            15.verticalSpace,
            AuthButton(onTap: () => vm._signUp(context), text: MyStrings.signUp),
            5.verticalSpace,
            GoogleSignInButton(
              onTap: () async {
                await vm._googleLogin(context);
              },
              text: MyStrings.signIn,
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: MyStrings.alreadyHaveAccount,
                  color: MyColors.black,
                  fontWeight: FontWeight.normal,
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const CustomText(
                    text: MyStrings.signIn,
                    color: MyColors.blue,
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
