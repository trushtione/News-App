import 'package:flutter/material.dart';
import 'package:news_app/views/detail_screen.dart';

import '../models/article_model.dart';

class ListCard extends StatelessWidget {
  ListCard({
    super.key,
    required this.articleList,
    required this.index,
  });
  final List<ArticleModel> articleList;
  final int index;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(article: articleList[index])));
      },
      child: articleList[index].title == "[Removed]"
          ? Container()
          : Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        spreadRadius: 1)
                  ]),
              height: height * 0.15,
              margin: EdgeInsets.only(
                  bottom: height * 0.01,
                  top: height * 0.01,
                  left: width * 0.02,
                  right: width * 0.02),
              child: Container(
                height: height * 0.15,
                width: width * 0.55,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: 22,
                ),
                child: Text(
                  articleList[index].title!,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
    );
  }
}
