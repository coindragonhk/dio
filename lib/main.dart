// ignore: depend_on_referenced_packages
import 'dart:io';
import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/src/app.dart';
import 'package:dtg_web_admin/src/utils/const.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:dtg_web_admin/src/utils/region_provider.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'main.config.dart';
import 'src/localization/localization.dart';

final getIt = GetIt.instance;

// Choose between log console or file
bool isLogConsole = true;

@InjectableInit()
Future _configureDependencies() async {
  getIt.init();
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.d('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    logger.d('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.d('$transition');
    super.onTransition(bloc, transition);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (!kIsWeb) {
    await Utils.deleteFile(File(Const.LOG_FILE_NAME));
  }
  await _configureDependencies();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();

  /*
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // options: DefaultFirebaseConfig.platformOptions,
  );
  // enablePersistence if not running web.
  if (kIsWeb) {
    //await FirebaseFirestore.instance.enablePersistence();
  } else {
    //All other platforms.
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
  }*/

/*
  // Get any initial links
  PendingDynamicLinkData? initialLink;
  if (!kIsWeb) {
    initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  }

  const GOOGLE_CLIENT_ID =
      '448618578101-sg12d2qin42cpr00f8b0gehs5s7inm0v.apps.googleusercontent.com';
  const FACEBOOK_CLIENT_ID = '128693022464535';

  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const PhoneProviderConfiguration(),
    const GoogleProviderConfiguration(clientId: GOOGLE_CLIENT_ID),
    const AppleProviderConfiguration(),
    const FacebookProviderConfiguration(clientId: FACEBOOK_CLIENT_ID),
    /*const TwitterProviderConfiguration(
      apiKey: TWITTER_API_KEY,
      apiSecretKey: TWITTER_API_SECRET_KEY,
      redirectUri: TWITTER_REDIRECT_URI,
    ),*/
  ]);*/
  Bloc.observer = SimpleBlocObserver();
  if (!kDebugMode) {
    debugPrint = (message, {wrapWidth}) {};
  }
  //usePathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              AppLocale(Locale(Globals.DEFLANG, Globals.REGION)),
        ),
      ],
      child: Localization.getLocalizationWidget(
        app: const App(),
      ),
    ),
  );
}
