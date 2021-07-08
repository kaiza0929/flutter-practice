import "package:http/http.dart" as http;
import "./../states/user.dart";

const String baseUrl = "localhost:8000";

Future<User> login(String email, String password) async {
  //final uri = Uri.https(baseUrl, "api/user/login");
  //final res = await http.post(uri, body: {"email": email, "password": password});
  return User(true, "@testuser", "テストユーザー");
}

