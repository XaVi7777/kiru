import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/app_images.dart';
import 'package:kiru/features/home/presentation/ui/home_screen_body.dart';
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
      body:HomeScreenBody(),

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




