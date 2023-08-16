import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import './models/ListaProducto.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(''),
            accountEmail: const Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'Assets/Images/LD-logo.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSUScQp6lVMkpgoUmEH44G1glpAWpDf78rRobpsKvOVQPrVt7bAi25p2V9OS8mdxouTdI&usqp=CAU')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_florist),
            title: const Text('Articulos Damas'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                        ListaProduct()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_esports),
            title: const Text('Articulos Hombres'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                           ListaProduct()));
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.babyCarriage),
            title: const Text('Bebes y niños'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListaProduct()));
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.cat),
            title: const Text('Mascotas'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                        ListaProduct()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bubble_chart),
            title: const Text('Curiosidades & Tendencias'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListaProduct()));
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.bolt),
            title: const Text('Promos Relampago'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                        ListaProduct()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {
              
            },
          ),
           ListTile(
            leading: const Icon(FontAwesomeIcons.truckFast,),
            title: const Text('Envios'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () {
              FlutterExitApp.exitApp(iosForceExit: true);
            },
          ),
        ],
      ),
    );
  }
}
