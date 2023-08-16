import 'package:flutter/material.dart';
import 'package:ld_app/NavBar.dart';
import './models/ListaProducto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Little Dream',
      home: MyHomePage(title: 'Little Dream Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromARGB(255, 13, 114, 117),
              Color.fromARGB(255, 170, 16, 5)
            ]),
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
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
      ),  */
      //------cuerpo de la app----//
      drawer: NavBar(),
      body: ListaProduct(), // cargara las imagenes de los prductos
    );
  }
}
