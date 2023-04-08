import 'package:flutter/material.dart';

import '/services/api_service.dart';
import '/utils/colors.dart';
import '/widgets/common/search_footer.dart';
import '/widgets/common/search_header.dart';
import '/widgets/common/search_option_tabs.dart';
import '/widgets/common/search_result.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery, startIndex;
  const SearchScreen(
      {Key? key, required this.searchQuery, this.startIndex = "0"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          // Web search header
          const SearchHeader(),
          // Search options tabs
          Padding(
            padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150),
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SearchOptionTabs(),
            )
          ),
          const Divider(
            height: 0,
            thickness: 0.3,
          ),
          // Search results
          // Pagination buttons
          FutureBuilder(
            future: ApiService(isDummy: true).fetchData(query: searchQuery),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150, top: 12),
                      child: Text(
                        "About ${snapshot.data!["searchInformation"]["totalResults"]} results fetched in ${snapshot.data!["searchInformation"]["formattedSearchTime"]}s",
                        style: const TextStyle(
                            fontSize: 15, color: Color(0xff70757a)),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              if (startIndex != "0") {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                      searchQuery: searchQuery,
                                      startIndex: (int.parse(startIndex) + 10).toString(),
                                    )
                                  )
                                );
                              }
                            },
                            child: const Text(
                              "<prev",
                              style: TextStyle(fontSize: 15, color: blueColor),
                            )
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                    searchQuery: searchQuery,
                                    startIndex: (int.parse(startIndex) + 10).toString(),
                                  )
                                )
                              );
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 15, 
                                color: blueColor
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const SearchFooter(),
                    ListView.builder(
                      itemCount: snapshot.data!["items"].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10, left: size.width <= 768 ? 10 : 150),
                          child: SearchResult(
                            link: snapshot.data!["items"][index]["link"]
                                .toString(),
                            linkToGo: snapshot.data!["items"][index]
                                    ["formattedUrl"]
                                .toString(),
                            text: snapshot.data!["items"][index]["title"]
                                .toString(),
                            description: snapshot.data!["items"][index]
                                    ["snippet"]
                                .toString(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      )),
    );
  }
}
