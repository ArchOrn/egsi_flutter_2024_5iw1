class User {
  final int id;
  final String name;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final addressJson = json['address'];
    return User(
      id: json['id'],
      name: json['name'],
      address: '${addressJson['street']} ${addressJson['suite']} ${addressJson['city']}',
    );
  }
}
