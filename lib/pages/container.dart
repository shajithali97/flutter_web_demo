import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {Key? key,
      this.padding,
      this.margin,
      this.alignment,
      this.shape,
      this.clip})
      : super(key: key);
  final EdgeInsets? padding;
  final double? margin;
  final Alignment? alignment;
  final BoxShape? shape;
  final Clip? clip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          clipBehavior: clip ?? Clip.none,
          decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle, color: Colors.redAccent),
          margin: EdgeInsets.all(margin ?? 0.0),
          padding: padding ?? EdgeInsets.all(0.0),
          alignment: alignment,
          child: Text(
            "Child Widget",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
