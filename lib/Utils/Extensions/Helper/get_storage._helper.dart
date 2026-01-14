import 'package:get_storage/get_storage.dart';

const String localTokenKey = 'token';
const String localUserNameKey = 'username';
const String localPasswordKey = 'password';
const String localRememberKey = 'remember';

final GetStorage _storage = GetStorage();

/// TOKEN
Future<void> saveToken(String token) async {
  await _storage.write(localTokenKey, token);
}

String? getToken() => _storage.read(localTokenKey);

/// USERNAME
Future<void> saveUserName(String username) async {
  await _storage.write(localUserNameKey, username);
}

String? getUserName() => _storage.read(localUserNameKey);

Future<void> removeUserName() async {
  await _storage.remove(localUserNameKey);
}

/// PASSWORD
Future<void> savePassword(String password) async {
  await _storage.write(localPasswordKey, password);
}

String? getPassword() => _storage.read(localPasswordKey);

Future<void> removePassword() async {
  await _storage.remove(localPasswordKey);
}

/// REMEMBER ME
Future<void> saveRememberMe(bool value) async {
  await _storage.write(localRememberKey, value);
}

bool getRememberMe() => _storage.read(localRememberKey) ?? false;

/// CLEAR
Future<void> clearAllStorage() async {
  await _storage.erase();
}
