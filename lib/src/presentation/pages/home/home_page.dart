import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:getx_clean_base/src/presentation/pages/home/home_controller.dart';

import '../../../core/constants/app_color.dart';
import '../../../data/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init();
      print('controller home page: ${controller.articles.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Screen"),
        //automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
          onRefresh: () async => controller.getHeadlines(),
          child: FutureBuilder(
              future: controller.getHeadlines(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _buildArticleList();
              })),
    );
  }

  Widget _buildArticleList() {
    return Obx(() {
      final articles = controller.articles;
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            articles.length,
            (index) => ArticleCard(
              key: ValueKey(index),
              article: articles[index],
            ),
          ),
        ),
      );
    });
  }
}

class ArticleCard extends StatelessWidget {
  final ArticleModel article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10),
            if (article.title != null)
              Text(
                article.title!,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline3,
              ),
            const SizedBox(height: 10),
            if (article.content != null)
              Text(
                article.content!,
                maxLines: 4,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.secondaryText),
              )
          ],
        ),
      ),
    );
  }
}
