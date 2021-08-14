import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/price.dart';
import 'package:grocery_app/controler/home_controler.dart';
import 'package:grocery_app/details/details_screen.dart';
import 'package:grocery_app/models/products.dart';

import '../constants.dart';
import 'components/home_header.dart';
import 'components/products.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(defaultPadding * 1.5),
                        bottomRight: Radius.circular(defaultPadding * 1.5),
                      )),
                  child: GridView.builder(
                    itemCount: demoProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: defaultPadding,
                      crossAxisSpacing: defaultPadding,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: demoProducts[index],
                      press: () {

                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    FadeTransition(
                              opacity: animation,
                              child: DetailsScreen(
                                product: demoProducts[index],
                                onProductAdd: () {
                                  controller.addProductToCart(demoProducts[index]);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
