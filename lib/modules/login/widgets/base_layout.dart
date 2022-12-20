import 'package:flutter/material.dart';

import '../../../common/assets.dart';

class BaseLayout extends StatelessWidget {
  Widget? body;

  BaseLayout({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.appLogo), fit: BoxFit.fill),
        ),
        child: body /* add child content here */,
      ),
    );
  }
}
