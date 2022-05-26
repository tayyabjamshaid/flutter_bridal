import 'package:bridal_stylish/pages/appointments/appointmentApi.dart';
import 'package:bridal_stylish/pages/appointments/appointmentsBody.dart';

import 'package:bridal_stylish/pages/catalogs/catalogsBody.dart';
import 'package:bridal_stylish/pages/checkout.dart';
import 'package:bridal_stylish/pages/index.dart';
import 'package:bridal_stylish/pages/homeBody.dart';
import 'package:flutter/material.dart';


class showBody2 extends StatefulWidget {
  const showBody2({ Key? key }) : super(key: key);



  @override
  _showBody2State createState() => _showBody2State();
}

class _showBody2State extends State<showBody2> {
   int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
static const _pages = <Widget>[

showBody(),
checkOut(),
showAppointments(),

catalogs()


];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

 
 Widget build(BuildContext context) {
    return Scaffold(
    body:   _pages.elementAt(_selectedIndex),
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Checkout',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Appointments',
          ),
        
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
         selectedFontSize: 15,
        unselectedFontSize: 15,
        onTap: _onItemTapped,
      ),
    );
  }
}


