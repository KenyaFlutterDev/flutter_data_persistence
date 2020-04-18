class User {
  // user properties
  final int id;
  final String name;
  final String email;
  final String password;

  User({this.id, this.name, this.email, this.password});

  // convert user object to a map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }

  // convert user map to user object
  factory User.fromMap(Map<String, dynamic> map) => User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password']);
}
