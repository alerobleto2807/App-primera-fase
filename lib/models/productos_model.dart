// esta clase se encarga de la logica del negocio 

class ProductosModel {
  final String name;
  final String image;
  final int price;
  int quantity;

  ProductosModel({required this.name, required this.image, required this.price, this.quantity = 1});
}