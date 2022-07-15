import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/const.dart';

// ignore: must_be_immutable
class CarPage extends StatefulWidget {
  final DocumentSnapshot docSnap;
  const CarPage(this.docSnap, {Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Көлік жайлы ақпарат',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarText(carString: 'Модель:'),
              SizedBox(height: 10),
              CarCard(widget: widget, titleString: 'model'),
              SizedBox(height: 10),
              CarText(carString: 'Қозғалтқыш көлемі:'),
              SizedBox(height: 10),
              CarCard(widget: widget, titleString: 'engine_vol'),
              SizedBox(height: 10),
              CarText(carString: 'Жылы:'),
              SizedBox(height: 10),
              CarCard(widget: widget, titleString: 'year'),
              SizedBox(height: 10),
              CarText(carString: 'Нөмірі:'),
              SizedBox(height: 10),
              CarCard(widget: widget, titleString: 'plate'),
              SizedBox(height: 10),
              CarText(carString: 'Құны:'),
              SizedBox(height: 10),
              CarCard(widget: widget, titleString: 'rent_price'),
              SizedBox(height: 2),
              Column(
                children: [
                  Image.network(
                    widget.docSnap.get('image'),
                    width: 250,
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black87),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Сәтті"),
                                titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                backgroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                content: Text(
                                  "Сіз көлікті жалға алдыңыз",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shadowColor: Colors.black87,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Жабу",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.car_rental),
                        label: Text("Жалға алу"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shadowColor: Colors.black87,
                          elevation: 8,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        ),
                        label: Text(
                          "Артқа қайту",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
