class DetailSpent {
  final int idDetailSpent;
  final int idServiceSpent;
  final int idSpent;
  final BigInt price;
  final String content;
  final String date;
  final String time;

  DetailSpent(
      {required this.idDetailSpent,
      required this.idServiceSpent,
      required this.idSpent,
      required this.price,
      required this.content,
      required this.date,
      required this.time});

  factory DetailSpent.fromSqfliteDatabase(Map<String,dynamic> map) => DetailSpent(
    idDetailSpent: map['idDetailSpent'],
    idServiceSpent: map['idServiceSpent'],
    idSpent: map['idSpent'],
    price: map['price'],
    content: map['content'],
    date: DateTime.fromMillisecondsSinceEpoch(map['date']).toIso8601String(),
    time: DateTime.fromMillisecondsSinceEpoch(map['time']).toIso8601String(),
  );
}
