class Cart {
  String? maSanPham;
  int? soLuong;

  Cart({this.maSanPham, this.soLuong});

  Cart.fromJson(Map<String, dynamic> json) {
    maSanPham = json['maSanPham'];
    soLuong = json['soLuong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maSanPham'] = this.maSanPham;
    data['soLuong'] = this.soLuong;
    return data;
  }
}
