import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: BackgroundChanger(),
  ));
}

class BackgroundChanger extends StatefulWidget {
  @override
  _BackgroundChangerState createState() => _BackgroundChangerState();
}

class _BackgroundChangerState extends State<BackgroundChanger> {
  Color initialColor = Colors.amber[100];
  Color randomColor;

  void generateNewColor() {
    setState(() {
      randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void setDefaultColor() {
    setState(() {
      randomColor = initialColor;
    });
  }

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background changer'),
        backgroundColor: Colors.indigo[700],
      ),
      body: GestureDetector(
        onTap: () => generateNewColor(),
        onLongPress: () => setDefaultColor(),
        child: SizedBox.expand(
          child: Container(
            alignment: Alignment.center,
            color: randomColor,
            child: Text(
              'Hey there',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 6.0,
                    color: Colors.indigo[700],
                    offset: Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
