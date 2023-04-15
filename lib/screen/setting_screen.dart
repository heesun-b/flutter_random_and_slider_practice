import 'package:flutter/material.dart';
import 'package:flutter_random_number/component/number_row.dart';
import 'package:flutter_random_number/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;
  const SettingScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  double maxNumber = 1000;

  void initState() { // 빌드 실행 전 실행
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

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
              _Body(maxNumber: maxNumber),
              _Footer(maxNumber: maxNumber, onButtonPressed: onButtonPressed, onSliderChanged: onSliderChanged)
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged (double val) {
    setState(() {
      maxNumber = val;

    });
  }

  void onButtonPressed () {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}


class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt(),)
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final VoidCallback onButtonPressed;
  final ValueChanged<double>? onSliderChanged;

  const _Footer({required this.maxNumber, required this.onButtonPressed, required this.onSliderChanged,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: RED_COLOR,
          ),
          onPressed:
            onButtonPressed,
               child: Text("저장"),
        ),
      ],
    );
  }
}
