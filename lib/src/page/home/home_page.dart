import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/page/auth/authentication/authentication_cubit.dart';
import 'package:dtg_web_admin/src/page/content_main_drawer/content_main_drawer.dart';
import 'package:dtg_web_admin/src/page/main/bloc/main_cubit.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/widgets/dynamic_height_grid_view.dart';
import 'package:dtg_web_admin/src/widgets/service_item_widget.dart';
import 'package:dtg_web_admin/src/widgets/show_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:dtg_web_admin/src/utils/const.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final AuthenticationCubit _authCubit = GetIt.I<AuthenticationCubit>();
  final HomeCubit _cubit = GetIt.I<HomeCubit>();
  final MainCubit _mainCubit = GetIt.I<MainCubit>();
  final ContentMainDrawerCubit _drawerCubit = GetIt.I<ContentMainDrawerCubit>();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cubit.getData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.backgroundColor,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is! HomeStartRefresh) {
            _refreshController.refreshCompleted();
          }
          /*if (state is HomeGetVoucherDetailSuccess) {
            showVoucherDetailDialog(context, state.voucher, state.optionsData);
          }*/
          if (state is HomeGetDataSuccess) {
            _mainCubit.refreshMain();
          }
          if (state is HomeForceLogOut) {
            _authCubit.logout();
          }
        },
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, HomeState state) {
    return ShowLoadingWidget(
        isLoading: state is HomeLoading,
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: () {
            _cubit.onRefresh();
          },
          child: _mainHomePage(state),
        ));
  }

  Widget _mainHomePage(HomeState state) {
    return ListView(
      padding: kIsWeb ? EdgeInsets.zero : EdgeInsets.only(bottom: 20.h),
      shrinkWrap: true,
      children: [
        //kIsWeb ? const MainCarouselWebsitePage() : const MainCarouselPage(),
        const SizedBox(child: Text("MAIN PAGE")),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Container(
                height: 2.h,
                color: R.color.primaryColor,
                margin: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SingleTapDetector(
                      onTap: () {
                        //_mainCubit.switchBottomNavigationBar(
                        //    BottomNavigationType.FIND_KIOSK);
                      },
                      child: containerWidget(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              R.string.label_find_kiosk.tr(),
                              style:
                                  Theme.of(context).textTheme.semiBold18Style,
                            )),
                            Image.asset(
                              R.drawable.ic_arrow_right_circle,
                              height: 16.h,
                            )
                          ],
                        ),
                        height: 67.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: SingleTapDetector(
                      onTap: () {
                        /*
                        _mainCubit.switchBottomNavigationBar(
                            BottomNavigationType.TOP_UP);
                            */
                      },
                      child: containerWidget(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    R.string.topup.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .semiBold18Style,
                                  ),
                                  4.verticalSpace,
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        R.drawable.img_dragon_points_logo,
                                        height: 17.w,
                                      ),
                                      4.horizontalSpace,
                                      Text(
                                        R.string.pts_to_dollar.tr(args: [
                                          Const.TOP_UP_RATE.toString()
                                        ]),
                                        style: Theme.of(context)
                                            .textTheme
                                            .regular14Style,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                              Image.asset(
                                R.drawable.ic_arrow_right_circle,
                                height: 16.h,
                              )
                            ],
                          ),
                          height: 67.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w)),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              containerWidget(
                // height: 114.h,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        2.horizontalSpace,
                        Expanded(
                            child: Text(
                          R.string.label_browse_e_voucher.tr(),
                          style: Theme.of(context).textTheme.semiBold18Style,
                        )),
                        SingleTapDetector(
                            onTap: () {
                              /*_mainCubit.switchBottomNavigationBar(
                                  BottomNavigationType.BROWSE);
                                  */
                              // _mainCubit.onChooseBottomNavigationBar(BottomNavigationType.BROWSE);
                              // NavigationUtils.navigatePage(context, const BrowseVoucherPage()).then((value) {
                              //   _mainCubit.onChooseBottomNavigationBar(null);
                              // });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 4.w),
                              child: Text(
                                R.string.view_all.tr(),
                                style:
                                    Theme.of(context).textTheme.normal14Style,
                              ),
                            )),
                      ],
                    ),
                    16.verticalSpace,
                    DynamicHeightGridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _cubit.maxLengthOptionVoucher,
                      mainAxisSpacing: 11.w,
                      crossAxisSpacing: 11.w,
                      crossAxisCount: 5,
                      builder: (context, index) {
                        return ServiceItemWidget(
                            imageUrl: _cubit.listOptionVoucher[index].getLogo(),
                            onTapService: () {
                              /*
                              NavigationUtils.rootNavigatePage(
                                  context,
                                  VoucherPaymentPage(
                                      optionsData:
                                          _cubit.listOptionVoucher[index],
                                      optionsType: OptionsType.E_VOUCHER));
                                      */
                            });
                      },
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              containerWidget(
                // height: 114.h,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        2.horizontalSpace,
                        Expanded(
                            child: Text(
                          R.string.myvouchers.tr(),
                          style: Theme.of(context).textTheme.semiBold18Style,
                        )),
                        SingleTapDetector(
                            onTap: () {
                              /*
                              _mainCubit.switchBottomNavigationBar(
                                  BottomNavigationType.MY_VOUCHERS);
                              // _mainCubit.onChooseBottomNavigationBar(BottomNavigationType.MY_VOUCHERS);
                              // NavigationUtils.navigatePage(context, const MyVouchersPage()).then((value) {
                              //   _mainCubit.onChooseBottomNavigationBar(null);
                              // });
                              */
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 4.w),
                              child: Text(
                                R.string.view_all.tr(),
                                style:
                                    Theme.of(context).textTheme.normal14Style,
                              ),
                            )),
                      ],
                    ),
                    16.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget containerWidget(
      {required Widget child, double? height, EdgeInsets? padding}) {
    return Container(
        height: height,
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
            color: R.color.colorVoucherBackground,
            border: Border.all(color: R.color.primaryColor, width: 2.h),
            borderRadius: BorderRadius.circular(8.r)),
        child: child);
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
