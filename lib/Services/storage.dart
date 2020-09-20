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
      return "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2Fmn9c32es4zi21.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2Fredditmobile%2Fcomments%2Fav496u%2Fandroid321_whenever_i_download_a_gif_my_phone%2F&tbnid=-IEHNBxAHiH81M&vet=12ahUKEwiLuoe8k_frAhXOoUsFHQl3DM4QMygCegUIARDAAQ..i&docid=BgtTCZCOM9H3XM&w=1440&h=2560&q=some%20error%20%20loading%20image&ved=2ahUKEwiLuoe8k_frAhXOoUsFHQl3DM4QMygCegUIARDAAQ";
    }
  }
}
