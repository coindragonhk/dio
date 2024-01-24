import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/model/navigation/navigation.dart';
import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/page/main/bloc/main_cubit.dart';
import 'package:dtg_web_admin/src/page/content_main_drawer/content_main_drawer.dart';
import 'package:dtg_web_admin/src/page/main_drawer/main_drawer_page.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/region_provider.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dtg_web_admin/src/utils/const.dart';
import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:dtg_web_admin/src/utils/scroll_to_id/scroll_to_id.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:flutter/foundation.dart';

class HomeWebsitePage extends StatefulWidget {
  const HomeWebsitePage({Key? key}) : super(key: key);

  @override
  _HomeWebsitePageState createState() => _HomeWebsitePageState();
}

class _HomeWebsitePageState extends State<HomeWebsitePage>
    with WidgetsBindingObserver {
  late HomeCubit _cubit;
  final MainCubit _mainCubit = GetIt.I<MainCubit>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  late ScrollToId _scrollToId;
  DrawerStep _initDrawerStep = DrawerStep.MAIN;
  final ContentMainDrawerCubit _drawerCubit = GetIt.I<ContentMainDrawerCubit>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _cubit = GetIt.I<HomeCubit>();

    //_cubit.getIp();
    _scrollToId = ScrollToId(scrollController: _scrollController);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            /*if (state is ScrollToSectionState) {
              scrollToId(state.sectionId);
            }*/
            if (state is HomeLoadIpSuccess) {
              Provider.of<AppLocale>(context, listen: false).locale =
                  Locale(Globals.DEFLANG, Globals.REGION);
              _mainCubit.switchLanguage(context,
                  languageCode: Globals.DEFLANG, setDefault: true);
            }
          },
          builder: (context, state) {
            return Scaffold(
                key: _scaffoldKey,
                backgroundColor: R.color.backgroundColor,
                drawer: MainDrawerPage(
                  initialStep: _initDrawerStep,
                  onSelectIndex: (value) {
                    scrollToId(SectionId.CAROUSEL);
                  },
                ),
                onDrawerChanged: (isOpened) {
                  if (!isOpened) {
                    _initDrawerStep = DrawerStep.MAIN;
                    _cubit.refreshHome();
                  }
                },
                body: _buildPage(context, state));
          },
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, HomeState state) {
    return Stack(
      children: [
        _mainHomePage(context),
        /*
        MainHeaderBarWebsiteWidget(
          onDownloadAppTap: () {
            scrollToId(SectionId.FOOTER_APP);
          },
          onFindKioskTap: () {
            scrollToId(SectionId.MAP);
          },
          onHeaderTap: () {
            scrollToId(SectionId.CAROUSEL);
          },
        ),*/
      ],
    );
  }

  Widget _mainHomePage(BuildContext context) {
    return InteractiveScrollViewer(
      scrollToId: _scrollToId,
      children: <ScrollContent>[
        /*
        ScrollContent(
          id: SectionId.CAROUSEL.name,
          child: const MainCarouselWebsitePage(),
        ),
        ScrollContent(
            id: SectionId.SERVICE_OUTPUT.name,
            child: ServiceOutputPage(
              onTapFindKiosk: () {
                scrollToId(SectionId.MAP);
              },
              onTapViewAll: () {
                scrollToId(SectionId.SERVICE_OUTPUT);
              },
              onTapOptions: () {
                scrollToId(SectionId.CAROUSEL);
              },
            )),
        ScrollContent(
            id: SectionId.ACCEPT_SERVICE.name,
            child: const AcceptServicesWidget()),
        ScrollContent(
            id: SectionId.MAP.name, child: /*MapWebFrame() */ const MapPage()),
        ScrollContent(
            id: SectionId.FOOTER_APP.name,
            child: FooterApplicationWidget(
              onTapSignIn: () {
                _initDrawerStep = DrawerStep.LOGIN;
                _cubit.refreshHome();
                Future.delayed(const Duration(milliseconds: 100), () {
                  _scaffoldKey.currentState?.openDrawer();
                });
              },
            )),
        ScrollContent(
            id: SectionId.FOOTER_INFO.name,
            child: FooterInfoWidget(
              onNavigationPage: () {
                scrollToId(SectionId.CAROUSEL);
              },
            ))
            */
      ],
    );
  }

  void scrollToId(SectionId part) {
    if (!Utils.isDesktopWeb(context)) {
      /*
      if (part == SectionId.MAP) {
        scrollToId(SectionId.CAROUSEL);
        NavigationUtils.rootNavigatePageWithName(
                context, const MapFullPage(), Routes.ROUTE_MAP)
            .then((value) => _drawerCubit.selectDrawerIndex(isBack: true));
        return;
      }*/
      if (part == SectionId.FOOTER_APP) {
        logger.d(defaultTargetPlatform);
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          Utils.launchURL(Const.APP_STORE_URL);
          return;
        }
        if (defaultTargetPlatform == TargetPlatform.android) {
          Utils.launchURL(Const.PLAY_STORE_URL);
          return;
        }
      }
    }
    NavigationUtils.popToFirst(context);
    _scrollToId.animateTo(part.name,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
        extraOffset: 0 -
            ((Utils.isDesktopWeb(context) ? 96 : 64) +
                (Utils.isDesktopWeb(context) ? 12 : 0)));
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
