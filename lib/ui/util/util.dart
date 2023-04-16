import 'package:flutter/material.dart';

Color couleurBleuAe2i = const Color(0xff1270B5);
Color couleurOrangeAe2i = const Color(0xffEF9005);
Color kIcon = const Color(0xff083B4D);
Color kEcriture = Colors.white;
BoxDecoration backgroundColor = BoxDecoration(
        gradient: LinearGradient(
            colors: [couleurOrangeAe2i, couleurBleuAe2i],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp));
