import 'package:bali_arcade/pojo/DataPc.dart';

class ResponseShopPC {
  String name;
  List<DataPc> data;

  ResponseShopPC({this.name, this.data});

  ResponseShopPC.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['data'] != null) {
      data = new List<DataPc>();
      json['data'].forEach((v) {
        data.add(new DataPc.fromJson(v));
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