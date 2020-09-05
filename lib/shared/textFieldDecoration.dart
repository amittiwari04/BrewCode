 import 'package:flutter/material.dart';

  final formDecoration=InputDecoration(
     fillColor: Colors.white,
     filled: true,
     enabledBorder: UnderlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: Colors.black,width: 2)),
     disabledBorder:  UnderlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: Colors.grey,width: 2)),
     border: OutlineInputBorder(
       borderSide: BorderSide(width: 2,color: Colors.grey),
         borderRadius: BorderRadius.circular(10)));