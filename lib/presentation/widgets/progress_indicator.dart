import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE91E63),
      child: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
