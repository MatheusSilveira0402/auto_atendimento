import 'package:auto_atendimento/providers/route_providers.dart';
import 'package:flutter/material.dart';
import 'package:auto_atendimento/ui/size_extensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<Map<String, String>> products = [
    {"name": "Hamburguer", "image": "/images/burger.svg"},
    {"name": "Pizza", "image": "/images/pizza.svg"},
    {"name": "Coxinha", "image": "/images/snack.svg"},
    {"name": "Sorvete", "image": "/images/icecream.svg"},
  ];

  ProductList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            behavior: ScrollBehavior().copyWith(scrollbars: false),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<RouteProvider>(context, listen: false).changeRoute(
                        '/productDetails',
                        context,
                        arguments: {"name": products[index]["name"], "image": products[index]["image"]},
                      );
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 4.0,
                        margin: EdgeInsets.zero,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SvgPicture.asset(products[index]["image"]!, fit: BoxFit.cover, width: 105, height: 110,),
                            ),
                            SizedBox(height: 5),
                            Text(products[index]["name"]!, style: TextStyle(fontSize: 14)),
                          ],
                        ),
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
