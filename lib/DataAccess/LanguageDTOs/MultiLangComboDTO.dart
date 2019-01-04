
import 'package:json_annotation/json_annotation.dart';
class MultiLangComboDTO{
  int dilId;
  String dilAdi;
MultiLangComboDTO({this.dilId,this.dilAdi});

factory MultiLangComboDTO.fromJson(Map<String, dynamic> json) {

  return MultiLangComboDTO(
    dilId: json['dilId'],
    dilAdi: json['tanim']
  );
}
}
