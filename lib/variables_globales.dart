//Esta clase sera usada en la pagina principal para la creacion de productos

class ListaProductos {
  final String? nombre;
  final String? imagen;
  final int? id;
  late final bool? isAdd;

  ListaProductos({required this.nombre, required this.imagen, required this.id, required this.isAdd});
}