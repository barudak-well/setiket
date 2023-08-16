import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/constants/constants.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: ColorApp.black,
          ),
        ),
      ],
    );
  }
}
