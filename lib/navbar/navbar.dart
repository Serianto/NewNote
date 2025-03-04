import 'package:aplikasi/home/home.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home : NavBar());
  }
}
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// ignore: unused_element
class _NavBarState extends State<Navbar>{
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(email: '', phone: '',),
  ];

  // ignore: unused_element
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,

      
      ),
    );
  }
}