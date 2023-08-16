import 'package:flutter/material.dart';

class CircleBackgroundWidget extends StatelessWidget {
  final Widget child;

  const CircleBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/icons/circle_top_left.png'),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/icons/circle_top_right.png'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/icons/circle_bottom_left.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/icons/circle_bottom_right.png'),
          ),
          child
        ],
      ),
    );
  }
}
