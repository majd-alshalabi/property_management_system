class MyIdentity {
  int? id;
  String? name;
  String? token;
  String? email;

  MyIdentity({this.id, this.name, this.token, this.email});

  MyIdentity copyWith({String? token, int? id, String? name, String? email}) =>
      MyIdentity(
          id: id ?? this.id,
          token: token ?? this.token,
          name: name ?? this.name,
          email: email ?? this.email);

  MyIdentity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['token'] = this.token;
    data['email'] = this.email;
    return data;
  }

  factory MyIdentity.fromMap(Map<String, dynamic> json) => MyIdentity(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        token: json["token"] == null ? null : json["token"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "token": token == null ? null : token,
        "email": email == null ? null : email,
      };
}
