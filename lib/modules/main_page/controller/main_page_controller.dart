import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class MainPageController extends GetxController {
  final TextEditingController search = TextEditingController();
  final box = Hive.box('myBox');
  final DateTime dateTime = DateTime.now();
  String? dateName;
  String? date;
  List notes = [];
  String? id;
  bool isReversed = true;
  List<String> sortedList = ['Newest'.tr, 'Oldest'.tr];
  List searchList = [];
  String selectedSorted = 'Newest'.tr;
  changeSorted(String sorted) {
    selectedSorted = sorted;
    log('sorted : $sorted');
    sortedBy(selectedSorted);
    update();
  }

  void searching(String value) {
    //filtering list
    List list = [];
    if (value.isEmpty) {
      list = notes; //if searching value is empty return full list
    } else {
      list = notes
          .where((item) =>
              item['date'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    searchList = list;
    update();
  }

  sortedBy(String date) async {
    if (date == 'Oldest'.tr) {
      isReversed = false;

      update();
    } else {
      isReversed = true;

      update();
    }
  }

  addNote() {
    var uuid = const Uuid();
    id = uuid.v1();
    log('id is $id');
    notes.add({
      'date': date,
      'day': dateName,
      'id': id,
      'numberOfTask': 0,
      'tasks': [],
      'numberOfTaskRemains': 0
    });
    box.put('notes', notes);
    update();
  }

  initialNote() {
    notes = [];
  }

  getNotes() {
    notes = box.get('notes');
  }

  deleteNote(int index) {
    //remove item from list
    notes.removeAt(index);
    box.put('notes', notes);
    Get.back();
    update();
  }

  @override
  void onInit() {
    dateName = DateFormat.EEEE().format(dateTime);
    date = DateFormat('dd-MM-yyyy').format(dateTime);
    log('day is $dateName');
    log('date is $date');
    if (box.get('notes') == null) {
      // if it is the first time ever opening this app call this function that return empty Note list
      initialNote();
    } else {
      //else get Notes that the user add it
      getNotes();
    }
    super.onInit();
  }
}
