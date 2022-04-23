class LoginResponse {
  bool? success;
  String? data;
  String? massage;

  LoginResponse({this.success, this.data, this.massage});

  LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    success = json['success'];
    data = json['data'];
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    data['massage'] = this.massage;
    return data;
  }
}
