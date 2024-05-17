import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController{
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreateMethod(
      ReceivedNotification receivedNotification) async{
    //TODO Your code goes here
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async{
    //TODO Your code goes here
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async{
    //TODO Your code goes here
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async{
    //TODO Your code goes here
  }
}