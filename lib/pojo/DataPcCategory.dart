class DataPcCategory {
  int id;
  String productcategoryId;
  String shopcategoryId;
  String shopId;
  String nameEn;
  String nameBn;
  String image;
  String priceEn;
  String priceBn;
  String quantityEn;
  String quantityBn;
  String discountEn;
  Null discountBn;
  String sizeEn;
  Null sizeBn;
  String colorEn;
  Null colorBn;
  String warrantyEn;
  Null warrantyBn;
  String descriptionEn;
  Null descriptionBn;
  Null rating;
  String buyingDate;
  Null expireDate;
  String createdAt;
  String updatedAt;
  Shop shop;
  Shopcategory shopcategory;
  Productcategory productcategory;

  DataPcCategory(
      {this.id,
      this.productcategoryId,
      this.shopcategoryId,
      this.shopId,
      this.nameEn,
      this.nameBn,
      this.image,
      this.priceEn,
      this.priceBn,
      this.quantityEn,
      this.quantityBn,
      this.discountEn,
      this.discountBn,
      this.sizeEn,
      this.sizeBn,
      this.colorEn,
      this.colorBn,
      this.warrantyEn,
      this.warrantyBn,
      this.descriptionEn,
      this.descriptionBn,
      this.rating,
      this.buyingDate,
      this.expireDate,
      this.createdAt,
      this.updatedAt,
      this.shop,
      this.shopcategory,
      this.productcategory});

  DataPcCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productcategoryId = json['productcategory_id'];
    shopcategoryId = json['shopcategory_id'];
    shopId = json['shop_id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    image = json['image'];
    priceEn = json['price_en'];
    priceBn = json['price_bn'];
    quantityEn = json['quantity_en'];
    quantityBn = json['quantity_bn'];
    discountEn = json['discount_en'];
    discountBn = json['discount_bn'];
    sizeEn = json['size_en'];
    sizeBn = json['size_bn'];
    colorEn = json['color_en'];
    colorBn = json['color_bn'];
    warrantyEn = json['warranty_en'];
    warrantyBn = json['warranty_bn'];
    descriptionEn = json['description_en'];
    descriptionBn = json['description_bn'];
    rating = json['rating'];
    buyingDate = json['buying_date'];
    expireDate = json['expire_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    shopcategory = json['shopcategory'] != null
        ? new Shopcategory.fromJson(json['shopcategory'])
        : null;
    productcategory = json['productcategory'] != null
        ? new Productcategory.fromJson(json['productcategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productcategory_id'] = this.productcategoryId;
    data['shopcategory_id'] = this.shopcategoryId;
    data['shop_id'] = this.shopId;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['image'] = this.image;
    data['price_en'] = this.priceEn;
    data['price_bn'] = this.priceBn;
    data['quantity_en'] = this.quantityEn;
    data['quantity_bn'] = this.quantityBn;
    data['discount_en'] = this.discountEn;
    data['discount_bn'] = this.discountBn;
    data['size_en'] = this.sizeEn;
    data['size_bn'] = this.sizeBn;
    data['color_en'] = this.colorEn;
    data['color_bn'] = this.colorBn;
    data['warranty_en'] = this.warrantyEn;
    data['warranty_bn'] = this.warrantyBn;
    data['description_en'] = this.descriptionEn;
    data['description_bn'] = this.descriptionBn;
    data['rating'] = this.rating;
    data['buying_date'] = this.buyingDate;
    data['expire_date'] = this.expireDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    if (this.shopcategory != null) {
      data['shopcategory'] = this.shopcategory.toJson();
    }
    if (this.productcategory != null) {
      data['productcategory'] = this.productcategory.toJson();
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

class Shopcategory {
  int id;
  String nameEn;
  String nameBn;
  String createdAt;
  String updatedAt;

  Shopcategory(
      {this.id, this.nameEn, this.nameBn, this.createdAt, this.updatedAt});

  Shopcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Productcategory {
  int id;
  String shopId;
  String nameEn;
  String nameBn;
  String createdAt;
  String updatedAt;

  Productcategory(
      {this.id,
      this.shopId,
      this.nameEn,
      this.nameBn,
      this.createdAt,
      this.updatedAt});

  Productcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}