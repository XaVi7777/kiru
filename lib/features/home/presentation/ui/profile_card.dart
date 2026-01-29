import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/features/home/data/profile_data_repository.dart';
import 'package:kiru/features/home/presentation/bloc/profile_data_bloc.dart';
import 'package:kiru/login/icon_with_background.dart';
import 'package:kiru/widgets/app_avatar.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDataBloc>(
      create: (BuildContext context) =>
          ProfileDataBloc(ProfileDataRepository())
            ..add(ProfileDataFetchEvent()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        constraints: BoxConstraints(minHeight: 245),
        child: BlocBuilder<ProfileDataBloc, ProfileDataState>(
          builder: (context, state) {
            if (state is ProfileDataLoadingState) {
              return SizedBox(
                width: 36,
                height: 36,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state is ProfileDataLoadedState) {
              return Column(
                children: [
                  AppAvatar(imageUrl: state.userData.avatarUrl),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.userData.name ?? state.userData.email,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (state.userData.isVerificated)
                        Image.asset(AppImages.verified, width: 18, height: 18),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _Stat(
                          value: _getValue(state.userData.subscribersCount),
                          label: 'Подписчики',
                        ),
                      ),
                      Expanded(
                        child: _Stat(
                          value: _getValue(state.userData.likesCount),
                          label: 'Лайки',
                        ),
                      ),
                      Expanded(
                        child: _Stat(
                          value: _getValue(state.userData.publicationsCount),
                          label: 'Публикации',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 14),
                  Text(
                    state.userData.description ?? '',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                      height: 1.35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
            return Container();
          },
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
