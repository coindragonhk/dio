import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/src/localization/localization.dart';
import 'package:dtg_web_admin/src/page/home/home.dart';
import 'package:dtg_web_admin/src/utils/const.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/button_widget.dart';
import 'package:dtg_web_admin/src/widgets/loading_container.dart';
import 'package:dtg_web_admin/src/widgets/localization_widget.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:dtg_web_admin/src/page/main/bloc/main_cubit.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import '../../../../res/R.dart';
import 'main_drawer.dart';

class MainDrawerPage extends StatefulWidget {
  final DrawerStep initialStep;
  final ValueChanged<int>? onSelectIndex;
  final VoidCallback? onLoggedIn;

  const MainDrawerPage(
      {Key? key,
      this.initialStep = DrawerStep.MAIN,
      this.onSelectIndex,
      this.onLoggedIn})
      : super(key: key);

  @override
  _MainDrawerPageState createState() => _MainDrawerPageState();
}

class _MainDrawerPageState extends State<MainDrawerPage> {
  late MainDrawerCubit _cubit;
  final MainCubit _mainCubit = GetIt.I<MainCubit>();
  final HomeCubit _homeCubit = GetIt.I<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _cubit = MainDrawerCubit();
    _cubit.selectDrawerStep(step: widget.initialStep);
  }

  void selectDrawerStep({DrawerStep? step}) {
    _cubit.selectDrawerStep(step: step);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: BlocConsumer<MainDrawerCubit, MainDrawerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, MainDrawerState state) {
    return LoadingContainer(
      isLoading: state is MainDrawerLoading,
      child: Container(
        color: R.color.backgroundRed,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        width: Utils.isDesktopWeb(context) ? 454 : double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kIsWeb ? 0 : 20.w,
              vertical:
                  kIsWeb ? (Utils.isDesktopWeb(context) ? 28 : 16) : 20.w),
          // height: double.infinity,
          // color: R.color.backgroundRed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: Utils.isDesktopWeb(context)?MainAxisSize.max : MainAxisSize.min,
            children: [
              kIsWeb
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Utils.isDesktopWeb(context) ? 40 : 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Globals.REGION == "HK"
                                ? R.drawable.img_dragon_logo_hk
                                : R.drawable.img_dragon_logo_sg,
                            width: Utils.isDesktopWeb(context) ? 223 : 154,
                          ),
                          SingleTapDetector(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                            },
                            child: Image.asset(
                              R.drawable.ic_close,
                              width: Utils.isDesktopWeb(context) ? 30 : 22,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            kIsWeb
                                ? (Globals.REGION == "HK"
                                    ? R.drawable.img_dragon_logo_hk
                                    : R.drawable.img_dragon_logo_sg)
                                : R.drawable.ic_dragon_horizontal,
                            width: 200.w,
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: SingleTapDetector(
                                onTap: () {
                                  Scaffold.of(context).closeDrawer();
                                },
                                child: Image.asset(
                                  R.drawable.ic_close,
                                  width: kIsWeb
                                      ? (Utils.isDesktopWeb(context) ? 30 : 22)
                                      : 20.h,
                                  fit: BoxFit.contain,
                                ),
                              ))
                        ],
                      ),
                    ),
              SizedBox(
                height: kIsWeb ? 30 : 32.h,
              ),
              BlocProvider.value(
                value: _cubit,
                child: /* _cubit.currentUserLogged == null
                      ? (_cubit.drawerStep == DrawerStep.LOGIN
                          ? LoginWebsitePage(
                              onLoggedIn: widget.onLoggedIn,
                            )
                          : _buildMainDrawer(context))
                      : */
                    /* ProfilePage(onSelectIndex: (index) {
                    widget.onSelectIndex?.call(index);
                    Scaffold.of(context).closeDrawer();
                    */
                    const SizedBox(
                        child: Center(child: Text('Main Drawer section.'))),
              ),
              if (kIsWeb && !Utils.isDesktopWeb(context))
                const SizedBox(
                  height: 4,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void showLocalizationDialog(BuildContext context) {
    showGeneralDialog(
      //barrierDismissible: true,
      context: context,
      useRootNavigator: true,
      pageBuilder: (context, _, __) => LocalizationDialog(
        onChangeLanguage: ({int index = 0}) {
          switchLanguage(context, index: index);
        },
        onChangeRegion: (RegionOptions region) {
          switch (region) {
            case RegionOptions.HONG_KONG:
              Globals.REGION = 'HK';
              break;
            case RegionOptions.SINGAPORE:
              Globals.REGION = 'SG';
              break;
            case RegionOptions.THAILAND:
              Globals.REGION = 'TH';
              break;
          }
          _homeCubit.updateRegion();
        },
      ),
    );
  }

  // {index} unused for now.
  // Write {index} logic when supporting more than 2 languages
  void switchLanguage(BuildContext context, {int index = 0}) {
    _mainCubit.switchLanguage(context);
  }

  Widget _buildMainDrawer(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        kIsWeb ? (Utils.isDesktopWeb(context) ? 40 : 20) : 0),
                child: Column(
                  children: [
                    Image.asset(
                      R.drawable.img_receipt,
                      width: Utils.isDesktopWeb(context) ? 278 : 198,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      R.string.label_drawer_title.tr(),
                      style: Theme.of(context).textTheme.textNormal2(context),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PointerInterceptor(
                      child: ButtonWidget(
                        title: R.string.sign_in_via_web.tr(),
                        filledBackground: true,
                        textColor: R.color.white,
                        height: 52,
                        textStyle:
                            Theme.of(context).textTheme.textButton2(context),
                        onPressed: () {
                          _cubit.selectDrawerStep();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 3,
                            margin: const EdgeInsets.only(right: 6),
                            color: R.color.primaryColor,
                          ),
                        ),
                        Text(
                          R.string.label_or.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .textDescription2(context),
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            margin: const EdgeInsets.only(left: 6),
                            color: R.color.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      R.string.label_mobile_download_app.tr(),
                      style:
                          Theme.of(context).textTheme.textDescription2(context),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PointerInterceptor(
                          child: SingleTapDetector(
                            onTap: () {
                              Utils.launchURL(Const.APP_STORE_URL);
                            },
                            child: Image.asset(
                              R.drawable.ic_download_on_app_store,
                              height: 48,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        PointerInterceptor(
                          child: SingleTapDetector(
                            onTap: () {
                              Utils.launchURL(Const.PLAY_STORE_URL);
                            },
                            child: Image.asset(
                              R.drawable.ic_get_it_on_play_store,
                              height: 48,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!Utils.isDesktopWeb(context)) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                // child: ButtonWidget(
                //   height: 40,
                //   width: 55,
                //   title: R.string.label_language_selection.tr(),
                //   textStyle: Theme.of(context).textTheme.textSemiBoldButton(context),
                //   onPressed: () {
                //     _mainCubit.switchLanguage(context);
                //   },
                // ),
                child: PointerInterceptor(
                  child: ButtonWidget(
                    height: 52,
                    width: 69,
                    title: Utils.isRegionHK(context)
                        ? (Localization.isLanguageTch ? "EN" : "繁體")
                        : Utils.isRegionSG(context)
                            ? (Localization.isLanguageSch ? "EN" : "简体")
                            : Utils.isRegionTH(context)
                                ? (Localization.isLanguageTh ? "EN" : "ภาษาไทย")
                                : "EN",
                    textStyle: Theme.of(context).textTheme.semiBold18Style,
                    onPressed: () {
                      showLocalizationDialog(context);
                    },
                    child: Center(
                      child: Icon(
                        Icons.language_outlined,
                        size: kIsWeb ? 30 : 30.w,
                        color: Colors.white,
                      ),
                    ),
                    // Image.asset(
                    //         R.drawable.img_you_marker,
                    //         height: 34,
                    //         width: 34,
                    //         color: Colors.white
                    //       ),
                  ),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
