import 'package:flutter/material.dart';

import '../pages/home.dart';
import 'food_card_widget.dart';

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
  // late ScrollController _scrollController;
  // late BottomSheetController _bsController = BottomSheetController();

  // _scrollListener() {
  //   if (_scrollController.offset >=
  //           _scrollController.position.maxScrollExtent &&
  //       !_scrollController.position.outOfRange) {
  //     setState(() {
  //       print("reach the bottom");
  //     });
  //   }
  //   if (_scrollController.offset <=
  //           _scrollController.position.minScrollExtent &&
  //       !_scrollController.position.outOfRange) {
  //     setState(() {
  //       print("reach the top");
  //     });
  //   }
  // }

  @override
  void initState() {
    // _scrollController = ScrollController()..addListener(_scrollListener);
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   _bsController = context.watch<BottomSheetController>();
    // });
    super.initState();
  }

  // _onStartScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     print("Scroll Start + height ${_bsController.height}");
  //     _bsController.incrementHeight();
  //   });
  // }

  // _onUpdateScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     print("Scroll Update + ${metrics.axisDirection}");
  //   });
  // }

  // _onEndScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     print("Scroll End");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // if (scrollNotification is ScrollStartNotification) {
          //   _onStartScroll(scrollNotification.metrics);
          // } else if (scrollNotification is ScrollUpdateNotification) {
          //   _onUpdateScroll(scrollNotification.metrics);
          // } else if (scrollNotification is ScrollEndNotification) {
          //   _onEndScroll(scrollNotification.metrics);
          // }
          return false;
        },
        child: GridView.count(
          // controller: _scrollController,
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


