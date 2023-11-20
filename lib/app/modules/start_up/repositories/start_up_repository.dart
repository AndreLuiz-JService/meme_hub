import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:meme_hub/app/core/store/auth_settings.dart';

class StartUpRepository {
  final AuthSettings authSettings;

  StartUpRepository(this.authSettings);

  Future<bool> validateUserToken() async {
    final token = await authSettings.getUserToken();
    if (token == null) return false;
    final jwtToken = JWT.decode(token);
    final tokenExp = jwtToken.payload['exp'];
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    bool isExpired = tokenExp <= currentTimestamp;
    return !isExpired;
  }
}
