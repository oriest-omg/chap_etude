import 'dart:core';

import 'package:chap_etude/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../util/util.dart';

class TraitDeSeparationWidget extends StatelessWidget {
  final String information;
  final double? ht ;
  final double? tailleText;
  final double? th;
  final double? espaceTraitinformation;
  const TraitDeSeparationWidget({Key? key,
    required this.information,
    this.ht,
    this.tailleText,
    this.espaceTraitinformation,
    this.th
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Expanded(
              child: Divider(
                color: Colors.black,
                height: ht,
                thickness: th,
                endIndent: espaceTraitinformation,
              )
          ),
          TextWidget(data : information,taille: tailleText,couleur: kEcriture,),
          Expanded(
              child: Divider(
                color: Colors.black,
                height: ht,
                thickness: th,
                indent: espaceTraitinformation,
              )
          ),
        ]
    );
  }
}
