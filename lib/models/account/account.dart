class UserAccount {
  final String id;
  final String username;
  final String password;
  final String fullName;
  final String avatar;
  final String phone;
  final String email;
  final String address;
  final int account_type;
  final int status;

  UserAccount(
      {
      required this.id,
      required this.fullName,
      required this.password,
      required this.username,
      required this.avatar,
      required this.phone,
      required this.email,
      required this.address,
      required this.account_type,
      required this.status
      
      });

  UserAccount.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
    fullName = json['fullName'],
    username = json['username'],
    password = json['password'],
    avatar = json['avatar'],
    phone = json['phone'],
    email = json['email'],
    address = json['address'],
    account_type = json['account_type'],
    status = json['status'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['fullName'] = fullName;
    data['username'] = username;
    data['password'] = password;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['account_type'] = account_type;
    data['status'] = status;
    return data;
  }
}
