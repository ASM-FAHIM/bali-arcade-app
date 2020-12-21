import 'package:bali_arcade/pojo/ShopCategoryData.dart';

class ResponseShopCategory {
  String name;
  List<ShopCatData> data;

  ResponseShopCategory({this.name, this.data});

  ResponseShopCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['data'] != null) {
      data = new List<ShopCatData>();
      json['data'].forEach((v) {
        data.add(new ShopCatData.fromJson(v));
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
