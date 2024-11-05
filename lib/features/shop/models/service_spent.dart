
class ServiceSpent{
  final int idServiceSpent;
  final String nameService;
  final String? explain;

  ServiceSpent({required this.idServiceSpent, required this.nameService, this.explain});

  factory ServiceSpent.fromSQfliteDatabase(Map<String, dynamic> map) => ServiceSpent(
    idServiceSpent: map['idServiceSpent'] ?? 0,
    nameService: map['nameService'] ?? '',
    explain: map['explain'] ?? '',
  );
}