import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'colors.dart';

showToast({
  @required String? message,
  Toast toastLength = Toast.LENGTH_LONG,
  Color backgroundColor = primaryTeal,
}) {
  Fluttertoast.showToast(
    msg: message!,
    backgroundColor: backgroundColor,
    toastLength: toastLength,
  );
}

parseDateMonth(String date) {
  if (date == "" || date == "NA") {
    return "";
  } else {
    DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
    String formattedDate = DateFormat("dd/MM/yyyy").format(tempDate);
    return formattedDate;
  }
}

parseDateMonth1(String date) {
  if (date == "" || date == "NA") {
    return "";
  } else {
    DateTime tempDate = DateFormat("yyyy-dd-MMThh:mm:ss").parse(date);
    String formattedDate = DateFormat("yyyy-MM-ddThh:mm:ss").format(tempDate);
    return formattedDate;
  }
}

parseTime(String date){
  if (date == "" || date == "NA"){
    return "";
  }else{
    DateTime tempDate =  DateFormat("yyyy-dd-MMThh:mm:ss").parse(date);
    String formattedTime =  DateFormat("hh:mm").format(tempDate);
    return formattedTime;
  }
}