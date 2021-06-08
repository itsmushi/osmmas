import 'package:flutter/material.dart';
import 'package:osmmas/models/suggestion_model.dart';
import 'package:osmmas/providers/suggestion_provider.dart';

import 'package:provider/provider.dart';
import 'package:osmmas/widgets/page_title.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:osmmas/widgets/suggestion.dart';

class SuggestionScreen extends StatelessWidget {
  static const String routeName = "suggestion";

  Future<void> _refreshSuggestions(
    BuildContext context,
  ) async {
    await Provider.of<SuggestionProvider>(context).fetchSuggestion();
  }

  bool firstTime = true;
  int count = 1;
  bool showLoading = true;

  List<SuggestionModel> suggestionsData;
  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      _refreshSuggestions((context)).then((value) => {
            suggestionsData =
                Provider.of<SuggestionProvider>(context, listen: false)
                    .suggestion,
            showLoading = false,
            firstTime = false,
            print(suggestionsData),
            // announcementsData.forEach((element) {
            //   announcementWidgets.add(
            //     Announcement(
            //       announceDesc: element.announceDesc,
            //       createdOn: element.createdOn,
            //       title: element.title,
            //     ),
            //   );
            // })
          });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmmas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //for the title and subtitle
              alignment: Alignment.center,
              child: Column(
                children: [
                  PageTitle("SUGGESTIONS", false),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "From Parents",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(96, 100, 102, 1.0),
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 500,
              height: 600,
              child: swipperWidget(),
            ),
          ],
        ),
      ),
    );
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
