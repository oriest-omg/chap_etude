import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextWidget extends StatelessWidget {
  final String data;
  final double? taille;
  final Color? couleur;
  const TextWidget({Key? key, required this.data, required this.taille,this.couleur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.poppins(
        color: couleur,
        fontSize: taille,
      ),
    );
  }
}
