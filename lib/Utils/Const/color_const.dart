import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var radius = BorderRadius.circular(25.r);
var horizontalPadding = 25.w;
var verticalPadding = 25.h;

/// Colors

 Color primary = const Color(0xFFa4ce2e);
Color secondary = const Color(0xFFe8f3c9);
Color grey = const Color(0xff999999);
Color black = Color(0xFF333333);
Color greyLight = Color(0xffE7E7E7);
Color white = Colors.white;

LinearGradient gradientauth = LinearGradient(
            colors: [
                    Color(0xFF2E496B), 
  Color(0xFF6C8DB5), 
                    Colors.white.withOpacity(0.2),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          
  stops: [0.4, 0.5],
);

/// For Material Colors
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
