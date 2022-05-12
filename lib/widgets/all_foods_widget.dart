
import 'package:flutter/material.dart';

import 'grid_view_widget.dart';

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
