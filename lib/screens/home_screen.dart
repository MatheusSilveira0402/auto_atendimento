import 'package:auto_atendimento/ui/size_extensions.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/notifications_icon.dart';
import '../widgets/carousel.dart';
import '../widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [NotificationIcon()],
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(scrollbars: false,),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), 
          child: Center(
            child: Container(
              width: context.percentWidth(1),
              height: context.percentHeigth(1),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 30.0,
                children: [
                  CarouselWidget(), 
                  ProductList(title: "Os mais pedidos"), 
                  ProductList(title: "Maiores descontos"), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
