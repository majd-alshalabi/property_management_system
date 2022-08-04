class PropertyModel {
  int? id;
  String? name;
  String? description;
  int? roomnumber;
  String? state;
  int? price;
  String? local;
  int? lan;
  int? lat;
  String? photo;
  int? bathroom;
  int? bedroom;
  String? propertyType;
  int? userId;

  PropertyModel(
      {this.id,
      this.name,
      this.description,
      this.roomnumber,
      this.state,
      this.price,
      this.local,
      this.lan,
      this.lat,
      this.photo,
      this.bathroom,
      this.bedroom,
      this.propertyType,
      this.userId});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    roomnumber = json['roomnumber'];
    state = json['state'];
    price = json['price'];
    local = json['local'];
    lan = json['lan'];
    lat = json['lat'];
    photo = json['photo'];
    bathroom = json['bathroom'];
    bedroom = json['bedroom'];
    propertyType = json['propertyType'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['roomnumber'] = this.roomnumber;
    data['state'] = this.state;
    data['price'] = this.price;
    data['local'] = this.local;
    data['lan'] = this.lan;
    data['lat'] = this.lat;
    data['photo'] = this.photo;
    data['bathroom'] = this.bathroom;
    data['bedroom'] = this.bedroom;
    data['propertyType'] = this.propertyType;
    data['user_id'] = this.userId;
    return data;
  }
}
