import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ld_app/NavBar.dart';
import 'productos_model.dart';
import 'carrito.dart';

class ListaProduct extends StatefulWidget {
  @override
  State<ListaProduct> createState() => _ListaProductState();
}

class _ListaProductState extends State<ListaProduct> {
//#1creacion de listas de productos
  List<ProductosModel> productosModel = [];
  List<ProductosModel> carritoProducto = [];

  @override
  void initState() {
    super.initState(); // esto llamra a la base de datos de los productos
    produtosDB();
  }

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
        title:const Text('Little Dream',
          style:  TextStyle(
            color: Colors.white,
          ),
        ),
        /// crearemos el carrito que refejara la cantidad de cosas aprodcts agregados///
        actions: [
          Padding(padding:const EdgeInsets.only(right: 16, top: 8),
          child: GestureDetector(
            child:  Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Icon(FontAwesomeIcons.cartShopping, size: 28,),
                  if(carritoProducto.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: CircleAvatar(
                      radius: 11.5,
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                        child: Text(carritoProducto.length.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                        ),
                      ), 
                     ),
                ],
            ),
           onTap: () {
            // este onTap nos lleva a lista de carrito cargados
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                        Mi_carrito(carritoProducto)));
            },
          ),
          ),
        ],
      ), 

      body: cuadroProducto(),
      drawer: NavBar(),
    );
  }

  GridView cuadroProducto() {
    return GridView.builder(
        padding: const EdgeInsets.all(4),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: productosModel.length,
        itemBuilder: (context, index) {
          final String imagen = productosModel[index].image;
          var item = productosModel[index];

          return Card(
            elevation: 4,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'Asset/Image/$imagen',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          item.price.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            bottom: 8,
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: (!carritoProducto.contains(item))
                                  ? const Icon(
                                      FontAwesomeIcons.cartShopping,
                                      color: Colors.green,
                                      size: 28,
                                    )
                                  : const Icon(
                                      FontAwesomeIcons.cartShopping,
                                      color: Colors.red,
                                      size: 28,
                                    ),
                              onTap: () {
                                setState(() {
                                  if (!carritoProducto.contains(item)) {
                                    carritoProducto.add(item);
                                  } else {
                                    carritoProducto.remove(item);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void produtosDB() {
    var list = <ProductosModel>[
      for (int i = 1;
          i < 15;
          i++) // este for me permite repetir ProductModel varias veces
        ProductosModel(
            name: "ropita bb 0-3 meses",
            image: '../../Assets/Images/$i.jpg',
            price: 12500),
      /*  ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/2.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/3.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/4.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/5.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/6.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/7.jpg',
          price: 12500),
       ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/8.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/9.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/10.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/5.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/1.jpg',
          price: 12500),
           ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/8.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/9.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/10.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/5.jpg',
          price: 12500),
      ProductosModel(
          name: "ropita bb 0-3 meses",
          image:'../../Assets/Images/1.jpg',
          price: 12500), */
    ];
    setState(() {
      productosModel = list;
    });
  }
}
