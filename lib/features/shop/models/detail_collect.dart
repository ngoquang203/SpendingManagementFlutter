
class DetailCollect {
  final int idDetailCollect;
  final int idServiceCollect;
  final int idCollect;
  final BigInt price;
  final String content;
  final String date;
  final String time;

  DetailCollect(
      {required this.idDetailCollect,
        required this.idServiceCollect,
        required this.idCollect,
        required this.price,
        required this.content,
        required this.date,
        required this.time});

  factory DetailCollect.fromSqfliteDatabase(Map<String,dynamic> map) => DetailCollect(
    idDetailCollect: map['idDetailCollect'],
    idServiceCollect: map['idServiceCollect'],
    idCollect: map['idCollect'],
    price: map['price'],
    content: map['content'],
    date: DateTime.fromMillisecondsSinceEpoch(map['date']).toIso8601String(),
    time: DateTime.fromMillisecondsSinceEpoch(map['time']).toIso8601String(),
  );
}
