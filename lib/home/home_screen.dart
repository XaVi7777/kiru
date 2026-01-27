import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/app_colors.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/login/icon_with_background.dart';
import 'package:kiru/widgets/svg_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F5),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(AppImages.settings, width: 24, height: 24),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset(AppImages.more, width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _ProfileCard(),
            const SizedBox(height: 20),
            _PostsSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/favorites');
              break;
            case 2:
              context.go('/recommendations');
              break;
            default:
              throw Exception('Invalid index');
          }
        },
        items: [
          BottomNavigationBarItem(icon: SvgIcon.home(), label: ''),
          BottomNavigationBarItem(icon: SvgIcon.favorites(), label: ''),
          BottomNavigationBarItem(icon: SvgIcon.recommendations(), label: ''),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42,
            child: ClipOval(
              child: Image.asset(
                AppImages.profileAvatar,
                width: 84,
                height: 84,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 54,
                    color: AppColors.white,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BloodStyle',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 6),
              Image.asset(AppImages.verified, width: 18, height: 18),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _Stat(value: '3,8K', label: 'Подписчики'),
              ),
              Expanded(
                child: _Stat(value: '5,4K', label: 'Лайки'),
              ),
              Expanded(
                child: _Stat(value: '7', label: 'Публикации'),
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
          const Text(
            'Сотворю твой успех с помощью 100+ огненных образов. Моим капсулами пользуются более 2500 девушек — присоединяйся и ты!',
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.black87,
              height: 1.35,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
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
