import 'DataPcCategory.dart';

class ResponsePCbyCategory {
  String name;
  List<DataPcCategory> data;

  ResponsePCbyCategory({this.name, this.data});

  ResponsePCbyCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['data'] != null) {
      data = new List<DataPcCategory>();
      json['data'].forEach((v) {
        data.add(new DataPcCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}