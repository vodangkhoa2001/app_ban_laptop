// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ProductType {
  int? id;
  String? tenDongSanPham;
  int? trangThaiDongSanPham;

  ProductType({this.id, this.tenDongSanPham, this.trangThaiDongSanPham});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenDongSanPham = json['TenDongSanPham'];
    trangThaiDongSanPham = json['TrangThai_DongSanPham'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TenDongSanPham'] = this.tenDongSanPham;
    data['TrangThai_DongSanPham'] = this.trangThaiDongSanPham;
    return data;
  }
}
