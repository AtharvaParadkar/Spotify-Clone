import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/assets_path_constants.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/dashboard/bloc/dashboard_bloc.dart';
import 'package:spotify_clone/dashboard/ui/create_tab.dart';
import 'package:spotify_clone/dashboard/ui/drawer.dart';
import 'package:spotify_clone/dashboard/ui/home_tab.dart';
import 'package:spotify_clone/dashboard/ui/search_tab.dart';
import 'package:spotify_clone/dashboard/ui/your_library_tab.dart';
import 'package:spotify_clone/utils/common_textstyles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController? pageController;
  final DashboardBloc _bloc = DashboardBloc();
  // scaffold key for handle drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    _bloc.add(DashboardTabSwitchEvent(selectedTabIndex: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: _bloc,
      builder: (context, state) {
        final buildState = state as DashboardInitial;

        if (!buildState.isInitial) {
          pageController!.jumpToPage(buildState.selectedPageIndex);
        }

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColors.bgColor,
          appBar: AppBar(
            backgroundColor: CustomColors.bgColor,
            leading: GestureDetector(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                height: 7.h,
                width: 7.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(ImagePathConstants.splashLogo),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          drawer: ProfileDrawer(),
          bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
            bloc: _bloc,
            builder: (context, state) {
              return BottomAppBar(
                height: 8.h,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => _bloc
                          .add(DashboardTabSwitchEvent(selectedTabIndex: 0)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            Text(
                              'Home',
                              style:
                                  CommonTextStyles.regular(9.spa, Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _bloc
                          .add(DashboardTabSwitchEvent(selectedTabIndex: 1)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            Text(
                              'Search',
                              style:
                                  CommonTextStyles.regular(9.spa, Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _bloc
                          .add(DashboardTabSwitchEvent(selectedTabIndex: 2)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(
                              Icons.library_books,
                              color: Colors.white,
                            ),
                            Text(
                              'YourLibrary',
                              style:
                                  CommonTextStyles.regular(9.spa, Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _bloc
                          .add(DashboardTabSwitchEvent(selectedTabIndex: 3)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'Create',
                              style:
                                  CommonTextStyles.regular(9.spa, Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeTab(),
              SearchTab(),
              YourLibraryTab(),
              CreateTab(),
            ],
          ),
        );
      },
    );
  }
}
