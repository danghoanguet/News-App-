import 'package:flutter/material.dart';

enum TabItem { trending, popular }

class TabItemData {
  final String title;
  final IconData icon;

  const TabItemData({required this.title, required this.icon});

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.trending:
        TabItemData(icon: Icons.movie_creation_outlined, title: 'Trending'),
    TabItem.popular: TabItemData(icon: Icons.movie_creation, title: 'Popular'),
  };
}
