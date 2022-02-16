class UserAccount {
  String? id;
  String? fullName;
  String? avatar;
  String? phone;
  String? email;
  String? address;

  UserAccount(
      {this.id,
      this.fullName,
      this.avatar,
      this.phone,
      this.email,
      this.address});

  UserAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    avatar = json['avatar'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    return data;
  }
}
