import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/home.dart';
import 'tag_pill_widget.dart';

class SearchFoods extends StatefulWidget {
  const SearchFoods({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchFoods> createState() => _SearchFoodsState();
}

class _SearchFoodsState extends State<SearchFoods> {
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
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.purple,
                            size: 30,
                          ),
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
