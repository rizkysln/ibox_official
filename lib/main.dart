import 'package:flutter/material.dart';
import 'list_produk.dart';

void main() => runApp(iboxApp());

class iboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xiaomi Aplikasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}
