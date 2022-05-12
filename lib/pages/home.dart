import 'package:chow_now/controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

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

  List<String> widgetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

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
                widgetList: widgetList,
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

class SheetChild extends StatelessWidget {
  const SheetChild({
    Key? key,
    required double heightOfModalSheet,
    required this.widgetList,
  })  : _heightOfModalSheet = heightOfModalSheet,
        super(key: key);

  final double _heightOfModalSheet;
  final List<String> widgetList;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      height: _heightOfModalSheet,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      // color: Colors.black,
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'All Foods',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridViewWidget(widgetList: widgetList),
          ],
        ),
      ),
    );
  }
}

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({
    Key? key,
    required this.widgetList,
  }) : super(key: key);

  final List<String> widgetList;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  late ScrollController _scrollController;
  late BottomSheetController _bsController = BottomSheetController();

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print("reach the bottom");
      });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print("reach the top");
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _bsController = context.watch<BottomSheetController>();
    });
    super.initState();
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      print("Scroll Start + height ${_bsController.height}");
      _bsController.incrementHeight();
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      print("Scroll Update + ${metrics.axisDirection}");
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      print("Scroll End");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            _onStartScroll(scrollNotification.metrics);
          } else if (scrollNotification is ScrollUpdateNotification) {
            _onUpdateScroll(scrollNotification.metrics);
          } else if (scrollNotification is ScrollEndNotification) {
            _onEndScroll(scrollNotification.metrics);
          }
          return false;
        },
        child: GridView.count(
          controller: _scrollController,
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: widget.widgetList.map((String value) {
            return const FoodCard();
          }).toList(),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
  }) : super(key: key);

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
                color: Colors.black,
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