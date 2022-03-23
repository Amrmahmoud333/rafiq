import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showTosat({required msg, required state}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: state ? Colors.green : Colors.amber,
    textColor: Colors.white,
    fontSize: 20.0);
