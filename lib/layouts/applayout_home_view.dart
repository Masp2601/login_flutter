import 'package:flutter/material.dart';


class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _GetNavigatorBarState();
}

class _GetNavigatorBarState extends State<NavigatorBar> {
  int _indiceSeleccionado = 0;

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _indiceSeleccionado = index;
    });
  }

  static final List<Widget> _widgetOptions = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_indiceSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed, // Fixed
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 30,
            ),
            label: "Record",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _indiceSeleccionado,
        selectedItemColor: const Color.fromRGBO(229, 86, 39, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
