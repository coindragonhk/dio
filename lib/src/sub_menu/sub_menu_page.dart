import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/page/content_main_drawer/content_main_drawer.dart';
import 'package:dtg_web_admin/src/page/content_main_drawer/content_main_drawer_website_page.dart';
import 'package:dtg_web_admin/src/page/main_drawer/main_drawer_page.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/max_width_container.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:dtg_web_admin/src/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'sub_menu.dart';

class SubMenuPage extends StatefulWidget {
  const SubMenuPage({Key? key}) : super(key: key);

  @override
  _SubMenuPageState createState() => _SubMenuPageState();
}

class _SubMenuPageState extends State<SubMenuPage> {
  late SubMenuCubit _cubit;
  final ContentMainDrawerCubit _drawerCubit = GetIt.I<ContentMainDrawerCubit>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _cubit = SubMenuCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocConsumer<SubMenuCubit, SubMenuState>(
          listener: (context, state) {
            if (state is SubMenuJumpToPosition) {
              _scrollController.jumpTo(0);
            }
          },
          builder: (context, state) {
            return Scaffold(
                backgroundColor: R.color.backgroundColor,
                drawer: MainDrawerPage(
                  onSelectIndex: (value) {
                    _scrollController.jumpTo(0);
                  },
                ),
                body: _buildPage(context, state));
          },
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, SubMenuState state) {
    return LoadingContainer(
      isLoading: state is SubMenuLoading,
      child: Stack(
        children: [
          ImprovedScrolling(
            scrollController: _scrollController,
            enableKeyboardScrolling: true,
            keyboardScrollConfig:
                const KeyboardScrollConfig(spaceScrollAmount: 0),
            child: ListView(
              shrinkWrap: true,
              controller: _scrollController,
              padding: EdgeInsets.zero,
              children: [
                MaxWidthContainer(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: Utils.isDesktopWeb(context)
                              ? R.dimen.padding_page
                              : R.dimen.padding_page_mobile,
                          right: Utils.isDesktopWeb(context)
                              ? R.dimen.padding_page
                              : R.dimen.padding_page_mobile,
                          bottom: 80),
                      child: BlocProvider.value(
                          value: _cubit, child: childWidget())),
                ),
                /*FooterInfoWidget(
                  onNavigationPage: () {
                    _scrollController.jumpTo(0);
                  },
                )*/
              ],
            ),
          ),
          // MainHeaderBarWebsiteWidget(),
        ],
      ),
    );
  }

  Widget childWidget() {
    String? currentRouteName = ModalRoute.of(context)?.settings.name;
    int? index = _drawerCubit.selectedDrawerIndex;
    logger.d(currentRouteName ?? "NULL");
    Widget subMenuWidget = ContentMainDrawerWebsitePage(
      onSelectIndex: (index) {
        Utils.rewriteUrl(index);
        _cubit.refreshSubMenu();
      },
      isDrawer: false,
    );
    if (index == null || index == 0) {
      NavigationUtils.popToFirst(context);
      return Container();
    }

    if (index == 1) {
      //return MyVouchersWebsitePage(subMenuWidget: subMenuWidget);
      return Container();
    } else if (index == 2) {
      //return TransactionHistoryWebsitePage(subMenuWidget: subMenuWidget);
      return Container();
    } else if (index == 3) {
      //return TopUpWebsitePage(subMenuWidget: subMenuWidget);
      return Container();
    } else if (index == 4) {
      //return UserSettingWebsitePage(subMenuWidget: subMenuWidget);
      return Container();
    } else {
      return Container();
    }
  }
}
