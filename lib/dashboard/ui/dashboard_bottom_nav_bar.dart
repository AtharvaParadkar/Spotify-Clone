import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../routes/routes.dart';
import '../../utils/common_textstyles.dart';
import '../bloc/dashboard_bloc.dart';

class DashboardBottomNavBar extends StatefulWidget {
  const DashboardBottomNavBar({super.key});

  @override
  State<DashboardBottomNavBar> createState() => _DashboardBottomNavBarState();
}

class _DashboardBottomNavBarState extends State<DashboardBottomNavBar> {
  // final DashboardBloc _bloc = DashboardBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      // bloc: _bloc,
      builder: (context, state) {
        final selectedIndex = (state as DashboardInitial).selectedPageIndex;
        return BottomAppBar(
          height: 8.h,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTabItem(context, 0, Icons.home, 'Home', selectedIndex),
              _buildTabItem(context, 1, Icons.search, 'Search', selectedIndex),
              _buildTabItem(context, 2, Icons.library_books, 'YourLibrary', selectedIndex),
              _buildTabItem(context, 3, Icons.add, 'Create', selectedIndex),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabItem(BuildContext context, int index, IconData icon, String label, int selectedIndex) {
    final isSelected = index == selectedIndex;
    final color = /*isSelected ? Colors.green :*/ Colors.white; // Adjust colors as needed

    return GestureDetector(
      onTap: () {
        final currentRoute = ModalRoute.of(context)?.settings.name;
        print("!@!@!@!@!#!@@!# $currentRoute");
        if (currentRoute != RouteConstants.dashboardScreen && currentRoute != null) {
          // Navigator.pop(context);
          Navigator.popUntil(context, (route) => route.settings.name == RouteConstants.dashboardScreen);
        }
        BlocProvider.of<DashboardBloc>(context).add(DashboardTabSwitchEvent(selectedTabIndex: index));
      },
      child: SizedBox(
        width: 19.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            Text(label, style: CommonTextStyles.regular(9.spa, color)),
          ],
        ),
      ),
    );
  }

}
