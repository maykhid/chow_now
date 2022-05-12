import 'dart:math';

import 'package:chow_now/controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class SheetChild extends StatefulWidget {
  const SheetChild({
    Key? key,
    required double heightOfModalSheet,
    // required this.widgetList,
  })  : _heightOfModalSheet = heightOfModalSheet,
        super(key: key);

  final double _heightOfModalSheet;
  // final List<String> widgetList;

  @override
  State<SheetChild> createState() => _SheetChildState();
}

class _SheetChildState extends State<SheetChild> {
  Widget _myWidget = const AllFoodsWidget();
  final bool _switchroute = true;
  var route = routes.allFoods;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          height: widget._heightOfModalSheet,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  textDirection: TextDirection.ltr,
                  position: Tween<Offset>(
                          begin: const Offset(2.0, 0), end: const Offset(0, 0))
                      .animate(animation),
                  child: child,
                );
              },
              child: _myWidget,
            ),
          ),
        ),
        if (route == routes.allFoods) ...[
          AnimatedOpacity(
            opacity: (widget._heightOfModalSheet > 500) ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.only(
                bottom: (widget._heightOfModalSheet > 500) ? 80.0 : 0.0,
              ),
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _myWidget = const SearchFoods();
                    route = routes.search;
                  });
                  print(route);
                },
                child: const TransformSquare(),
              ),
            ),
          ),
        ] else ...[
          AnimatedOpacity(
            opacity: (widget._heightOfModalSheet > 500) ? 0.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
                padding: EdgeInsets.only(
                  bottom: (widget._heightOfModalSheet > 500) ? 1000.0 : 0.0,
                  left: (widget._heightOfModalSheet > 500) ? 400.0 : 0.0,
                ),
                duration: const Duration(seconds: 2),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _myWidget = const SearchFoods();
                    route = routes.allFoods;
                  });
                  print(route);
                },
                child: const TransformSquare(),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class SearchFoods extends StatelessWidget {
  const SearchFoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search and tags
        SizedBox(
          height: 240,
          width: MediaQuery.of(context).size.width,
          // color: Colors.yellow,
          child: Column(
            children: [
              // search for stuff
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // search
                    SizedBox(
                      child: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.search,
                            size: 20,
                            color: Colors.grey,
                          ),
                          SizedBox.square(
                            dimension: 10,
                          ),
                          Text(
                            'Search for stuff',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      FontAwesomeIcons.solidTimesCircle,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ],
                ),
              ),

              // tags
              SizedBox(
                // color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        TagPill(tagName: "Traditional    "),
                        SizedBox.square(
                          dimension: 15,
                        ),
                        TagPill(tagName: "Salads"),
                      ],
                    ),
                    Row(
                      children: const [
                        TagPill(tagName: "International        "),
                        SizedBox.square(
                          dimension: 15,
                        ),
                        TagPill(tagName: "Salads"),
                      ],
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Results',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        // list of meals
        Expanded(
          child: SizedBox(
            height: 30,
            child: ListView.separated(
                itemCount: widgetList.length,
                separatorBuilder: ((context, index) => const SizedBox.square(
                      dimension: 20,
                    )),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              // image
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/image_$index.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),

                              const SizedBox.square(dimension: 15),

                              // food text
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Amala",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'N500',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 8,
                                      ),
                                      Text(
                                        'Chows',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // arrow
                        const Icon(
                          FontAwesomeIcons.chevronRight,
                          color: Colors.purple,
                          size: 30,
                        )
                      ],
                    ),
                  );
                })),
          ),
        )
      ],
    );
  }
}

class AllFoodsWidget extends StatelessWidget {
  const AllFoodsWidget({
    Key? key,
    // required this.widgetList,
  }) : super(key: key);

  // final List<String> widgetList;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const GridViewWidget(),
      ],
    );
  }
}

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
          FontAwesomeIcons.search,
          color: Colors.white,
          size: 24,
        )
      ],
    );
  }
}

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({
    Key? key,
    // required this.widgetList,
  }) : super(key: key);

  // final List<String> widgetList;

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
          children: widgetList.map((String value) {
            return FoodCard(
              imageIndex: value,
            );
          }).toList(),
        ),
      ),
    );
  }
}

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

// Widget _tagPill(Tag tag) {
//   return TagPill();
// }

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
              FontAwesomeIcons.solidTimesCircle,
              size: 15,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

enum routes { search, allFoods }

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