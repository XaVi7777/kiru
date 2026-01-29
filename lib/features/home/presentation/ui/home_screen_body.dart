import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/features/home/presentation/ui/profile_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ProfileCard(),
          const SizedBox(height: 20),
          _PostsSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}


class _PostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
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
                Icon(Icons.add_circle, color: AppColors.black, size: 18),
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
          const SizedBox(height: 16),
          _PostGrid(),
        ],
      ),
    );
  }
}



class _PostGrid extends StatelessWidget {
  static const List<String> _mockImages = [AppImages.post1, AppImages.post2];

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
      itemCount: 6,
      itemBuilder: (context, index) {
        final imagePath = _mockImages[index % _mockImages.length];
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
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
