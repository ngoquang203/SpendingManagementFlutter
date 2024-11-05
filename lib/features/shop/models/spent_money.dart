
class SpentMoney{
  final int idSpentMoney;
  final int idUser;
  final BigInt? sumSpent;

  SpentMoney({required this.idSpentMoney,required this.idUser, this.sumSpent});

  factory SpentMoney.fromSQfliteDatabase(Map<String, dynamic> map) => SpentMoney(
    idSpentMoney: map['idSpentMoney'] ?? 0,
    idUser: map['idUser'] ?? 0,
    sumSpent: map['sumSpent'] ?? 0,
  );
}