import 'package:auto_atendimento/ui/size_extensions.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<Map<String, String>> products = [
    {"name": "Hamburguer", "image": "assets/images/burger.png"},
    {"name": "Pizza", "image": "assets/images/pizza.png"},
    {"name": "Coxinha", "image": "assets/images/snack.png"},
    {"name": "Sorvete", "image": "assets/images/icecream.png"},
  ];

  ProductList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          width: context.percentWidth(0.9),
          height: 140,
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false), // Esconde a barra de rolagem
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(), // Mantém rolagem fluida
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                      elevation: 4.0,
                      margin: EdgeInsets.zero,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(products[index]["image"]!,)
                          ),
                          Text(products[index]["name"]!, style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
