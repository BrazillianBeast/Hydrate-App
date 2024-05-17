import 'dart:developer';

import 'package:flutter/material.dart';

class AddWaterButton extends StatefulWidget {
  // final double amount;
  final double amount;
  final VoidCallback callback;
  final VoidCallback playSong;
  final VoidCallback nextDrinkCountdown;

  const AddWaterButton({
    required this.amount,
    required this.callback,
    required this.playSong,
    required this.nextDrinkCountdown,
    super.key,
  });

  @override
  State<AddWaterButton> createState() => _State();
}

class _State extends State<AddWaterButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 50,
      child: FilledButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
          onPressed: () {
            widget.callback();
            // widget.playSong();
            widget.nextDrinkCountdown();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.add),
              Text("${widget.amount.toInt()}ml")
            ],
          )),
    );
  }
}
