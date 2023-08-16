import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ld_app/models/productos_model.dart';
import 'package:giffy_dialog/giffy_dialog.dart';





class Mi_carrito extends StatefulWidget {
  //
  final List<ProductosModel> cart;
  Mi_carrito(this.cart);

  @override
  State<Mi_carrito> createState() => _Mi_carritoState(this.cart);
}

class _Mi_carritoState extends State<Mi_carrito> {
  _Mi_carritoState(this.cart);
  List<ProductosModel> cart;

// variables que ayudan al scrolear el contenido
  final scrollController = ScrollController();
  var firstScroll = true;
  bool enable = false;

// Container del total de pago de los productos y su logica
  Container PagoTotal(List<ProductosModel> cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Color.fromARGB(255, 123, 179, 224),
      child:  Row(
        children: [
          Text("Total: 	₡ ${valorTotal(cart)}",
            style:const TextStyle(
                fontWeight:
                 FontWeight.bold, 
                 fontSize: 20,
                  color: Colors.black),
          )
        ],
      ),
    );
  }

  // creando variable String para mostrar el contenido de container y su logica
  String valorTotal(List<ProductosModel> listaPdoductos) {
    double total = 0.0;
    for (int i = 0; i < listaPdoductos.length; i++) {
      total = total + listaPdoductos[i].price * listaPdoductos[i].quantity;
    }
    return total.toStringAsFixed(2);
  }

  // diseño visual de la pagina de pedidos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
         /*  decoration:  BoxDecoration(
            gradient:  LinearGradient(colors: <Color>[
              Color.fromARGB(255, 13, 114, 117),
              Color.fromARGB(255, 170, 16, 5)
            ]),
          ), */
        ),
        title: const Text(
          'DETALLE DEL PEDIDO',
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        /// crearemos el carrito que refejara la cantidad de cosas aprodcts agregados///
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: GestureDetector(
              child: const Stack(
                alignment: Alignment.topCenter,
                children: [
                  Icon(
                    FontAwesomeIcons.file,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// cuerpo del contenido de los pedidos
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (enable && firstScroll) {
            scrollController
                .jumpTo(scrollController.position.pixels - details.delta.dy);
          }
        },
        onVerticalDragEnd: (_) {
          if (enable) firstScroll = false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final String imagen = cart[index].image;
                  var item = cart[index];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset('Assets/Images/$imagen',
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 6,
                                                color: Colors.blue,
                                                offset: Offset(0.0, 1.0),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                          ),
                                          margin: EdgeInsets.only(top: 20),
                                          padding: EdgeInsets.all(2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(height: 8),
                                              IconButton(
                                                onPressed: () {
                                                  removeProduct(index);
                                                  valorTotal(cart);
                                                },
                                                icon: const Icon(Icons.remove),
                                                color: Colors.white,
                                              ),
                                              Text(
                                                '${cart[index].quantity}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  addProduct(index);
                                                  valorTotal(cart);
                                                },
                                                icon: const Icon(Icons.add),
                                                color: Colors.yellow,
                                              ),
                                              const SizedBox(height: 8),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 38),
                                Text(
                                  item.price.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.deepPurple,
                      )
                    ],
                  );
                },
              ),
              const SizedBox(width: 10),
              PagoTotal(cart),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: 200,
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  child: const Text('Realizar Pedido',
                  style: const  TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 114, 160),
                  ),
                  onPressed: () => {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return GiffyDialog.image(
                            Image.asset(
                              "Assets/Images/osito2.gif",
                              height: 200,
                              fit: BoxFit.cover,
                                ),
                              title: const Text(
                              'TU PEDIDO ESTA LISTO PARA SER ENVIADO',
                              textAlign: TextAlign.center,
                                ),
                                content: const Text(
                              'Presiona OK para enviar el pedido al Whatsapp del proveedor, el se contactara contigo para cordinar entrega y pago.No necesitas ingresar tarjeta de credito',
                                textAlign: TextAlign.center,
                                ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'CANCELAR'),
                                child: const Text('CANCEL'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      )
                       
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // funciones para agregar o remover productos de lista de pedido y calcular el costo
  // llamados desde el onPressed de los IconButon de - y de +
  addProduct(int index) {
    setState(() {
      cart[index].quantity++;
    });
  }

  removeProduct(int index) {
    setState(() {
      cart[index].quantity--;
    });
  }
}

