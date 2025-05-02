import 'package:flutter/material.dart';

import '../../../mainPage/presentation/pages/about_page.dart';
import '../../../mainPage/presentation/pages/complaint_page.dart';
import '../../../mainPage/presentation/pages/contact_page.dart';
import '../../../products/presentation/pages/products_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavBarPage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    ProductsPage(),
    ContactPage(),

    ComplaintPage(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[

              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag , color: Colors.green,),
                label: 'Products',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_phone_outlined),
                activeIcon: Icon(Icons.contact_phone),
                label: 'Contact Us',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.report_problem_outlined),
                activeIcon: Icon(Icons.report_problem),
                label: 'Complaint',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_outlined),
                activeIcon: Icon(Icons.business),
                label: 'About',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}