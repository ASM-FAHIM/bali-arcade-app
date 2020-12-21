class DataPc {
  int id;
  String shopId;
  String nameEn;
  String nameBn;
  String createdAt;
  String updatedAt;
  Shop shop;

  DataPc(
      {this.id,
      this.shopId,
      this.nameEn,
      this.nameBn,
      this.createdAt,
      this.updatedAt,
      this.shop});

  DataPc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    return data;
  }
}

class Shop {
  int id;
  String nameEn;
  String nameBn;
  String shopcategoryId;
  String floorId;
  String phoneEn;
  String phoneBn;
  Null open;
  String image;
  Null descriptionEn;
  Null descriptionBn;
  Null ownerEn;
  Null ownerBn;
  String createdAt;
  String updatedAt;

  Shop(
      {this.id,
      this.nameEn,
      this.nameBn,
      this.shopcategoryId,
      this.floorId,
      this.phoneEn,
      this.phoneBn,
      this.open,
      this.image,
      this.descriptionEn,
      this.descriptionBn,
      this.ownerEn,
      this.ownerBn,
      this.createdAt,
      this.updatedAt});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    shopcategoryId = json['shopcategory_id'];
    floorId = json['floor_id'];
    phoneEn = json['phone_en'];
    phoneBn = json['phone_bn'];
    open = json['open'];
    image = json['image'];
    descriptionEn = json['description_en'];
    descriptionBn = json['description_bn'];
    ownerEn = json['owner_en'];
    ownerBn = json['owner_bn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['shopcategory_id'] = this.shopcategoryId;
    data['floor_id'] = this.floorId;
    data['phone_en'] = this.phoneEn;
    data['phone_bn'] = this.phoneBn;
    data['open'] = this.open;
    data['image'] = this.image;
    data['description_en'] = this.descriptionEn;
    data['description_bn'] = this.descriptionBn;
    data['owner_en'] = this.ownerEn;
    data['owner_bn'] = this.ownerBn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}