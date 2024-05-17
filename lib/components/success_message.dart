import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Daily goal reached',
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
              Image(
                image: AssetImage("assets/clapping_hands.png"),
                width: 30,
                height: 30,
                color: null,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
