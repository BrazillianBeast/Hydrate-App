import 'package:flutter/material.dart';

enum ColorLabel {
  blue('100', Colors.lightBlue),
  pink('200', Colors.blue),
  green('250', Colors.green),
  yellow('500', Colors.orange);
  // grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

class DrinkingOptionsModal extends StatefulWidget {
  double currentSelectedDrinkAmount = 0;

  // final VoidCallback callback;
  final Function(double val) function;

  DrinkingOptionsModal({required this.function(double val), super.key});

  @override
  State<DrinkingOptionsModal> createState() => _DrinkingOptionsModalState();
}

class _DrinkingOptionsModalState extends State<DrinkingOptionsModal> {
  late ColorLabel dropdownValue;

  // final double dropdownValue = 0;

  @override
  void initState() {
    super.initState();
    dropdownValue = ColorLabel.values.firstWhere(
      (color) => double.parse(color.label) == widget.currentSelectedDrinkAmount,
      orElse: () => ColorLabel.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 80,
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Drink',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text('Choose the amount of water you drink (ml):'),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: SizedBox(
                        child: DropdownButton<ColorLabel>(
                            value: dropdownValue,
                            items: ColorLabel.values
                                .map<DropdownMenuItem<ColorLabel>>(
                                    (ColorLabel color) {
                              return DropdownMenuItem<ColorLabel>(
                                value: color,
                                child: Text(
                                  color.label,
                                  style: TextStyle(color: color.color),
                                ),
                              );
                            }).toList(),
                        onChanged: (ColorLabel ? newValue){
                              setState(() {
                                dropdownValue = newValue!;
                                widget.currentSelectedDrinkAmount =
                                    double.parse(newValue.label);
                                widget.function(widget.currentSelectedDrinkAmount);
                              });
                        },),
                      ),
                    )
                  ],
                ),
              ],
            ),
            // OutlinedButton(
            //   child: const Text('Close'),
            //   onPressed: (){
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
