import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/features/home/data/feed_data_repository.dart';
import 'package:kiru/features/home/models/app_image.dart';
import 'package:kiru/features/home/presentation/bloc/home_feed_bloc.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeFeedBloc>(
      create: (context) =>
          HomeFeedBloc(FeedDataRepository())..add(HomeFeedFetchDateEvent()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        constraints: BoxConstraints(minHeight: 245),
        child: BlocBuilder<HomeFeedBloc, HomeFeedState>(
          builder: (context, state) {
            if (state is HomeFeedLoadingState) {
              return SizedBox(
                height: 36,
                width: 36,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is HomeFeedLoadedState) {
              return Column(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: AppColors.black,
                          size: 18,
                        ),
                        const Text(
                          'Опубликовать',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                _PostGrid(state.images)
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _PostGrid extends StatelessWidget {
 final List<AppImageModel> images;

 const _PostGrid(this.images);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        mainAxisExtent: 213,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final imagePath = images[index].url;
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imagePath,
                width: double.infinity,
                height: 213,
                fit: BoxFit.contain,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0x80000000),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.favorite, color: Colors.white, size: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}