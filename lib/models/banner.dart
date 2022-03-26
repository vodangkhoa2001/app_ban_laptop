class Banner {
  int? id;
  String? tenBanner;
  String? moTa;
  String? hinhAnh;
  int? trangThai;

  Banner({this.id, this.tenBanner, this.moTa, this.hinhAnh, this.trangThai});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenBanner = json['TenBanner'];
    moTa = json['MoTa'];
    hinhAnh = json['HinhAnh'];
    trangThai = json['TrangThai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TenBanner'] = this.tenBanner;
    data['MoTa'] = this.moTa;
    data['HinhAnh'] = this.hinhAnh;
    data['TrangThai'] = this.trangThai;
    return data;
  }
}
