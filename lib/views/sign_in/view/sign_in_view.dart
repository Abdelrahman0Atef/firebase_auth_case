part of '../sign_in_imports.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isAppPaid = false; // الحالة الخاصة بـ الدفع
  String paymentMessage = 'يرجى دفع الرسوم لتفعيل التطبيق'; // رسالة الدفع

  @override
  void initState() {
    super.initState();
    // محاكاة جلب بيانات الدفع
    _checkPaymentStatus();
  }

  // محاكاة التحقق من حالة الدفع
  void _checkPaymentStatus() async {
    // هنا يمكنك استبدال هذا بـ API أو استعلام من قاعدة بيانات أو Firebase
    // على سبيل المثال:

    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: Duration.zero,
      ),
    );
    await remoteConfig.fetchAndActivate();
    setState(()  {

      isClientPaid = remoteConfig.getBool("clientPaid");
      isAppPaid = isClientPaid; // يتم تحديد هذا بناءً على حالتك (true أو false)
      paymentMessage = "أنت بحاجة للدفع لتتمكن من استخدام التطبيق"; // الرسالة المناسبة
    });
  }

  @override
  Widget build(BuildContext context) {
    final SignInViewModel vm = SignInViewModel();
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Stack(
        children: [
          SignInBody(vm: vm,),

          if (!isAppPaid)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.8),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(20.w),
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.orange,
                        size: 80.w,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "التطبيق غير مفعل",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        paymentMessage,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.red.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.block,
                              color: Colors.red,
                              size: 20.w,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "الوصول محظور",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
