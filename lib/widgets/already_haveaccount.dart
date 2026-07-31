import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: prefer_generic_function_type_aliases
typedef void TextClick(BuildContext context);

class HaveAccount extends StatelessWidget {
  final double width;
  final double height;
  final String firstMsg;
  final String secondMsg;
  final TextClick textClick;

  const HaveAccount(
      {required this.textClick,
      required this.firstMsg,
      required this.secondMsg,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
          child: Text.rich(TextSpan(
              text: '$firstMsg ',
              style: const TextStyle(color: Colors.black, fontSize: 15),
              children: [
            TextSpan(
                text: secondMsg,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 2),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    textClick(context);
                  }),
          ]))),
    );
  }
}
