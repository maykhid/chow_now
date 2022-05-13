import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransformSquare extends StatelessWidget {
  const TransformSquare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // main square
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            height: 110,
            width: 110,
            padding: const EdgeInsets.only(top: 500, bottom: 500),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
        ),
        // circle
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),

        // searck icon
        const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
          size: 24,
        )
      ],
    );
  }
}