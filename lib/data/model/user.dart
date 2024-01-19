class DataUser {
  final List<User> data;
  DataUser({required this.data});
  factory DataUser.fromJson(List<dynamic> json) => DataUser(
        data: json.map((user) => User.fromModel(user)).toList(),
      );
}

class User {
  final int id;
  final String email;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory User.fromModel(Map<String, dynamic> json) => User(
      id: int.parse(json['id']),
      email: json['email'],
      name: json['name'],
      avatar: json['avatar']);
}
