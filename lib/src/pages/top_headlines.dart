import 'package:flexnews/src/controllers/market_status_controller.dart';
import 'package:flexnews/src/models/everything_model/all_news.dart';
import 'package:flexnews/src/pages/news_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({super.key});

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  final List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];
  String selectedCategory = 'business';
  late Future<AllNewsResponse> futureAllHeadlines;
  @override
  void initState() {
    super.initState();
    futureAllHeadlines = fetchHeadlines(selectedCategory);
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      futureAllHeadlines = fetchHeadlines(selectedCategory);
    });
  }

  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Get.snackbar('Error', 'could not launch news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Headline News',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Center(child: Icon(Icons.search)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _onCategorySelected(categories[index]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Chip(
                            label: Text(
                          categories[index],
                          style: TextStyle(
                              color: selectedCategory == categories[index]
                                  ? Colors.blue
                                  : Colors.black),
                        )),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: FutureBuilder(
                    future: futureAllHeadlines,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        return ListView.separated(
                            separatorBuilder: (context, index) =>
                                Divider(color: Colors.grey[400], height: 0.5),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.allArticals?.length ?? 0,
                            itemBuilder: (context, index) {
                              final article =
                                  snapshot.data!.allArticals![index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsDetailPage(
                                              article: article)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 130,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          article.imageUrl ??
                                                              'https://images.wallpapersden.com/image/wxl-bitcoin-cryptocurrency-coin_76063.jpg'),
                                                      fit: BoxFit.cover)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: Text(
                                                  article.title ?? "No title",
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                const Text(
                                                  "Author:",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  article.author ?? "Unknown",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                const Text(
                                                  "Published at:",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  article.publishedAt ?? "",
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('No data available'),
                        );
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
