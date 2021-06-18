import 'package:flutter/material.dart';

enum LineSize { small, large }

class ScanLines extends StatefulWidget {
  const ScanLines({Key? key, this.text = '', this.textStyle = const TextStyle(), this.lineSize = LineSize.large}) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final LineSize lineSize;

  @override
  _ScanLinesState createState() => _ScanLinesState();
}

class _ScanLinesState extends State<ScanLines>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  double _getTextHeight(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.height;
  }
  late double textHeight;
  late double lineHeight;
  initState() {
    super.initState();
    textHeight = _getTextHeight(widget.text, widget.textStyle);
    lineHeight = widget.lineSize == LineSize.large ? 40 : 6;
    controller = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);

    animation = Tween<double>(
            begin: widget.lineSize == LineSize.large ? -200 : -300, end: 200)
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        transform: Transform.translate(offset: Offset(0, animation.value)).transform,
        decoration: BoxDecoration(
            color: Color.fromRGBO(251, 31, 66, 0.9),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(251, 31, 66, 0.9),
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
        ),
        height: lineHeight,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: <Widget>[
            Positioned(
              bottom: animation.value-(textHeight-lineHeight)/2,
              left: 0,
              right: 0,
            child: Text(widget.text, style: widget.textStyle),
          ),]
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
