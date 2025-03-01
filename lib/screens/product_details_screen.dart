import 'package:auto_atendimento/ui/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final String image;

  const ProductDetailsScreen({super.key, required this.name, required this.image});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1; // Inicia com 1 unidade
  double _unitPrice = 10.0; // Preço fixo do produto

  String getFormattedPrice() {
    double total = _unitPrice * _quantity;
    return NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(total);
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 10) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: context.percentWidth(0.4) ,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: _decreaseQuantity,
                  ),
                  Text('$_quantity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: _increaseQuantity,
                  ),
                ],
              ),
            ),
            Container(
              width: context.percentWidth(0.5),
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ADICIONAR".toUpperCase()),
                      Text(getFormattedPrice()), // Preço atualizado
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              widget.image,
              fit: BoxFit.cover,
              width: context.screenWidth,
              height: context.percentHeigth(0.5) + 50,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Descrição do produto"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
