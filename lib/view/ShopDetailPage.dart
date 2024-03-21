import 'package:flutter/material.dart';

class ShopDetailPage extends StatefulWidget {
  const ShopDetailPage({
    super.key,
  });

  @override
  State<ShopDetailPage> createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店名'),
      ),
      body: null,
    );
  }
}