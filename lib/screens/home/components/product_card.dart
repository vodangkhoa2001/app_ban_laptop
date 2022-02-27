// import 'package:ban_laptop/models/product/product.dart';
// import 'package:flutter/material.dart';
// class ProductCard extends StatefulWidget {
//   const ProductCard({Key? key, }) : super(key: key);

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   @override
//   // Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(left: 8),
//         child: SizedBox(
//           width: 170,
//           child: Column(
//             children: [
//               AspectRatio(
//                 aspectRatio: 1.02,
//                 child: Container(
//                   //padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Image.network(widget.hinhAnh.toString()),
//                 ),
//               ),
//               Text(
//                 widget.product.tenSanPham.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//                 maxLines: 2,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${widget.product.giaBan} VNĐ",
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.red),
//                   ),
//                   InkWell(
//                     borderRadius: BorderRadius.circular(30),
//                     onTap: () {},
//                     child: Container(
//                       padding: const EdgeInsets.only(right: 10),
//                       //width: 28,
//                       height: 28,
//                       // decoration: const BoxDecoration(
//                       //   shape: BoxShape.circle,
//                       //   //   color: Colors.blueGrey,
//                       // ),
//                       child: const Icon(
//                         Icons.shopping_cart,
//                         size: 25,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
