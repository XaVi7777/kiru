import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/features/home/data/profile_data_repository.dart';
import 'package:kiru/features/home/presentation/bloc/profile_data_bloc.dart';
import 'package:kiru/features/home/presentation/ui/home_feed.dart';
import 'package:kiru/login/icon_with_background.dart';
import 'package:kiru/widgets/app_avatar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDataBloc>(
      create: (BuildContext context) =>
          ProfileDataBloc(ProfileDataRepository())
            ..add(ProfileDataFetchEvent()),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              constraints: BoxConstraints(minHeight: 245),
              alignment: Alignment.center,
              child: BlocBuilder<ProfileDataBloc, ProfileDataState>(
                builder: (context, state) {
                  if (state is ProfileDataStateLoading) {
                    return SizedBox(
                      height: 36,
                      width: 36,
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProfileDataStateLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        AppAvatar(imageUrl: state.user.avatarUrl),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Text(state.user.name ?? state.user.email),
                            if (state.user.isVerificated)
                              Image.asset(
                                AppImages.verified,
                                width: 18,
                                height: 18,
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _Stat(
                                value: _getValue(state.user.subscribersCount),
                                label: 'Подписчики',
                              ),
                            ),
                            Expanded(
                              child: _Stat(
                                value: _getValue(state.user.likesCount),
                                label: 'Лайки',
                              ),
                            ),
                            Expanded(
                              child: _Stat(
                                value: _getValue(state.user.publicationsCount),
                                label: 'Публикации',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.grey,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Редактировать',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconWithBackground(
                              icon: AppImages.messages,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 10),
                            IconWithBackground(
                              icon: AppImages.instagram,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                        Text(state.user.description ?? ''),
                      ],
                    );
                  } else if (state is ProfileDataStateError) {
                    return Center(child: Text('Что-то пошло не так'));
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            HomeFeed(),
          ],
        ),
      ),
    );
  }

  String _getValue(int count) {
    if (count < 1000) {
      return count.toString();
    }
    final result = count / 1000;
    return '${result.toString().replaceAll('.', ',')}К';
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}


// class _PostsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.grey,
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               spacing: 8,
//               children: [
//                 Icon(Icons.add_circle, color: AppColors.black, size: 18),
//                 const Text(
//                   'Опубликовать',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           _PostGrid(),
//         ],
//       ),
//     );
//   }
// }




