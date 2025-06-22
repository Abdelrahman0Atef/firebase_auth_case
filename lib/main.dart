import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth_case/core/base/go_router/go_router.dart';
import 'package:firebase_auth_case/core/services/firebase_service/firebase_notification_service.dart';
import 'package:firebase_auth_case/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/locator_services/locator_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseNotificationService().initNotification();
  locatorServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        final easyLoading = EasyLoading.init();
        final botToast = BotToastInit();
        return MaterialApp.router(
          builder: (context, child) {
            Widget finalChild = botToast(context, child);
            finalChild = easyLoading(context, finalChild);
            return finalChild;
          },
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
