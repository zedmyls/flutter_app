class LoginRequest {
  late String username;
  late String password;
  String? email;

  LoginRequest({this.username = '', this.password = '', this.email});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
