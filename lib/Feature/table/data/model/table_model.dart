class TableModel {
  final String day;
  final List<dynamic> data;

  TableModel({required this.day, required this.data});
  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(day: json['name'], data: json['data']);
  }
}

class Tabledata {
  final String subjName;
  final String docName;
  final String time;

  Tabledata(
      {required this.subjName, required this.docName, required this.time});
  factory Tabledata.fromJson(dynamic data) {
    return Tabledata(
        subjName: data['subjName'],
        docName: data['docName'],
        time: data['time']);
  }
}
