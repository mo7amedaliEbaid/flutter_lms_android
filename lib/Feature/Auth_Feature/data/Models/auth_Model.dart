class AuthModel {
  final String id;
  final String f_Name;
  final String l_Name;
  final String section;
  final String squad;
  final String studyCase;
  final String specialization;
  final String token;
  final List? committeeNumber;
  List? seatingNumbers;
  List? markers;
  List? backwards;
  List? committee;
  AuthModel(
      {required this.committeeNumber,
      required this.token,
      required this.f_Name,
      required this.l_Name,
      required this.id,
      required this.section,
      this.seatingNumbers,
      required this.specialization,
      required this.squad,
      required this.markers,
      required this.committee,
      required this.backwards,
      required this.studyCase});
  factory AuthModel.fromJson(dynamic data) {
    return AuthModel(
        committeeNumber: data['user']['committeeNumber'] ?? [0],
        seatingNumbers: data['user']['seatingNumbers'] ?? [0],
        token: data['token'],
        section: data['user']['section'],
        specialization: data['user']['specialization'],
        squad: data['user']['squad'],
        studyCase: data['user']['studyCase'],
        f_Name: data['user']['fristName'],
        l_Name: data['user']['lastName'],
        markers:data['user']['markers'],
        committee:data['user']['committe'],
        backwards:data['user']['backwards'],
        id: data['user']['_id']);
  }
}
