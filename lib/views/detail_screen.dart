import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.article});
  final ArticleModel article;

  Future<void> _launchUrl(String url) async {
    print("clicked");
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            ),
          )),
      body: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title!,
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      wordSpacing: 1,
                    ),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                article.author == null
                    ? Text(
                        "By anonymous",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Text(
                        "By ${article.author}",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                article.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(article.urlToImage!),
                      )
                    : Container(),
                const SizedBox(height: 20),
                Text(
                  article.content!,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _launchUrl(article.url!);
                  },
                  child: const Text("read full article"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
