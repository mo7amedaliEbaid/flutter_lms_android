class DoctorsModel {
  final String fristName;
  final String lastName;
  final String image;

  DoctorsModel(
      {required this.fristName, required this.lastName, required this.image});
  factory DoctorsModel.fromJson(dynamic data) {
    return DoctorsModel(
        fristName: data['fristName'],
        lastName: data['lastName'],
        image: data['image']);
  }
}
