import '../controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../widgets/sheet_child_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BottomSheetController _bsController = BottomSheetController();

  @override
  void initState() {
    super.initState();

    Future(() {
      showCupertinoModalBottomSheet(
        context: context,
        closeProgressThreshold: 0.0,
        backgroundColor: Colors.white,
        isDismissible: false,
        builder: (context) =>
            StatefulBuilder(builder: (context, StateSetter stateOfSheet) {
          return Material(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // Todo: write logic to prevent the sheet from going below 500.
              onVerticalDragEnd: (details) {
                stateOfSheet(
                  () {
                    // int sensitivity = 10;
                    if (details.primaryVelocity! > 0) {
                      // Down Swipe
                      _bsController.decreaseHeight();
                    } else if (details.primaryVelocity! < 0) {
                      // Up Swipe
                      _bsController.incrementHeight();
                    }
                  },
                );
              },
              child: SheetChild(
                heightOfModalSheet: _bsController.height,
              ),
            ),
          );
        }),
      );
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _bsController = context.watch<BottomSheetController>();
    });
  }

  void executeIncrement() => _bsController.incrementHeight();

  @override
  Widget build(BuildContext context) {
    _bsController = context.watch<BottomSheetController>();
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: (_bsController.height > 500) ? 1.0 : 1.0,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                  child: AnimatedPadding(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(seconds: 2),
                    padding: EdgeInsets.only(
                      top: 30,
                      right: (_bsController.height > 500) ? 500.0 : 0.0,
                      left: (_bsController.height < 500) ? 0 : 25,
                    ),
                    child: Container(
                      height: 70,
                      width: 70,
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        "assets/images/four_dots.svg",
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Column(
                    children: const [
                      Text(
                        """Find Your
Chow Now""",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> widgetList = [
  'image_0.jpg',
  'image_1.jpg',
  'image_2.jpg',
  'image_3.jpg',
  'image_4.jpg',
  'image_5.jpg',
  'image_6.jpg',
  'image_7.jpg',
  'image_8.jpg',
  'image_9.jpg',
];
