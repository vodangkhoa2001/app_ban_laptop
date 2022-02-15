class ProductType {
  late String id;
  late String TenDongSanPham;
  late int TrangThai;
  late String? createdAt;
  late String? updateAt;

  ProductType({
    required this.id,
    required this.TenDongSanPham,
    required this.TrangThai,
    this.createdAt,
    this.updateAt,
  });
  ProductType.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    TenDongSanPham = json["TenDongSanPham"];
    TrangThai = json["TrangThai_DongSanPham"];
    createdAt = json["created_at"];
    updateAt = json["updated_at"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['TenDongSanPham'] = TenDongSanPham;
    data['TrangThaiDongSanPham'] = TrangThai;
    data['created_at'] = createdAt;
    data['updated_at'] = updateAt;
    return data;
  }
}
