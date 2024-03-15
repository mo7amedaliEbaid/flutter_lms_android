class AskreyaModel {
  final String startDate;
  final String endDate;
  final List num;

  AskreyaModel(
      {required this.startDate, required this.endDate, required this.num});
  factory AskreyaModel.fromJson(dynamic data) {
    return AskreyaModel(
      num: data['num'],
      startDate: data['startDate'],
      endDate: data['endDate'],
    );
  }
}
