import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'produk.dart';
import 'detail_produk.dart';

class ProductList extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Apple iPhone 13 128GB, Pink',
      description:
          'Apple iPhone 13 128GB dalam warna Pink adalah pilihan yang menawan bagi pengguna...',
      price: 9999000,
      imageUrls: [
        'assets/images/kerupuk1.jpg',
        'assets/images/kerupuk2.jpg',
        'assets/images/kerupuk3.jpg',
      ],
      officialWebsiteUrl:
          'https://shopee.co.id/Apple-iPhone-13-128GB-Pink-i.241308147.8995971618',
    ),
    // Daftar produk lainnya
  ];

  String formatCurrency(double amount) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return format.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk - produk'),
        backgroundColor: Colors.grey[700],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: products[index]),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      products[index].imageUrls.isNotEmpty ? products[index].imageUrls[0] : 'assets/images/default_image.jpg', // Gambar default jika list kosong
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(130, 0, 0, 0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            formatCurrency(products[index].price),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey.shade900, // Latar belakang hitam/dark grey
    );
  }
}
