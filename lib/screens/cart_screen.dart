import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrinho")),
      body: Center(child: Text("Seu carrinho está vazio", style: TextStyle(fontSize: 18))),
    );
  }
}
