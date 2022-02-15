import 'package:ban_laptop/base_url.dart';
import 'package:ban_laptop/models/product/product1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/product/provider/product_provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SizedBox(
          width: 170,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  //padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(imgUrl +
                      '/59987_laptop_asus_expertbook_b9_b9400cea_kc0593t_den_tui_5.png'),
                ),
              ),
              Text(
                widget.product.TenSanPham,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.product.GiaBan} VNĐ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      //width: 28,
                      height: 28,
                      // decoration: const BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   //   color: Colors.blueGrey,
                      // ),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
