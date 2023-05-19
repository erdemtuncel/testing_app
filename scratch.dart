import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  String? task2Result = await task2();
  task3(task2Result);
}

void task1() {
  var other = 'deneme';
  String result = "task 1 data"+ ' ' +other;

  topla({required int ilkSayi, required int ikinciSayi}) => ilkSayi + ikinciSayi;
  print(topla(ilkSayi: 3, ikinciSayi: 2));
  print('Task 1 completed ');
}
Future<String?> task2()  async {
  Duration duration = const Duration(seconds: 3);
  //sleep(duration);
  String? result;

  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 completed');

  });

   return result;

}

void task3(String?  task2Data) {
  String result = 'task 3 data';
  print('task 3 completed with $task2Data');
}





