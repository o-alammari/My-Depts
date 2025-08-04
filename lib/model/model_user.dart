class ModelUser {
  int? id;
  String? userName;
  String? password;
  ModelUser({
    this.id,
    required this.userName,
    required this.password,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        id: json['id'],
        userName: json['userName'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
    };
  }
}
