import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiru/widgets/svg_icon.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Recommendations'),
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