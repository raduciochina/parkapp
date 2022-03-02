import 'package:flutter/material.dart';
import 'package:parkapp/Others/Bookings/bookings.dart';
import 'package:parkapp/Others/FindParking/find_parking.dart';
import 'package:parkapp/Others/More/more.dart';

class AppNavigation extends StatefulWidget {
  int _currentIndex;
  AppNavigation([this._currentIndex = 0]);
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final List<Widget> _children = [
    FindParking(),
    Bookings(),
    More(),
  ];

  final List<BottomNavigationBarItem> _bottomBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.local_parking,
        size: 22,
      ),
      label: 'Find',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Bookings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'More',
    ),
  ];

  void onTap(int index) {
    setState(() {
      widget._currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget._currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0.2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        items: _bottomBarItems,
        onTap: onTap,
      ),
      body: _children[widget._currentIndex],
    );
  }
}
