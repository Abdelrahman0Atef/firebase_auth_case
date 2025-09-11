// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
// class FirebaseRemoteConfigService {
//   final remoteConfig = FirebaseRemoteConfig.instance;
//
//   void closeApp() async {
//     await remoteConfig.setConfigSettings(
//       RemoteConfigSettings(
//         fetchTimeout: const Duration(minutes: 1),
//         minimumFetchInterval: const Duration(hours: 1),
//       ),
//     );
//     await remoteConfig.fetchAndActivate();
//     bool clientPaid = remoteConfig.getBool("clientPaid");
//   }
// }
