import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:novels_app/novel_model.dart';

class Novels {
  late List<NovelModel> novels = [];

  Future<void> getNovels() async {
    var response =
        await http.get(Uri.parse("https://nogozo.com/api/romance-novels/"));

    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      NovelModel novelModel = NovelModel(
        id: element['id'],
        name: element["name"],
        one_week_rent_price: element["one_week_rent_price"],
        image: element["image"],
        mrp: element["mrp"],
      );

      novels.add(novelModel);
    });
  }
}
