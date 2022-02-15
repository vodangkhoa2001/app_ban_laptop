class Product {
  late String id;
  late String TenSanPham;
  late int GiaNhap;
  late int GiaBan;
  late int SoLuong;
  late String MaNhaSanXuat;
  late String MaDongSanPham;
  late String HinhAnh;
  late String MoTa;
  late String? createdAt;
  late String? updateAt;

  Product({
    required this.id,
    required this.TenSanPham,
    required this.GiaBan,
    required this.GiaNhap,
    required this.SoLuong,
    required this.MaNhaSanXuat,
    required this.MaDongSanPham,
    required this.HinhAnh,
    required this.MoTa,
    this.createdAt,
    this.updateAt,
  });
  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    TenSanPham = json["TenSanPham"];
    GiaNhap = json["GiaNhap"];
    GiaBan = json["GiaBan"];
    SoLuong = json["SoLuong"];
    MaNhaSanXuat = json["MaNhaSanXuat"];
    MaDongSanPham = json["MaDongSanPham"];
    HinhAnh = json["HinhAnh"];
    MoTa = json["MoTa"];
    createdAt = json["created_at"];
    updateAt = json["updated_at"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['TenSanPham'] = TenSanPham;
    data['GiaNhap'] = GiaNhap;
    data['GiaBan'] = GiaBan;
    data['SoLuong'] = SoLuong;
    data['MaNhaSanXuat'] = MaNhaSanXuat;
    data['MaDongSanPham'] = MaDongSanPham;
    data['HinhAnh'] = HinhAnh;
    data['MoTa'] = MoTa;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}
