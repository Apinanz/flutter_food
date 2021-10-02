import 'package:flutter/material.dart';

import 'foodList_page.dart';
import 'order_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Your Order'),
        ],
        currentIndex: _subPageIndex,
        onTap: (index) {
          setState(() {
            _subPageIndex = index;
          });
        },
      ),
      body: Container(child:_buildSubPage()),
    );
  }

  Widget? _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return FoodListPage();
      case 1:
        return OrderPage();
      default:
        return SizedBox.shrink();
    }
  }
}
