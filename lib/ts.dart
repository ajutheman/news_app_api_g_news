import 'package:dio/dio.dart';
//import 'package:flightbooking/models/news_model';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Model/newsmodel.dart';
import 'image_veiw.dart';

class Ts extends StatefulWidget {
  const Ts({Key? key}) : super(key: key);

  @override
  _TsState createState() => _TsState();
}

class _TsState extends State<Ts> {
  bool isLoading = false;
  List<dynamic> articles = [];
  NewsModel newsModel = NewsModel();
  int totalArticles = 0;
  String inmg = " ";
  TextEditingController loctionController = TextEditingController();
  final dio = Dio();

  Future<void> getNews(String country) async {
    setState(() {
      isLoading = true;
    });

    final response = await dio.get(
        "https://gnews.io/api/v4/search?q=${country}&lang=en&country=us&max=10&apikey=4d7773465af7c040d029aa6e0f93e675");

    if (response.statusCode == 200) {
      setState(() {
        newsModel = NewsModel.fromJson(response.data);
        print(newsModel);
        print(newsModel.articles?.first.title);
        articles = response.data["articles"];
        isLoading = false;
      });
      totalArticles = newsModel.totalArticles!;
    } else {
      setState(() {
        isLoading = false;
      });
      print("Failed to fetch articles");
    }
  }

  @override
  void initState() {
    super.initState();
    getNews('us');
  }

  Future<void> _refresh() async {
    await getNews('in');
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: TextField(controller: loctionController),
        actions: [
          IconButton(
              onPressed: () {
                getNews(loctionController.text);
              },
              icon: Icon(Icons.search))
        ],
        //title: Text("News App"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _refresh,
              child: PageView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final article = articles[index];
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ImageVeiw(
                                    imageUrl:
                                        newsModel.articles![index].image!),
                              ),
                            ),
                            child: Image.network(
                              newsModel.articles![index]
                                  .image!, // Use the image URL from the article
                              height: 350,
                              width: 620,
                              fit: BoxFit.fitWidth, // Set your preferred height
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              print("tappeddddd");

                              await _launchInBrowser(
                                  // "www.cricketaddictor.com"
                                  newsModel.articles![index].url!

                                  // "www.cylog.org"
                                  );
                              // launchUrl(newsModel.articles![index].url!);
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  newsModel.articles![index]
                                      .title!, // Use the title from the article
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  newsModel.articles![index].content!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  newsModel.articles![index]
                                      .description!, // Use the title from the article
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                Container(
                                  color: Colors.cyan,
                                  child: Text(
                                    newsModel.articles![index]
                                        .url!, // Use the title from the article
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Text(
                          //   newsModel.articles![index]
                          //       .url!, // Use the title from the article
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //     fontWeight: FontWeight.w200,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newsModel.articles?.length,
              ),
            ),
    );
  }

  Future<void> _launchInBrowser(String urll) async {
    var url = Uri.parse(urll);
    print("url");
    print(url);
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

// launchUrl(Uri url) async {
//   print(url);
//   try {
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//     // launchUrl(url);
//   } catch (e) {
//     print("error$e");
//   }
// }

// launchUrl(String url) async {
//   Uri uri = Uri.parse(url);
//   try {
//     if (!await launchUrl(uri.path)) {
//       throw Exception('Could not launch $url');
//     }
//     // launchUrl(url);
//   } catch (e) {
//     print("error$e");
//   }
// }
