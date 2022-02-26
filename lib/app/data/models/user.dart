class UserModel {
  late String email;
  late String userName;
  String ? photoUrl;

  UserModel({
    required this.email,
    required this.userName,
    this.photoUrl,
  });
}
