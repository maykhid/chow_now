import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.imageIndex,
  }) : super(key: key);

  final String imageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Container(
              height: 100,
              width: 120,
              // color: Colors.black,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/$imageIndex"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(25),
              ),
            ),

            // food
            const Text(
              'Amala',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            // amount and chows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'N500',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                SizedBox.square(
                  dimension: 8,
                ),
                Text(
                  'Chows',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}