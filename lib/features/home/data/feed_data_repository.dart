import 'package:kiru/features/home/models/app_image.dart';

class FeedDataRepository {
  Future<List<AppImageModel>> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      AppImageModel(
        id: '1',
        url:
            'https://avatars.mds.yandex.net/i?id=39d1c20a406dd09760c65d90b1648e42a3b55c26-5233530-images-thumbs&n=13',
      ),
    ];
  }
}
