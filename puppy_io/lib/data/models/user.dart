
class User {
  const User(this.id, this.userName, this.email, this.password);

  final String id;
  final String userName;
  final String email;
  final String password;

  static const empty = User('-', '', '', '');
}
