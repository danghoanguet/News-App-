import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/widgets/tab_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold(
      {Key? key,
      required this.currentTab,
      required this.onSelecteTab,
      required this.widgetBuilders,
      required this.navigatorKeys})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelecteTab;
  //final void Function(TabItem tabItem) onSelecteTab; same
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _buildItem(TabItem.trending),
          _buildItem(TabItem.popular),
        ],
        onTap: (index) =>
            onSelecteTab(TabItem.values[index]), // update current tab selected
      ),
      tabBuilder: (BuildContext context, int index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[item],
          builder: (context) {
            return widgetBuilders[item]!(context);
          },
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    final color =
        currentTab == tabItem ? AppColor.primaryColor : AppColor.secondaryColor;
    return BottomNavigationBarItem(
      icon: Icon(
        itemData?.icon,
        color: color,
      ),
      label: itemData?.title,
    );
  }
}
