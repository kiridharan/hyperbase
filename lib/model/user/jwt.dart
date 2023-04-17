class LoginModel {
  String? authenticated;
  String? accessToken;

  LoginModel({this.authenticated, this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    accessToken = json['AccessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authenticated'] = authenticated;
    data['AccessToken'] = accessToken;
    return data;
  }
}
