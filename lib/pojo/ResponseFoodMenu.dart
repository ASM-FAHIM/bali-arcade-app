import 'DataFoodMenu.dart';

class ResponseFoodMenu {
  String name;
  List<DataFoodMenu> data;

  ResponseFoodMenu({this.name, this.data});

  ResponseFoodMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['data'] != null) {
      data = new List<DataFoodMenu>();
      json['data'].forEach((v) {
        data.add(new DataFoodMenu.fromJson(v));
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