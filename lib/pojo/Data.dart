class Data {
  int id;
  String floorId;
  String nameEn;
  String nameBn;
  String createdAt;
  String updatedAt;
  Floor floor;

  Data(
      {this.id,
      this.floorId,
      this.nameEn,
      this.nameBn,
      this.createdAt,
      this.updatedAt,
      this.floor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    floorId = json['floor_id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    floor = json['floor'] != null ? new Floor.fromJson(json['floor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['floor_id'] = this.floorId;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.floor != null) {
      data['floor'] = this.floor.toJson();
    }
    return data;
  }
}

class Floor {
  int id;
  String nameEn;
  String nameBn;
  String all;
  String createdAt;
  String updatedAt;

  Floor(
      {this.id,
      this.nameEn,
      this.nameBn,
      this.all,
      this.createdAt,
      this.updatedAt});

  Floor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    all = json['all'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['all'] = this.all;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
