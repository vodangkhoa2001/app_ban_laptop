// ignore_for_file: non_constant_identifier_names

class Product {
  late String id;
  late String TenSanPham;
  late int GiaNhap;
  late int GiaBan;
  late int SoLuong;
  late int MaNhaSanXuat;
  late int MaDongSanPham;
  late String HinhAnh;
  late String MoTa;
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
    return data;
  }
}
