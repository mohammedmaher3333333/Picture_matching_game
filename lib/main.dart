import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("تطابق الصور"),
          backgroundColor: Colors.indigo[800],
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var LeftImageNumber = 1;
  var RightImageNumber = 1;

  void ChangeImage() {
    LeftImageNumber = Random().nextInt(9) + 1;
    RightImageNumber = Random().nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LeftImageNumber == RightImageNumber
              ? 'مبروك لق نجحت'
              : 'حاول مره اخري',
          style: TextStyle(fontSize: 42.0, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ChangeImage();
                    });
                  },
                  child: Image.asset('images/image-$LeftImageNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeImage();
                      });
                    },
                    child: Image.asset('images/image-$RightImageNumber.png')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
