class DataFoodMenu {
  int id;
  String restaurantId;
  String nameEn;
  String nameBn;
  String image;
  String createdAt;
  String updatedAt;
  Restaurant restaurant;

  DataFoodMenu(
      {this.id,
      this.restaurantId,
      this.nameEn,
      this.nameBn,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.restaurant});

  DataFoodMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    return data;
  }
}

class Restaurant {
  int id;
  String nameEn;
  String nameBn;
  String restaurantcategoryId;
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

  Restaurant(
      {this.id,
      this.nameEn,
      this.nameBn,
      this.restaurantcategoryId,
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

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    restaurantcategoryId = json['restaurantcategory_id'];
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
    data['restaurantcategory_id'] = this.restaurantcategoryId;
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
