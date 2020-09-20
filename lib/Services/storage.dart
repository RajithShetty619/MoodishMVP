import 'package:firebase_storage/firebase_storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';

class Storage {
  final StorageReference _ref = FirebaseStorage().ref().child("food");
  List<String> urlList = [];

  List<String> listUrl(List<FoodListModel> food) {
    food.map((e) async {
      String _url = await getUrl(e.images);
      urlList.add(_url);
    });
    return urlList;
  }

  Future<String> getUrl(String path) async {
    try {
      final dynamic _url =
          await _ref.child(path + ".jpg").getDownloadURL().catchError(() {});
      String url = _url;
      return url;
    } catch (e) {
      print('path is probably wrong blame the database :/');
      return "https://www.shorturl.at/img/shorturl-square.png";
    }
  }
}
