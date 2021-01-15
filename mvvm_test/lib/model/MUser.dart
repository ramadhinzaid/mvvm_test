import 'dart:convert';

import 'package:http/http.dart' as http;

class MUser {
  MUser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory MUser.fromJson(Map<String, dynamic> json) => MUser(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
  static Future<MUser> getUserFromAPI(int id) async {
    String apiURL = "https://reqres.in/api/users/" + id.toString();
    var response = await http.get(apiURL);
    var rest = json.decode(response.body);
    var userdata = (rest as Map<String, dynamic>)['data'];
    return MUser.fromJson(userdata);
  }
}

class UninitializedUser extends MUser {}
