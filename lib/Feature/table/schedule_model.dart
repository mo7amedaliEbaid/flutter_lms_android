/*
class Schedule {
  String? sId;
  String? type;
  String? classRoom;
  String? academicDivision;
  List<Days>? days;
  int? iV;

  Schedule(
      {this.sId,
        this.type,
        this.classRoom,
        this.academicDivision,
        this.days,
        this.iV});

  Schedule.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    classRoom = json['classRoom'];
    academicDivision = json['academicDivision'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['classRoom'] = this.classRoom;
    data['academicDivision'] = this.academicDivision;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Days {
  String? name;
  List<Data>? data;

  Days({this.name, this.data});

  Days.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? subjName;
  String? docName;
  String? time;

  Data({this.subjName, this.docName, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    subjName = json['subjName'];
    docName = json['docName'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjName'] = this.subjName;
    data['docName'] = this.docName;
    data['time'] = this.time;
    return data;
  }
}*/
