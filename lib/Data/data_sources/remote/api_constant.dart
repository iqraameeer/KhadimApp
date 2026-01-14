// import 'package:get_storage/get_storage.dart';
// import '../../../Utils/Extensions/Helper/get_storage._helper.dart';
// import '../../model/SignInModel/signInModel.dart';
//
//
// class ApiConstants {
//
//   ApiConstants._();
//
//
//   static const baseUrl = "https://mne.seld.gos.pk/";
//
//
//   static const mainUrl = "$baseUrl/api/";
//
//   static var publishKey = "";
//   static var secretKey = "";
//   static final storage = GetStorage();
//   static  User? userData = getUser();
//
// }

import 'package:get_storage/get_storage.dart';

class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://mne.seld.gos.pk/";
  static const String apiBaseUrl = "${baseUrl}api/";
  static const String authBaseUrl = baseUrl;

  static final GetStorage storage = GetStorage();
  static String? token;
}
