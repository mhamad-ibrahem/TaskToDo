import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../native_with_flutter/sum_numbers_native_channel.dart';

class MainPageController extends GetxController {
  final TextEditingController search = TextEditingController();
  final box = Hive.box('myBox');
  final DateTime dateTime = DateTime.now();
  String selectedDate = '';
  String? dateName;
  String? date;
  List notes = [];
  String? id;
  bool isReversed = true;
  int selectedIndex = 0;
  List<String> sortedList = ['Newest'.tr, 'Oldest'.tr];
  List searchList = [];
  List noteList = [];
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
      list = selectedIndex == 0
          ? notes
              .where((item) =>
                  item['date'].toLowerCase().contains(value.toLowerCase()))
              .toList()
          : noteList
              .where((item) =>
                  item['date'].toLowerCase().contains(value.toLowerCase()))
              .toList();
    }
    searchList = list;
    update();
  }

  sortedBy(String date) async {
    if (date == sortedList[0]) {
      if (selectedIndex == 0) {
        notes.sort((a, b) => b['dateValue'].compareTo(a['dateValue']));
      } else {
        noteList.sort((a, b) => b['dateValue'].compareTo(a['dateValue']));
      }

      update();
    } else {
      if (selectedIndex == 0) {
        notes.sort(
          (a, b) => a['dateValue'].compareTo(b['dateValue']),
        );
      } else {
        noteList.sort(
          (a, b) => a['dateValue'].compareTo(b['dateValue']),
        );
      }

      update();
    }
  }

  addNote(String dateOfNote, DateTime dateValue) {
    var uuid = const Uuid();
    id = uuid.v1();
    log('id is $id');
    Map data = {
      'date': dateOfNote,
      'day': dateName,
      'id': id,
      'dateValue': dateValue,
      'numberOfTask': 0,
      'tasks': [],
      'numberOfTaskRemains': 0
    };
    notes.insert(0, data);
    if (selectedIndex == 1) {
      noteList.insert(0, data);
    }
    box.put('notes', notes);
    update();
  }

  initialNote() {
    notes = [];
  }

  getNotes() {
    notes = box.get('notes');
    notes.sort(
      (a, b) => b['dateValue'].compareTo(a['dateValue']),
    );
    noteList = notes;
  }

  deleteNote(int index) {
    //remove item from list
    if (selectedIndex == 0 && search.text.isEmpty) {
      notes.removeAt(index);
    } else if (selectedIndex != 0 && search.text.isEmpty) {
      notes.removeWhere((element) => element['id'] == noteList[index]['id']);
      noteList.removeAt(index);
    } else if (search.text.isNotEmpty) {
      notes.removeWhere((element) => element['id'] == searchList[index]['id']);
      searchList.removeAt(index);
    }
    box.put('notes', notes);
    Get.back();
    update();
  }

  chooseDate(
    Future<DateTime?> datePicker,
  ) async {
    debugPrint("today date is $date");
    DateTime? newDate = await datePicker;
    if (newDate != null) {
      dateName = DateFormat.EEEE().format(newDate);
      // date = newDate;
      log("selected date $newDate");
      selectedDate = "${newDate.day}-${newDate.month}-${newDate.year}";
      addNote(selectedDate, newDate);
      update();
    } else {}
  }

  @override
  void onInit() {
    // native code 
    SumNumbersNativeChannel sumNumbersNativeChannel = SumNumbersNativeChannel();
    sumNumbersNativeChannel.getSumNumbersBuNative(num1: 2.0,num2: 23.0);
    
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
