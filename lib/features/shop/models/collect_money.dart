class CollectMoney {
  final int idCollectMoney;
  final int idUser;
  final BigInt? sumCollect;

  CollectMoney(
      {required this.idCollectMoney, required this.idUser, this.sumCollect});

  factory CollectMoney.fromSQfliteDatabase(Map<String, dynamic> map) =>
      CollectMoney(
        idCollectMoney: map['idCollectMoney'] ?? 0,
        idUser: map['idUser'] ?? 0,
        sumCollect: map['sumCollect'],
      );
}
