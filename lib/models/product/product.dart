class Product {
  String? id;
  int? maDongSanPham;
  String? tenSanPham;
  int? giaNhap;
  int? giaBan;
  int? soLuong;
  int? maNhaSanXuat;
  String? hinhAnh;
  String? moTa;
  String? tenMau;
  String? tenOCung;
  String? tenRam;
  String? tenManHinh;
  String? tenCPU;

  Product(
      {this.id,
      this.maDongSanPham,
      this.tenSanPham,
      this.giaNhap,
      this.giaBan,
      this.soLuong,
      this.maNhaSanXuat,
      this.hinhAnh,
      this.moTa,
      this.tenMau,
      this.tenOCung,
      this.tenRam,
      this.tenManHinh,
      this.tenCPU});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maDongSanPham = json['MaDongSanPham'];
    tenSanPham = json['TenSanPham'];
    giaNhap = json['GiaNhap'];
    giaBan = json['GiaBan'];
    soLuong = json['SoLuong'];
    maNhaSanXuat = json['MaNhaSanXuat'];
    hinhAnh = json['HinhAnh'];
    moTa = json['MoTa'];
    tenMau = json['TenMau'];
    tenOCung = json['TenOCung'];
    tenRam = json['TenRam'];
    tenManHinh = json['TenManHinh'];
    tenCPU = json['TenCPU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['MaDongSanPham'] = this.maDongSanPham;
    data['TenSanPham'] = this.tenSanPham;
    data['GiaNhap'] = this.giaNhap;
    data['GiaBan'] = this.giaBan;
    data['SoLuong'] = this.soLuong;
    data['MaNhaSanXuat'] = this.maNhaSanXuat;
    data['HinhAnh'] = this.hinhAnh;
    data['MoTa'] = this.moTa;
    data['TenMau'] = this.tenMau;
    data['TenOCung'] = this.tenOCung;
    data['TenRam'] = this.tenRam;
    data['TenManHinh'] = this.tenManHinh;
    data['TenCPU'] = this.tenCPU;
    return data;
  }
}
