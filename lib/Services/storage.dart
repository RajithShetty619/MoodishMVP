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
      final dynamic _url = await _ref.child(path + ".jpg").getDownloadURL();
      String url = _url;
      return url;
    } catch (e) {
      print('path is probably wrong blame the database :/');
      return "https://firebasestorage.googleapis.com/v0/b/moodishtest.appspot.com/o/error-image-generic.png?alt=media&token=462d1ab9-ff67-40d9-ae25-8388720dc89b";
    }
  }
}
