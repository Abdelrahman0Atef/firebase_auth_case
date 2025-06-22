part of '../sign_in_imports.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key, required this.vm});

  final SignInViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Form(
        key: vm._formKey,
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
                  text: MyStrings.signIn,
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
              obscureText: true,
              onChanged: (data) {
                vm._password = data;
              },
              hintText: MyStrings.enterPassword,
            ),
            15.verticalSpace,
            AuthButton(onTap: () => vm._login(context), text: MyStrings.signIn),
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
                  text: MyStrings.dontHaveAccount,
                  color: MyColors.black,
                  fontWeight: FontWeight.normal,
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(MyRouts.signUp);
                  },
                  child: const CustomText(
                    text: MyStrings.signUp,
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
