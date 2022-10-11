import 'package:flutter/material.dart';
import 'package:carrito_v3/carrito.dart';
import 'package:carrito_v3/variables_globales.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const principal(),
    );
  }
}

class principal extends StatefulWidget {
  const principal({Key? key}) : super(key: key);

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  //creamos la funcion lista la cual usara los objetos de ListaProductos pra la creacionde productos
  List<ListaProductos> _lista = <ListaProductos>[];

  final List<ListaProductos> _listacarrito = <ListaProductos>[];

  @override
  //usamos el metodo initState para crear el producto 1 vez
  void initState() {
    super.initState();
    _productos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar de la pagina
      //contiene un boton para acceder automaticamente al carrito de compras siempre y cuando
      //el cliente añada un producto si no lo añade no podra acceder al carrito
      appBar: AppBar(
        title: const Text("Productos"),
        actions: [
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    if (_listacarrito.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => carrito(_listacarrito),
                        ),
                      );
                    }
                  }),
            ],
          )
        ],
      ),
      body:
      //usamos ListView para la creacion de la lista principal de productos
      ListView.builder(
          itemCount: _lista.length,
          itemBuilder: (context, index) {
            //cada producto estara dentro de una card
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Creamos un container en el cual almacenaremos la imagen

                    Container(
                      width: 75,
                      height: 75,
                      child: Image(
                        image: NetworkImage(
                          _lista[index].imagen.toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    //Dentro del Exopanden encontraremos el titulo principaldel producto
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                _lista[index].nombre.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          //Con setState aremos el cabio de estado dentro la lista de carrito esto es para inclui
                          //los productos en la lista del carro
                          setState(() {
                            if (_lista[index].isAdd!) {
                            } else {
                              _listacarrito.add(_lista[index]);
                              _lista[index].isAdd = true;
                            }
                          });
                        },
                      icon: Icon( Icons.add_circle_outline),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _productos() {
    var list = <ListaProductos>[
      //Creamos los productos por el constructor de la clase ListaProductos
      ListaProductos(nombre: 'Arandanos', imagen: 'Imagen/fruta0.jpg', id: 1, isAdd: false),
      ListaProductos(nombre: 'Fresas', imagen: 'Imagen/fruta1.jpg', id: 2, isAdd: false),
      ListaProductos(nombre: 'Mandarina', imagen: 'Imagen/fruta2.jpg', id: 3, isAdd: false),
      ListaProductos(nombre: 'Pera', imagen: 'Imagen/fruta3.jpg', id: 4, isAdd: false),
      ListaProductos(nombre: 'Piña', imagen: 'Imagen/fruta4.jpg', id: 5, isAdd: false),
      ListaProductos(nombre: 'Mandarina', imagen: 'Imagen/fruta5.jpg', id: 6, isAdd: false),

    ];
    setState(() {
      //_list recibira el listado de productos para ser utilizado en las funciones principales del codigo
      _lista = list;
    });
  }
}










