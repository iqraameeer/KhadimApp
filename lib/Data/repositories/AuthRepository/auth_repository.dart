import '../../data_sources/remote/api_constant.dart';
import '../../data_sources/remote/api_endpoints.dart';
import '../../data_sources/remote/network_api_service.dart';
import '../../model/SignInModel/signInModel.dart';

class AuthRepository {
  final NetworkApiService _networkApiService = NetworkApiService();

  Future<SigninModel> SigninApiRepo(Map<String, dynamic> data) async {
    try {
      final response = await _networkApiService.PostFormUrlEncodedResponse(
        url: ApiEndPointUrls.signIn,
        data: data,
        isTokenRequired: false,
        baseUrlOverride: ApiConstants.authBaseUrl,
      );

      return SigninModel.fromJson(response);
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}