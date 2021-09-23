import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  String password = '123456';
  int spotPassword = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blueAccent, Colors.red],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  Center(
                      child: Text(
                    'LOG IN',
                    style: Theme.of(context).textTheme.headline1,
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < spotPassword; i++)
                    Icon(
                      Icons.circle,
                      color: Colors.blueAccent.shade100,
                    ),
                  for (var i = 0; i < 6 - spotPassword; i++)
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.white38,
                    ),
                ],
              ),
            ),
            Container(
              //color: Colors.pink,
              child: Column(
                children: [
                  [1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9],
                  [-2, 0, -1],
                ].map((row) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList());
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _handleClickButton(int num) {
    setState(() {
      if (num == -1) {
        if (input.length > 0) {
          input = input.substring(0, input.length - 1);
          spotPassword--;
        }
      } else {
        if (input.length < 6) {
          input += num.toString();
          spotPassword++;
        }
      }
      if (input.length == 6) {
        if (input == password) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          _showMaterialDialog();
          spotPassword = 0;
          input = '';
        }
      }
    });
  }

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ERROR!",style: TextStyle(color: Colors.black),),
          content: Text("Invalid PIN. Please try again!"),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2
          ? null
          : () {
              onClick(number);
            },
      child: Container(
        width: 80,
        height: 80,
        decoration: number == -2
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.white38)),
        child: Center(
          child: number >= 0
              ? Text(
                  '$number',
                  style: Theme.of(context).textTheme.headline6,
                )
              : (number == -1
                  ? Icon(Icons.backspace_outlined,
                      size: 30.0, color: Colors.white)
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}
