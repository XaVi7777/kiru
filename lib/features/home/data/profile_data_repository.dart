import 'package:kiru/features/home/models/user_profile_model.dart';

class ProfileDataRepository {
  Future<UserProfileModel> fetchProfileData() async {
    await Future.delayed(Duration(seconds: 2));
    return UserProfileModel(
      email: 'test@test.com',
      likesCount: 15,
      subscribersCount: 34000,
      publicationsCount: 100,
      isVerificated: true,
      description: 'Какое-то описание',
      avatarUrl: 'https://avatars.mds.yandex.net/i?id=5030061178d0a772810cbf3cd814c27d_l-5231964-images-thumbs&n=13'
    );
  }
}
