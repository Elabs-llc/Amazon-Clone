import 'package:flutter/material.dart';

class Helpers {
  static String AppName = "Elabs Commerce";
  static String CompName = "Elabs LLC";
  static String CopyRightNotice = "Copyright 2024 $CompName or it's affiliates";

  static blankSpace(double? height, double? width){
    return SizedBox(
      width: width??0, 
      height: height??0,
    );
  }

  
}