
import 'package:chow_now/controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../widgets/sheet_child_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// double _heightOfModalSheet = MediaQuery.of(context).size.height * 0.6;

//     late AnimationController _controller =
//         BottomSheet.createAnimationController(this);
  // late ScrollController _controller;

  bool expandSheet = false;
  double heightOfModal = 500;
  late BottomSheetController _bsController = BottomSheetController();

  @override
  void initState() {
    super.initState();

    Future(() {
      showCupertinoModalBottomSheet(
        context: context,
        closeProgressThreshold: 0.0,
        backgroundColor: Colors.white,
        expand: expandSheet,
        isDismissible: false,
        builder: (context) =>
            StatefulBuilder(builder: (context, StateSetter stateOfSheet) {
          return Material(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // onTap: () {
              //   stateOfSheet(() {
              //     // expandSheet = !expandSheet;
              //     // // if (expandSheet) {
              //     // heightOfModal += 50;
              //     // print(expandSheet);
              //     // } else {
              //     //   heightOfModal = 500;
              //     // }
              //     // heightOfModal += 100;

              //     // print(heightOfModal);
              //     _bsController.incrementHeight();
              //   });
              // },
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
                    // _bsController.incrementHeight();
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
    // _controller = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _bsController = context.watch<BottomSheetController>();
    });
  }

  void executeIncrement() => _bsController.incrementHeight();

  @override
  Widget build(BuildContext context) {
    // Future showBottomSheet(BuildContext context) {
    //   return showModalBottomSheet<dynamic>(
    //       useRootNavigator: true,
    //       barrierColor: Colors.black.withOpacity(0.5),
    //       isScrollControlled: true,
    //       context: context,
    //       builder: (BuildContext bc) {
    //         return ConstrainedBox(
    //           constraints: BoxConstraints(
    //               maxHeight: MediaQuery.of(context).size.height * 0.9),
    //           child: Container(
    //             decoration: const BoxDecoration(
    //                 color: Colors.blue,
    //                 borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(25.0),
    //                     topRight: Radius.circular(25.0))),
    //             child: ListView(
    //               shrinkWrap: true,
    //               children: const [
    //                 Padding(
    //                   padding: EdgeInsets.fromLTRB(30, 30, 30, 45),
    //                   child: Text(
    //                     'Choose Album',
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //                 FoodCard(),
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }

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
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 120),
              child: Text(
                """Find Your
Chow Now""",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Widget _tagPill(Tag tag) {
//   return TagPill();
// }

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


      // bottomSheet: BottomSheet(
      //   animationController: _controller,
      //   onDragStart: (details) {
      //     setState(() {
      //       _heightOfModalSheet *= 2;
      //       print(_heightOfModalSheet);
      //     });
      //   },
      //   // onDragEnd: (details, {isClosing = true}) {
      //   //   setState(() {
      //   //     _heightOfModalSheet = 500 * 2;
      //   //     print(details.primaryVelocity);
      //   //   });
      //   // },
      //   backgroundColor: Colors.white,
      //   builder: (BuildContext context) {
      //     return SheetChild(heightOfModalSheet: _heightOfModalSheet, widgetList: widgetList);
      //   },
      //   onClosing: () {},
      // ),