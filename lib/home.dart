import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:novels_app/carousel_image_slider.dart';
import 'package:novels_app/category_chip.dart';
import 'package:novels_app/colors_values.dart';
import 'package:novels_app/novel_model.dart';
import 'package:novels_app/novels.dart';
import 'package:novels_app/search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> carouselImages = [
    "https://nogozo.com/static/book/images/c1.webp",
    "https://nogozo.com/static/book/images/c2.webp",
    "https://nogozo.com/static/book/images/c3.webp",
    "https://nogozo.com/static/book/images/c4.webp",
    "https://nogozo.com/static/nsp/images/c5.webp"
  ];

  final List<String> categories = [
    "IIT JEE",
    "NEET",
    "XI BOOKS",
    "IX & X",
    "ICSE & ISC",
    "Engineering",
    "Govt Exams",
    "Novels"
  ];

  List<NovelModel> novels = <NovelModel>[];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNovels();
  }

  getNovels() async {
    Novels novelsClass = Novels();
    await novelsClass.getNovels();
    novels = novelsClass.novels;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: bgBlue,
        appBar: AppBar(
          title: Text(
            "Novels",
            style: TextStyle(
                fontFamily: 'Product Sans', fontWeight: FontWeight.w500),
          ),
          leading: Icon(Icons.menu),
          elevation: 0,
          flexibleSpace: Container(
            decoration:
                BoxDecoration(gradient: LinearGradient(colors: [bc5, bc6])),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: bgBlue,
            child: Column(
              children: [
                SearchBar(),
                _loading
                    ? Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselImageSlider(carouselImages: carouselImages),
                          SizedBox(height: 10),
                          HeadingText(text: "Categories"),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 10.0,
                              runSpacing: 8.0,
                              children: [
                                CategoryChip(categoryName: categories[0]),
                                CategoryChip(categoryName: categories[1]),
                                CategoryChip(categoryName: categories[2]),
                                CategoryChip(categoryName: categories[3]),
                                CategoryChip(categoryName: categories[4]),
                                CategoryChip(categoryName: categories[5]),
                                CategoryChip(categoryName: categories[6]),
                                CategoryChip(categoryName: categories[7]),
                              ],
                            ),
                          ),
                          HeadingText(text: "Books for Romance"),
                          GridView.builder(
                            itemCount: novels.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6.0,
                              mainAxisSpacing: 4.0,
                              childAspectRatio: (width / (height / 1.5)),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GridCard(
                                name: novels[index].name,
                                one_week_rent_price:
                                    novels[index].one_week_rent_price,
                                mrp: novels[index].mrp,
                                imgSrc: novels[index].image,
                              );
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final String? imgSrc, name, one_week_rent_price, mrp;
  const GridCard({
    Key? key,
    this.imgSrc,
    this.name,
    this.one_week_rent_price,
    this.mrp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String oldMoney = "\u{20B9}" + mrp!;
    String newMoney = "\u{20B9}" + one_week_rent_price!;
    return Container(
      child: Card(
        // elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            color: cardbg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 4),
                Image.network(
                  imgSrc!,
                  fit: BoxFit.contain,
                  height: 170,
                  width: double.infinity,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          name!,
                          // textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: cardBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              newMoney,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.red[900],
                                fontFamily: 'Product Sans',
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              oldMoney,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red[300],
                                  decorationThickness: 2,
                                  color: bc5,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String? text;
  const HeadingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: bc6,
          fontFamily: 'Product Sans',
        ),
      ),
    );
  }
}
