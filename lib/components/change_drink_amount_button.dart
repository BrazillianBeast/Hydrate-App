import 'package:flutter/material.dart';
import 'package:hydrate/components/drinking_options_modal.dart';

class ChangeDrinkAmountButton extends StatefulWidget {

  final Function(double val) function;


  const ChangeDrinkAmountButton({required this.function(double val),super.key});

  @override
  State<ChangeDrinkAmountButton> createState() => _ChangeDrinkAmountButtonState();
}

class _ChangeDrinkAmountButtonState extends State<ChangeDrinkAmountButton> {
  final buttonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      textStyle: const TextStyle(fontSize: 13));

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.change_circle_outlined),
          Text('Change'),
        ],
      ),
      onPressed: () {
        // widget.function(3.0);
        showModalBottomSheet(context: context, builder: (BuildContext context)=> DrinkingOptionsModal(function: widget.function,));
      },
    )
    ;
  }
}
