import 'package:flutter/material.dart';

import 'all_foods_widget.dart';
import 'search_foods_widget.dart';
import 'transform_square.dart';

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
          child: TransitionTo(myWidget: _myWidget),
        ),
        if (route == routes.allFoods) ...[
          // Todo: refactor this animation
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
                  
                },
                child: const TransformSquare(),
              ),
            ),
          ),
        ] else ...[
          // Todo: refactor this animation
          AnimatedOpacity(
            opacity: (widget._heightOfModalSheet > 500) ? 0.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
                padding: EdgeInsets.only(
                  bottom: (widget._heightOfModalSheet > 500) ? 750.0 : 0.0,
                  left: (widget._heightOfModalSheet > 500) ? 300.0 : 0.0,
                ),
                duration: const Duration(seconds: 2),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _myWidget = const AllFoodsWidget();
                    route = routes.allFoods;
                  });
                  
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

class TransitionTo extends StatelessWidget {
  const TransitionTo({
    Key? key,
    required Widget myWidget,
  }) : _myWidget = myWidget, super(key: key);

  final Widget _myWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

enum routes { search, allFoods }