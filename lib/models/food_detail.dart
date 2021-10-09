import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';

class FoodDetail extends StatefulWidget {
  static const routeName = '/fooddetail';

  const FoodDetail({Key? key}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/${item.image}',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ชื่อเมนู : ${item.name}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ราคา : ${item.price}",
                  style: Theme.of(context).textTheme.headline5),
            )
          ],
        ),
      ),
    );
  }
}
