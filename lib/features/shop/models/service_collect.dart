
class ServiceCollect{
  final int idServiceCollect;
  final String nameService;
  final String? explain;

  ServiceCollect({required this.idServiceCollect, required this.nameService, this.explain});

  factory ServiceCollect.fromSQfliteDatabase(Map<String, dynamic> map) => ServiceCollect(
    idServiceCollect: map['idServiceCollect'] ?? 0,
    nameService: map['nameService'] ?? '',
    explain: map['explain'] ?? '',
  );
}