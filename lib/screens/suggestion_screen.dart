import 'package:flutter/material.dart';

import 'package:osmmas/widgets/page_title.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:osmmas/widgets/suggestion.dart';

class SuggestionScreen extends StatelessWidget {
  static const String routeName = "suggestion";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Osmmas"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            //for the title and subtitle
            alignment: Alignment.center,
            child: Column(
              children: [
                PageTitle("SUGGESTIONS", false),
                Text(
                  "From Parents",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(96, 100, 102, 1.0), fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            height: 600,
            child: swipperWidget(),
          )
        ]));
  }
}

class swipperWidget extends StatelessWidget {
  const swipperWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Suggestion();
      },
      pagination: SwiperPagination(),
      control: SwiperControl(),
    );
  }
}
