import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBar_costum extends StatelessWidget {
  const AppBar_costum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromARGB(255, 13, 114, 117),
              Color.fromARGB(255, 170, 16, 5)
            ]),
          ),
        ),
        title: const Text(
          'nombre generico',
          style:  TextStyle(
            color: Colors.white,
          ),
        ),
        /// crearemos el carrito que refejara la cantidad de cosas aprodcts agregados///
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16, top: 8),
          child: GestureDetector(
            child: const Stack(
                alignment: Alignment.topCenter,
                children: [
                  Icon(FontAwesomeIcons.cartShopping, size: 28,), 
                ],
            ),
          ),
          ),
        ],
      ),  
    ) ;
  }
}