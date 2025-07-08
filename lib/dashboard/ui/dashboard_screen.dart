import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/assets_path_constants.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/dashboard/bloc/dashboard_bloc.dart';
import 'package:spotify_clone/dashboard/ui/create_tab.dart';
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
          backgroundColor: CustomColors.bgColor,
          appBar: AppBar(
            backgroundColor: CustomColors.bgColor,
            title: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber
              ),
              child: Image.asset(ImagePathConstants.splashLogo,fit: BoxFit.cover,height: 5.h,),
            ),
          ),
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
                      onTap: () => _bloc.add(DashboardTabSwitchEvent(selectedTabIndex: 0)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(Icons.home,color: Colors.white,),
                            Text('Home',style: CommonTextStyles.regular(9.spa, Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _bloc.add(DashboardTabSwitchEvent(selectedTabIndex: 1)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(Icons.search,color: Colors.white,),
                            Text('Search',style: CommonTextStyles.regular(9.spa, Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _bloc.add(DashboardTabSwitchEvent(selectedTabIndex: 2)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(Icons.library_books,color: Colors.white,),
                            Text('YourLibrary',style: CommonTextStyles.regular(9.spa, Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _bloc.add(DashboardTabSwitchEvent(selectedTabIndex: 3)),
                      child: SizedBox(
                        width: 19.w,
                        child: Column(
                          children: [
                            Icon(Icons.add,color: Colors.white,),
                            Text('Create',style: CommonTextStyles.regular(9.spa, Colors.white),),
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
