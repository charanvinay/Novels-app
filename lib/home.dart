import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:novels_app/carousel_image_slider.dart';
import 'package:novels_app/category_chip.dart';
import 'package:novels_app/colors_values.dart';
import 'package:novels_app/grid_card.dart';
import 'package:novels_app/heading_text.dart';
import 'package:novels_app/novel_model.dart';
import 'package:novels_app/novels.dart';

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
  List<NovelModel> filteredNovels = <NovelModel>[];
  bool _loading = true;
  bool _visible = true;

  final _controller = ScrollController();
  bool _displaybackToTopButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNovels();
    _controller
      ..addListener(() {
        setState(() {
          if (_controller.offset >= 400) {
            _displaybackToTopButton = true;
          } else {
            _displaybackToTopButton = false;
          }
        });
      });
  }

  getNovels() async {
    Novels novelsClass = Novels();
    await novelsClass.getNovels();
    novels = novelsClass.novels;
    filteredNovels = novels;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _visible = true;
      },
      child: Scaffold(
        backgroundColor: bgBlue,
        appBar: AppBar(
          title: Text(
            "Novels",
            style: TextStyle(
              fontFamily: 'Product Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Icon(Icons.menu),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [bc5, bc6]),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [bc5, bc6]),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextField(
                style: new TextStyle(color: bc6),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: bc6),
                  hintText: "What are you looking for?",
                  hintStyle: TextStyle(
                    color: Colors.black12,
                    fontFamily: 'Product Sans',
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      if (value == null) {
                        _visible = true;
                      }
                      filteredNovels = novels
                          .where((nov) => nov.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    },
                  );
                },
                onTap: () {
                  setState(() {
                    _visible = false;
                  });
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _controller,
                child: Container(
                  color: bgBlue,
                  child: Column(
                    children: [
                      _loading
                          ? Container(
                              height: MediaQuery.of(context).size.height / 1.3,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Column(
                              children: [
                                Visibility(
                                  visible: _visible,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CarouselImageSlider(
                                        carouselImages: carouselImages,
                                      ),
                                      SizedBox(height: 10),
                                      HeadingText(text: "Categories"),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          spacing: 10.0,
                                          runSpacing: 8.0,
                                          children: [
                                            CategoryChip(
                                                categoryName: categories[0]),
                                            CategoryChip(
                                                categoryName: categories[1]),
                                            CategoryChip(
                                                categoryName: categories[2]),
                                            CategoryChip(
                                                categoryName: categories[3]),
                                            CategoryChip(
                                                categoryName: categories[4]),
                                            CategoryChip(
                                                categoryName: categories[5]),
                                            CategoryChip(
                                                categoryName: categories[6]),
                                            CategoryChip(
                                                categoryName: categories[7]),
                                          ],
                                        ),
                                      ),
                                      HeadingText(text: "Books for Romance"),
                                    ],
                                  ),
                                ),
                                GridView.builder(
                                  itemCount: filteredNovels.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 6.0,
                                    mainAxisSpacing: 4.0,
                                    childAspectRatio: (width / (height / 1.4)),
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GridCard(
                                      name: filteredNovels[index].name,
                                      one_week_rent_price: filteredNovels[index]
                                          .one_week_rent_price,
                                      mrp: filteredNovels[index].mrp,
                                      imgSrc: filteredNovels[index].image,
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
          ],
        ),
        floatingActionButton: _displaybackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: scrollUp,
                backgroundColor: bc6,
                child: Icon(Icons.arrow_upward),
              ),
      ),
    );
  }

  void scrollUp() {
    _controller.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
