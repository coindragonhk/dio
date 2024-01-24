import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/widgets/loading_container.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import '../../../../model/navigation/navigation.dart';
import '../../../../res/R.dart';
import 'content_main_drawer.dart';

class ContentMainDrawerPage extends StatefulWidget {
  final bool isDrawer;
  final ValueChanged<int> onSelectIndex;
  final VoidCallback? onLoggedIn;

  const ContentMainDrawerPage(
      {Key? key,
      required this.onSelectIndex,
      this.onLoggedIn,
      this.isDrawer = true})
      : super(key: key);

  @override
  _ContentMainDrawerPageState createState() => _ContentMainDrawerPageState();
}

class _ContentMainDrawerPageState extends State<ContentMainDrawerPage> {
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
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_home, text: R.string.home.tr(), index: 0),
            _spaceWidget(
              context,
            ),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_tx_history,
                text: R.string.label_transaction_history.tr(),
                index: 1),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_notification,
                text: R.string.notification.tr(),
                index: 2),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_message,
                text: R.string.faqtitle.tr(),
                index: 3),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_personal,
                text: R.string.aboutus.tr(),
                index: 4),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                icon: R.drawable.ic_setting,
                text: R.string.label_user_setting.tr(),
                index: 5),
            _spaceWidget(context),
            _buildMenuItemWidget(context,
                // icon: R.drawable.ic_dragon_rewards, text: R.string.label_referrals.tr(), index: 5),
                icon: R.drawable.ic_refer_friend,
                text: "Referrals",
                index: 6),
          ],
        ));
  }

  Widget _spaceWidget(BuildContext context) {
    return 4.verticalSpace;
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
          height: 44.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
              color: _drawerCubit.selectedDrawerIndex == index
                  ? R.color.primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 24.w,
                color: R.color.white,
              ),
              8.horizontalSpace,
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
