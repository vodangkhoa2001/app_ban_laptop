// ignore_for_file: unnecessary_this

class Invoice {
  String? id;
  String? maSP;
  String? maTaiKhoan;
  String? diaChiGiaoHang;
  String? sDTGiaoHang;
  int? tongTien;
  String? ghiChu;
  int? trangThoaiHoaDon;
  String? hinhAnh;
  String? tenSanPham;
  String? hoTen;
  int? soLuong;
  int? donGia;
  DateTime? createdAt;
  DateTime? updateAt;

  Invoice(
      {this.id,
      this.maSP,
      this.maTaiKhoan,
      this.diaChiGiaoHang,
      this.sDTGiaoHang,
      this.tongTien,
      this.trangThoaiHoaDon,
      this.hinhAnh,
      this.ghiChu,
      this.hoTen,
      this.tenSanPham,
      this.soLuong,
      this.donGia,
      this.createdAt,
      this.updateAt});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maSP = json['maSP'];
    maTaiKhoan = json['MaTaiKhoan'];
    diaChiGiaoHang = json['DiaChiGiaoHang'];
    sDTGiaoHang = json['SDT_GiaoHang'];
    tongTien = json['TongTien'];
    ghiChu = json['GhiChu'];
    trangThoaiHoaDon = json['TrangThai_HoaDon'];
    hinhAnh = json['HinhAnh'];
    tenSanPham = json['TenSanPham'];
    hoTen = json['HoTen'];
    soLuong = json['SoLuong'];
    donGia = json['GiaBan'];
    createdAt = json['created_at'];
    updateAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maSP'] = this.maSP;
    data['MaTaiKhoan'] = this.maTaiKhoan;
    data['DiaChiGiaoHang'] = this.diaChiGiaoHang;
    data['SDT_GiaoHang'] = this.sDTGiaoHang;
    data['GhiChu'] = this.ghiChu;
    data['TongTien'] = this.tongTien;
    data['TrangThai_HoaDon'] = this.trangThoaiHoaDon;
    data['HinhAnh'] = this.hinhAnh;
    data['TenSanPham'] = this.tenSanPham;
    data['HoTen'] = this.hoTen;
    data['SoLuong'] = this.soLuong;
    data['GiaBan'] = this.donGia;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updateAt;
    return data;
  }
}
