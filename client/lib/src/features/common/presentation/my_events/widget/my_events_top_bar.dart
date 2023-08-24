import 'package:flutter/material.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';

class MyEventsTopBar extends StatelessWidget {
  const MyEventsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopBarWidget(
      title: "My Events",
      suffix: Icon(Icons.search, color: ColorApp.black),
    );
  }
}
