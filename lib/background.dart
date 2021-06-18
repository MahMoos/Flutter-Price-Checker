import 'package:flutter/material.dart';

enum Status {standby, found, expired}

class Background extends StatefulWidget {
  final Status status;
  const Background({Key? key, required this.status}) : super(key: key);
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  List<Color> colorList = [
    Color.fromRGBO(39, 60, 117, 1),
    Color.fromRGBO(25, 42, 86, 1),
    Color.fromRGBO(78, 116, 219, 1),
    Color.fromRGBO(208, 5, 40, 1),
  ];
  List<Curve> curves = [
    Curves.easeIn,
    Curves.easeOut,
    Curves.bounceOut
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorList[0],
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: curves[widget.status.index],
        onEnd: () {
          // condition = !condition;
          //// animate the alignment
          // begin = alignmentList[index % alignmentList.length];
          // end = alignmentList[(index + 2) % alignmentList.length];
        },
        decoration: BoxDecoration(
          gradient: widget.status == Status.standby?
              LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                colorList[widget.status.index+1] ,
                colorList[0],
              ],)
              :RadialGradient(
            // begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
            colors: <Color>[
              colorList[widget.status.index+1] ,
              colorList[0],
            ],
            radius: 0.8,
            center: Alignment(0, 1),
            // tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
