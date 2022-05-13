
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TagPill extends StatelessWidget {
  const TagPill({
    Key? key,
    required this.tagName,
  }) : super(key: key);

  final String tagName;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.25),
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // text
            Text(
              tagName,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),

            const SizedBox(width: 5.0),

            // close icon
            const Icon(
              FontAwesomeIcons.solidCircleXmark,
              size: 15,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
