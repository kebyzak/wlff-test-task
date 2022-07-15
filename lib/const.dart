import 'package:flutter/material.dart';

class CarText extends StatelessWidget {
  final String carString;
  const CarText({required this.carString});
  @override
  Widget build(BuildContext context) {
    return Text(
      carString,
      style: TextStyle(
        backgroundColor: Colors.amberAccent,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ignore: must_be_immutable
class CarCard extends StatelessWidget {
  var widget;
  var titleString;
  CarCard({required this.widget, required this.titleString});
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black87,
      elevation: 7,
      child: ListTile(
        title: Text(
          widget.docSnap[titleString].toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
