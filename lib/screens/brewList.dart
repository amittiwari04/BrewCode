import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:myshop/model/brew.dart';
import 'package:myshop/screens/brewItem.dart';
import 'package:provider/provider.dart';
class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews=Provider.of<List<Brew>>(context)??[];
    return ListView.builder(
      itemBuilder: (context,index)=>BrewItem(brew:brews[index]),
      itemCount: brews.length,

    );
  }
}

