import 'package:flutter/material.dart';

// ignore: prefer_generic_function_type_aliases
typedef void BtnClick(BuildContext context);

class GoogleBtn extends StatelessWidget {
  final double height;
  final double width;
  final BtnClick btnClick;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? style;
  final Widget? child;

  const GoogleBtn({
    Key? key,
    required this.height,
    required this.width,
    required this.btnClick,
    this.color,
    this.style,
    this.child,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: height,
        width: width,
        child: GestureDetector(
          onTap: () {
            btnClick(context);
          },
          child: Container(
              decoration: BoxDecoration(
                border: border,
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-3, -3),
                      blurRadius: 5),
                  BoxShadow(
                      color: Colors.white54,
                      offset: Offset(3, 3),
                      blurRadius: 5)
                ],
              ),
              child: child),
        ),
      ),
    );
  }
}
