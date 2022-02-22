class Invoice {
  String? id;
  String? maTaiKhoan;
  String? diaChiGiaoHang;
  String? sDTGiaoHang;
  int? tongTien;
  int? trangThoaiHoaDon;
  String? hinhAnh;
  String? tenSanPham;
  String? hoTen;
  int? soLuong;
  int? donGia;
  DateTime? createdAt;

  Invoice(
      {this.id,
      this.maTaiKhoan,
      this.diaChiGiaoHang,
      this.sDTGiaoHang,
      this.tongTien,
      this.trangThoaiHoaDon,
      this.hinhAnh,
      this.hoTen,
      this.tenSanPham,
      this.soLuong,
      this.donGia,
      this.createdAt});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maTaiKhoan = json['MaTaiKhoan'];
    diaChiGiaoHang = json['DiaChiGiaoHang'];
    sDTGiaoHang = json['SDT_GiaoHang'];
    tongTien = json['TongTien'];
    trangThoaiHoaDon = json['TrangThoai_HoaDon'];
    hinhAnh = json['HinhAnh'];
    tenSanPham = json['TenSanPham'];
    hoTen = json['HoTen'];
    soLuong = json['SoLuong'];
    donGia = json['GiaNhap'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['MaTaiKhoan'] = this.maTaiKhoan;
    data['DiaChiGiaoHang'] = this.diaChiGiaoHang;
    data['SDT_GiaoHang'] = this.sDTGiaoHang;
    data['TongTien'] = this.tongTien;
    data['TrangThoai_HoaDon'] = this.trangThoaiHoaDon;
    data['HinhAnh'] = this.hinhAnh;
    data['TenSanPham'] = this.tenSanPham;
    data['HoTen'] = this.hoTen;
    data['SoLuong'] = this.soLuong;
    data['GiaNhap'] = this.donGia;
    data['created_at'] = this.createdAt;
    return data;
  }
}
