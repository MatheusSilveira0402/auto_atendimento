import 'package:auto_atendimento/widgets/custom_appbar.dart';
import 'package:auto_atendimento/widgets/notifications_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> produtos = [
    {"nome": "Hamburguer", "imagem": "assets/images/burger.png"},
    {"nome": "Pizza", "imagem": "assets/images/pizza.png"},
    {"nome": "Coxinha", "imagem": "assets/images/snack.png"},
    {"nome": "Sorvete", "imagem": "assets/images/icecream.png"},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "O que você quer comer?",
        actions: [NotificationIcon()],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, '/detail', arguments: produtos[index]);
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          produtos[index]["imagem"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        produtos[index]["nome"]!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
