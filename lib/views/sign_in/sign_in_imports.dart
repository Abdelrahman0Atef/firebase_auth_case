import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_case/core/models/user_profile_model.dart';
import 'package:firebase_auth_case/core/resources/my_colors/my_colors.dart';
import 'package:firebase_auth_case/core/resources/my_routs/my_routs.dart';
import 'package:firebase_auth_case/core/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth_case/core/services/locator_services/locator_services.dart';
import 'package:firebase_auth_case/widgets/widgets_imports.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/resources/my_strings/my_strings.dart';
import '../../main.dart';

part 'view/sign_in_view.dart';
part 'viewmodel/sign_in_view_model.dart';
part 'widget/sign_in_body.dart';