import 'dart:convert';
import 'package:flutter/material.dart';
import 'foodList_page.dart';
import 'order_page.dart';
import 'package:http/http.dart' as http;

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
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchFoods,
        child: Icon(Icons.add),
      ),
      body: Container(child: _buildSubPage()),
    );
  }

  Future<void> _fetchFoods() async {
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      List<dynamic> data = jsonBody['data'];
      print(status);
      data.forEach((element) {
        print(element['name']);
      });
    }
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
