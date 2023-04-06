import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_random_number/constant/color.dart';
import 'package:flutter_random_number/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumners = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _body(randomNumners: randomNumners),
              _footer(onPressed: onRandomNumberGenerate),
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);
      newNumbers.add(number);
    }

    setState(() {
      randomNumners = newNumbers.toList();
    });
  }
}

class _header extends StatelessWidget {
  const _header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "랜덤숫자 생성기",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        IconButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SettingScreen();
                },)
            );
          },
          icon: Icon(
            Icons.settings,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class _body extends StatelessWidget {
  final List<int> randomNumners;

  const _body({required this.randomNumners, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: randomNumners
          .asMap()
          .entries
          .map(
            (x) => Padding(
              padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
              child: Row(
                children: x.value
                    .toString()
                    .split('')
                    .map((y) => Image.asset(
                          "asset/img/$y.png",
                          width: 50,
                          height: 70,
                        ))
                    .toList(),
              ),
            ),
          )
          .toList(),
    ));
  }
}

class _footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _footer({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: RED_COLOR,
        ),
        onPressed: onPressed,
        child: Text(
          "생성하기",
        ),
      ),
    );
  }
}
