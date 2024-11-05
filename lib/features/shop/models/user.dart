class User {
  final int idUser;
  final String name;
  final String sex;
  final String? numberPhone;
  final String? email;

  User(
      {required this.idUser,
      required this.name,
      required this.sex,
      this.numberPhone,
      this.email});

  factory User.fromSQfliteDatabase(Map<String, dynamic> map) => User(
        idUser: map['idUser'] ?? 0,
        name: map['name'] ?? '',
        sex: map['sex'] ?? '',
        numberPhone: map['numberPhone'] ?? '',
        email: map['email'] ?? '',
      );
}
