import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final double dailyGoal;

  const Header(this.dailyGoal, {super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final greenColor = const Color(0xFF05DB27);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today',
            style: TextStyle(fontSize: 36),
          ),
          Row(
            children: [
              const Text(
                'Daily goal ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '${widget.dailyGoal.toInt()} ml',
                style: TextStyle(fontSize: 15, color: greenColor),
              ),
              // IconButton(
              //   icon: const Icon(
              //     Icons.edit,
              //     size: 16,
              //   ),
              //   tooltip: 'Edit your daily goal amount',
              //   onPressed: () {
              //     setState(() {
              //     });
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
