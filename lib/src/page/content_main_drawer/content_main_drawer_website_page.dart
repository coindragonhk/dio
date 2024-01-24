import 'package:dtg_web_admin/src/sub_menu/sub_menu.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/loading_container.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import '../../../../model/navigation/navigation.dart';
import '../../../../res/R.dart';
import 'content_main_drawer.dart';

class ContentMainDrawerWebsitePage extends StatefulWidget {
  final bool isDrawer;
  final ValueChanged<int> onSelectIndex;
  final VoidCallback? onLoggedIn;

  const ContentMainDrawerWebsitePage(
      {Key? key,
      required this.onSelectIndex,
      this.onLoggedIn,
      this.isDrawer = true})
      : super(key: key);

  @override
  _ContentMainDrawerWebsitePageState createState() =>
      _ContentMainDrawerWebsitePageState();
}

class _ContentMainDrawerWebsitePageState
    extends State<ContentMainDrawerWebsitePage> {
  final ContentMainDrawerCubit _drawerCubit = GetIt.I<ContentMainDrawerCubit>();

  bool get isSubMenuPage =>
      _drawerCubit.selectedDrawerIndex is int &&
      _drawerCubit.selectedDrawerIndex! > 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContentMainDrawerCubit>.value(
      value: _drawerCubit,
      child: BlocConsumer<ContentMainDrawerCubit, ContentMainDrawerState>(
        listener: (context, state) {
          if (state is ContentMainDrawerSelectIndexState && widget.isDrawer) {
            String route = Routes.ROUTE_MY_VOUCHERS;
            int? index = _drawerCubit.selectedDrawerIndex;
            if (index == 0) {
              //NavigationUtils.popToFirst(context);
              // return;
              // _drawerCubit.selectDrawerIndex(isBackToToFirst: true);
              return;
            } else if (index == 1) {
              route = Routes.ROUTE_MY_VOUCHERS;
            } else if (index == 2) {
              route = Routes.ROUTE_TRANSACTION_HISTORY;
            } else if (index == 3) {
              route = Routes.ROUTE_TOP_UP;
            } else if (index == 4) {
              route = Routes.ROUTE_USER_SETTING;
            }
            NavigationUtils.rootNavigatePageWithName(
                    context, const SubMenuPage(), route)
                .then((value) {
              // logger.d(ModalRoute.of(context)?.settings.name);
              _drawerCubit.selectDrawerIndex(isBack: true);
            });
          }
        },
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, ContentMainDrawerState state) {
    return LoadingContainer(
        isLoading: state is ContentMainDrawerLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: widget.isDrawer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuItemWidget(context,
                      icon: R.drawable.ic_home,
                      text: R.string.home.tr(),
                      index: 0),
                  _spaceWidget(
                    context,
                  ),
                ],
              ),
            ),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_vounchers,
                text: R.string.myvouchersabr.tr(),
                index: 1),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_tx_history,
                text: R.string.transactionhistory.tr(),
                index: 2),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_top_up,
                text: R.string.label_top_up_points.tr(),
                index: 3),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_setting,
                text: R.string.label_user_setting.tr(),
                index: 4),
          ],
        ));
  }

  Widget _spaceWidget(BuildContext context) {
    return SizedBox(
      height: Utils.isDesktopWeb(context) ? 8 : 4,
    );
  }

  Widget _buildMenuItemWidget(BuildContext context,
      {required String icon, required String text, required int index}) {
    return PointerInterceptor(
      child: SingleTapDetector(
        onTap: () {
          if (index == 0) {
            NavigationUtils.popToFirst(context);
          }
          _drawerCubit.selectDrawerIndex(
              index: index,
              isBackToToFirst: index == 0,
              isReplaceLast: isSubMenuPage,
              isDrawer: widget.isDrawer);
          widget.onSelectIndex(index);
        },
        child: Container(
          height: 56,
          padding: EdgeInsets.symmetric(
              vertical: Utils.isDesktopWeb(context) ? 13 : 8,
              horizontal: Utils.isDesktopWeb(context) ? 16 : 12),
          decoration: BoxDecoration(
              color: _drawerCubit.selectedDrawerIndex == index
                  ? R.color.primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 24,
                color: R.color.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.textSemiBoldButton(context),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
