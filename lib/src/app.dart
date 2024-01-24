import 'dart:io';
import 'package:dtg_web_admin/src/data/preferences/app_preferences.dart';
import 'package:dtg_web_admin/src/data/repository/app_repository.dart';
import 'package:dtg_web_admin/src/page/auth/authentication/authentication_cubit.dart';
import 'package:dtg_web_admin/src/page/auth/authentication/authentication_state.dart';
import 'package:dtg_web_admin/src/page/content_main_drawer/content_main_drawer.dart';
import 'package:dtg_web_admin/src/page/home/home.dart';
import 'package:dtg_web_admin/src/page/home/home_website_page.dart';
import 'package:dtg_web_admin/src/page/main/main.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:dtg_web_admin/src/utils/region_provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../model/navigation/navigation.dart';
import '../res/R.dart';
import 'package:http/http.dart' as http;
import 'utils/custom_navigator_observer.dart';
import 'widgets/custom_refresh_header.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final CustomNavigatorObserver mainNavigatorObserver = CustomNavigatorObserver();

class App extends StatefulWidget {
  /*final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [thunkMiddleware, LoggingMiddleware.printer()]);
      */

  const App({Key? key}) : super(key: key);

  static _AppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  List<Locale>? _systemLocales;
  String? _defaultLocale;
  Locale? _locale;
  final AuthenticationCubit _cubit = GetIt.I<AuthenticationCubit>();
  final ContentMainDrawerCubit _drawerCubit = GetIt.I<ContentMainDrawerCubit>();
  final AppRepository _appRepository = AppRepository();
  final AppPreferences _appPref = GetIt.I<AppPreferences>();
  final MainCubit _mainCubit = GetIt.I<MainCubit>();
  final HomeCubit _homeCubit = GetIt.I<HomeCubit>();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //_user = null;

    _systemLocales = WidgetsBinding.instance?.window
        .locales; // Returns the list of locales that user defined in the system settings.

    if (kIsWeb) {
      _defaultLocale = 'en_US'; // Returns locale string in the form 'en_US'
    } else {
      _defaultLocale = Platform.localeName;
    }
    //_locale = Locale(_defaultLocale!);

    getCountry();
    if (!kIsWeb) {
      _cubit.openApp();
    }
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  void getCountry() async {
    _appRepository.getIp().then((value) {
      if (value != null && value.status == "success") {
        Globals.REGION = value.countryCode ?? "HK";
        Globals.REGION = (Globals.REGION != "HK" &&
                Globals.REGION != "SG" &&
                Globals.REGION != "TH")
            ? "HK"
            : Globals.REGION;
      } else {
        Globals.REGION = "HK"; // Default
      }
      _appPref.saveRegion(Globals.REGION);
      if (kIsWeb) {
        _cubit.openApp();
      }
      logger.d('REGION: ${Globals.REGION}');
      // Globals.REGION = "HK"; // Default
    }).catchError((e) {
      Globals.REGION = "HK";
      if (kIsWeb) {
        _cubit.openApp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: R.color.backgroundColor));
    return OverlaySupport.global(
      child: ScreenUtilInit(
        // designSize: kIsWeb ? const Size(1440, 1024) : const Size(360, 640),
        designSize: kIsWeb ? const Size(1440, 1024) : const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        // Design size
        builder: (context, child) => RefreshConfiguration(
          headerTriggerDistance: 113.h,
          headerBuilder: () => CustomHeader(
            height: 113.h,
            refreshStyle: RefreshStyle.Behind,
            builder: (context, status) => CustomRefreshHeader(
              refreshStatus: status,
            ),
          ),
          // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
          footerBuilder: () => const ClassicFooter(
            loadStyle: LoadStyle.HideAlways,
          ),
          child:
              /*
          StoreProvider(
            store: widget.store,
            child:*/
              MaterialApp(
            title: kIsWeb ? "Coin Dragon" : "Dragon Rewards",
            theme: _buildTheme(),
            navigatorKey: Keys.navKey,
            localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            navigatorObservers: [routeObserver, mainNavigatorObserver],
            builder: (context, widget) {
              if (kIsWeb) {
                return ResponsiveBreakpoints.builder(
                  child: widget!,
                  //defaultScale: true,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(
                        start: 1921, end: double.infinity, name: '4K'),
                  ],
                  //width: null,
                );
              } else {
                return widget ?? Container();
              }
            },
            home: child,
          ),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ContentMainDrawerCubit>(
              create: (BuildContext context) => _drawerCubit,
            ),
            BlocProvider<AuthenticationCubit>(
              create: (BuildContext context) => _cubit,
            ),
            BlocProvider<MainCubit>(
              create: (BuildContext context) => _mainCubit,
            ),
            if (!kIsWeb)
              BlocProvider<HomeCubit>(
                create: (BuildContext context) => _homeCubit,
              ),
          ],
          child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (kIsWeb && state is AuthenticationAuthenticated) {
                Provider.of<AppLocale>(context, listen: false).locale =
                    Locale(Globals.DEFLANG, Globals.REGION);
                _mainCubit.switchLanguage(context,
                    languageCode: Globals.DEFLANG, setDefault: true);
              }
            },
            builder: (context, state) {
              return _pageWidget(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _pageWidget(AuthenticationState state) {
    // TODO: Fake english default
    // Localization.changeLanguage(context, LanguageTypeExt.getLanguageTypeFromCode(LanguageType.ENGLISH.languageCode).locale);
    if (kIsWeb) {
      return const HomeWebsitePage();
    } else {
      return const SizedBox(child: Text("Ooops!"));
    }
    /*else {

      if (state is AuthenticationUninitialized) {
        return const SplashPage();
      } else if (state is AuthenticationOnBoarding) {
        return const IntroPage();
      } else if (state is AuthenticationUnauthenticated) {
        return const LoginPage();
      } else {
        return const MainPage();
      }*/
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData(
      primaryColor: R.color.primaryColor,
      hintColor: R.color.accentColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: R.color.black,
      dialogBackgroundColor: R.color.black,
      fontFamily: "inter",
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: R.color.black)
          .copyWith(background: R.color.black),
    );
    // return baseTheme;
    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
    super.didChangeAppLifecycleState(state);
  }
}
