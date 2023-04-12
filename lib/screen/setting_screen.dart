import 'package:flutter/material.dart';
import 'package:flutter_random_number/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  double maxNumber = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: maxNumber.toInt()
                      .toString()
                      .split('')
                      .map(
                        (e) => Image.asset(
                          "asset/img/$e.png",
                          width: 50,
                          height: 70,
                        ),
                      )
                      .toList(),
                ),
              ),
              Slider(
                value: maxNumber,
                min: 1000,
                max: 100000,
                onChanged: (double value){
                  setState(() {
                    maxNumber = value;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RED_COLOR,
                ),
                onPressed: () {
                  Navigator.of(context).pop(maxNumber.toInt());
                },
                child: Text("저장"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
