
class User {
  const User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
  });

  final String id;
  final String userName;
  final String email;
  final String password;

  static const empty = User(email: '', password: '', userName: '', id: '');
}
