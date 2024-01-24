import 'package:collection/collection.dart';
import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/main.dart';
import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/page/content_main_drawer/content_main_drawer.dart';
import 'package:dtg_web_admin/src/page/home/home.dart';
import 'package:dtg_web_admin/src/utils/custom_navigator_observer.dart';
import 'package:dtg_web_admin/src/utils/region_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'main.dart';

final CustomNavigatorObserver homeNavigatorObserver = CustomNavigatorObserver();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  final HomeCubit _homeCubit = GetIt.I<HomeCubit>();
  final MainCubit _cubit = GetIt.I<MainCubit>();
  bool isDrawerOpened = false;
  final ContentMainDrawerCubit _drawerCubit = GetIt.I<ContentMainDrawerCubit>();
  final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cubit.getIp();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cubit.subscriptions.forEach((element) {
      element.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_homeNavigatorKey.currentContext != null &&
            NavigationUtils.canPop(_homeNavigatorKey.currentContext!)) {
          NavigationUtils.popPage(_homeNavigatorKey.currentContext!);
          _cubit.refreshMain();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor:
            isDrawerOpened ? R.color.backgroundRed : R.color.backgroundColor,
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is MainLoadIpSuccess) {
              Provider.of<AppLocale>(context, listen: false).locale =
                  Locale(Globals.DEFLANG, Globals.REGION);
              _cubit.switchLanguage(context,
                  languageCode: Globals.DEFLANG, setDefault: true);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                  backgroundColor: isDrawerOpened
                      ? R.color.backgroundRed
                      : R.color.backgroundColor,
                  onDrawerChanged: (isOpened) {
                    setState(() {
                      isDrawerOpened = isOpened;
                    });
                  },
                  drawer: NavigationUtils.canPop(
                          _homeNavigatorKey.currentContext ?? context)
                      ? null
                      : const SizedBox(),
                  body: _buildPage(context, state)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, MainState state) {
    return Stack(
      children: [],
    );
  }

  Widget nestedNavigatorWidget(
      {required GlobalKey key, required Widget child}) {
    return Navigator(
      key: key,
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => child,
      ),
      observers: [homeNavigatorObserver],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        Future.delayed(const Duration(seconds: 1), () {
          _drawerCubit.selectDrawerIndex(index: 0);
        });
        break;
    }
  }
}
