import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    /* Màu của viền bao bọc */
    fillColor: Colors.white,
    filled: true,
    /* Xử lí đường viền - cho ẩn hẳn đường viền*/
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    /* Xử lí khi nhấp vào không bị Zoom In - nhấp vào đổi màu viền*/
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.0)));
