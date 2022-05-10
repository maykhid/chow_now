import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      late PersistentBottomSheetController _controller;
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/apple_bg.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 120),
              child: Text(
                """Find Your
Chow Now""",
                style: GoogleFonts.alegreyaSans(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        // animationController: _controller.,
        backgroundColor: Colors.black,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.95,
          );
        },
        onClosing: () {},
      ),
    );
  }
}
