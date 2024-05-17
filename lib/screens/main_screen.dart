import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hydrate/components/add_water_button.dart';
import 'package:hydrate/components/change_drink_amount_button.dart';
import 'package:hydrate/components/circular_progress_bar.dart';
import 'package:hydrate/components/success_message.dart';
import 'package:hydrate/components/header.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double dailyGoal = 2000;
  double drinkAmountPercentage = 0;
  double drinkAmountMl = 0;
  List<double> myList = [100, 200, 300];
  double drinkingDoseAmount = 100;

  // final player = AudioPlayer();

  Future<void> playAudioFromUrl(String url) async {
    await player.play(AssetSource(url));
  }

  void incrementDrinkAmount() {
    setState(() {
      drinkAmountMl = drinkAmountMl + drinkingDoseAmount;
      if (drinkAmountMl >= dailyGoal) {
        drinkAmountPercentage = 100;
      } else {
        drinkAmountPercentage = (drinkAmountMl / dailyGoal) * 100;
      }
    });
  }

  void changeText({double arg = 0}) {
    setState(() {
      if (arg > 0) {
        drinkingDoseAmount = arg;
      }
    });
  }

  void changeDrinkAmount(double valor) {
    setState(() {
      drinkingDoseAmount = valor;
    });
  }

  void countdownToNextDrinkNotification(){
    Timer(const Duration(hours: 1), (){
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "basic_channel",
            title: "Time to get some water!",
            wakeUpScreen: true,
            body:
            "Yay, just passing to remind you to keep yourself hydrated!"),
      );
    });
  }

  final player = AudioPlayer();

  void playSong() async {
    await player.setSource(AssetSource('flowing_water.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Hydrate'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Header(dailyGoal),
          CircularProgressBar(drinkAmountPercentage, drinkAmountMl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                (drinkAmountPercentage == 100) ? const SuccessMessage() : null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: SizedBox(
              width: 120,
              child: Column(
                children: [
                  AddWaterButton(
                      amount: drinkingDoseAmount,
                      callback: incrementDrinkAmount,
                      playSong: playSong,
                      nextDrinkCountdown: countdownToNextDrinkNotification
                  ),
                  ChangeDrinkAmountButton(function: changeDrinkAmount),
                ],
              ),
            ),
          ),
          // Wave()
        ],
      ),
    );
  }
}
