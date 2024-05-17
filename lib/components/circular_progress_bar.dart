import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {

  final double drinkAmountPercentage;
  final double drinkAmountMl;
  const CircularProgressBar(this.drinkAmountPercentage, this.drinkAmountMl, {super.key});

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {
  final greenColor = const Color(0xFF05DB27);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  strokeWidth: 15,
                  color: (widget.drinkAmountPercentage == 100)
                      ? greenColor
                      : Colors.blue,
                  backgroundColor: Colors.grey,
                  strokeCap: StrokeCap.round,
                  value: widget.drinkAmountPercentage / 100,
                ),
              ),
            ),
            Center(
                child: SizedBox(
                  height: 110,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.drinkAmountPercentage.toInt()}%",
                            style: const TextStyle(
                                fontSize: 51, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${widget.drinkAmountMl.toInt()} ml",
                            style: TextStyle(
                                fontSize: 21,
                                color: (widget.drinkAmountPercentage == 100)
                                    ? greenColor
                                    : Colors.blue),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
