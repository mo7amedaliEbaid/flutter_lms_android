// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'drawermodel.g.dart';

@JsonSerializable()
class drawermodel {
  String firstName;
  drawermodel({required this.firstName,});

  factory drawermodel.fromJson(Map<String, dynamic> json) => _$drawermodelFromJson(json);

  Map<String, dynamic> toJson() => _$drawermodelToJson(this);
}