import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:price_checker/scan_lines.dart';

class ScanBox extends StatefulWidget {
  const ScanBox({Key? key}) : super(key: key);

  @override
  _ScanBoxState createState() => _ScanBoxState();
}

class _ScanBoxState extends State<ScanBox> {
  var style = Style(
      width: Dimension.max(70.toVWLength, 500.toPXLength),
      height: Dimension.max(24.toVWLength, 160.toPXLength),
      margin: EdgeInsets.symmetric(vertical: 10),
      backgroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            for (int i = 0; i < 22; i++)
              i ~/ 2 % 2 == 0
                  ? Color.fromRGBO(40, 44, 85, 1)
                  : Color.fromRGBO(77, 43, 98, 1)
          ],
          stops: [
            0,
            1 / 14,
            1 / 14,
            2 / 14,
            2 / 14,
            4 / 14,
            4 / 14,
            5 / 14,
            5 / 14,
            6 / 14,
            6 / 14,
            7 / 14,
            7 / 14,
            8 / 14,
            8 / 14,
            9 / 14,
            9 / 14,
            12 / 14,
            12 / 14,
            13 / 14,
            13 / 14,
            1
          ],
          tileMode: TileMode.repeated,
        ),
      ),
      shapeBorder: RoundedRectangleShapeBorder(
        borderRadius:
            DynamicBorderRadius.all(DynamicRadius.circular(56.toPXLength)),
        borderSides: RectangleBorderSides.all(
          DynamicBorderSide(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Color.fromRGBO(154, 159, 173, 1),
                  Color.fromRGBO(252, 54, 82, 1),
                  Color.fromRGBO(251, 30, 62, 1),
                  Color.fromRGBO(250, 30, 62, 1),
                  Color.fromRGBO(245, 29, 61, 1),
                  Color.fromRGBO(175, 23, 45, 1),
                  Color.fromRGBO(117, 16, 30, 1),
                ],
                stops: [0.0009, 0.009, 0.06, 0.08, 0.1, 0.99, 1],
              ),
              width: 9),
        ),
      ),
      shadows: [
        ShapeShadow(
            color: Colors.black,
            blurRadius: 8,
            spreadRadius: 0.001,
            // gradient: LinearGradient(
            //     colors: [Colors.cyanAccent, Colors.purpleAccent]),
            offset: Offset(0, 4)),
      ],
      insetShadows: [
        ShapeShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(4, 10)),
      ],
      textAlign: TextAlign.center,
      mouseCursor: SystemMouseCursors.click,
  );

  @override
  Widget build(BuildContext context) {
    String _text = 'قارئ السعر';
    TextStyle _textStyle = TextStyle(
      color: Color.fromRGBO(155, 18, 36, 1),
      fontSize: MediaQuery.of(context).size.width / 9,
      fontWeight: FontWeight.w700,
      fontFamily: 'Bahij',
    );
    return StyledContainer(
      style: style,
      child: Stack(
        children: [
          Center(child: Text(_text, style: _textStyle.apply(color: Colors.white),)),
          ScanLines(
              text: _text, textStyle: _textStyle, lineSize: LineSize.small),
          ScanLines(
              text: _text, textStyle: _textStyle, lineSize: LineSize.large),
        ],
      ),
    );
  }
}
