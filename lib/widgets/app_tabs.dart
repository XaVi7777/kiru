import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';

enum _SelectedMenuitem { subscribers, recommendations }

class AppTabs extends StatefulWidget {
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {
  late _SelectedMenuitem _selectedMenuitem;

  @override
  void initState() {
    _selectedMenuitem = _SelectedMenuitem.subscribers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          children: [
            _AppTabsMenu(
              selectedMenuitem: _selectedMenuitem,
              onTapTabMenu: _onTapMenuItem,
            ),
            if(_selectedMenuitem == _SelectedMenuitem.subscribers) 
            _SubscribersContent(),

            
             if(_selectedMenuitem == _SelectedMenuitem.recommendations)
             _RecommendationsContent(),
          ],
        ),
      ),
    );
  }

  void _onTapMenuItem(_SelectedMenuitem selectedMenuitem) {
    setState(() {
      _selectedMenuitem = selectedMenuitem;
    });
  }
}

class _AppTabsMenu extends StatelessWidget {
  final _SelectedMenuitem selectedMenuitem;
  final void Function(_SelectedMenuitem) onTapTabMenu;

  const _AppTabsMenu({
    required this.selectedMenuitem,

    required this.onTapTabMenu,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.search),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  right: selectedMenuitem == _SelectedMenuitem.subscribers ? 200: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    height: double.infinity,
                    width: 160,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          onTapTabMenu.call(_SelectedMenuitem.subscribers);
                        },
                        child: Text(
                          'Подписки',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: _getTextColor(_SelectedMenuitem.subscribers),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          onTapTabMenu.call(_SelectedMenuitem.recommendations);
                        },
                        child: Text(
                          'Рекомендации',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: _getTextColor(
                              _SelectedMenuitem.recommendations,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? _getTextColor(_SelectedMenuitem current) {
    return selectedMenuitem == current ? AppColors.white : AppColors.black;
  }
}

class _SubscribersContent extends StatelessWidget {
  const _SubscribersContent();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Subscrebers content'),);
  }
}

class _RecommendationsContent extends StatelessWidget {
  const _RecommendationsContent();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Recommendations content'),);
  }
}