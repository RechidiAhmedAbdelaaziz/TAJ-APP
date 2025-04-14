import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/responsive_extension.dart';
import 'package:taj_elsafa/core/localization/localization_cubit.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/gen/fonts.gen.dart';

import 'core/di/locator.dart';
import 'core/localization/app_localization.dart';
import 'core/router/router.dart';

class TajApp extends StatelessWidget {
  const TajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize:
              constraints.isMobile
                  ? Size(430, 932)
                  : constraints.isTablet
                  ? constraints.isLandscape
                      ? Size(1024, 768)
                      : Size(600, 1024)
                  : Size(1440, 1024),

          builder: (_, __) {
            return BlocProvider(
              create: (context) => LocalizationCubit(),
              child: _MaterialApp(),
            );
          },
        );
      },
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();

    final local = context.watch<LocalizationCubit>().state;

    return MaterialApp.router(
      routerConfig: router.routerConfig,
      theme: ThemeData(
        fontFamily: FontFamily.centuryGothic,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          // backgroundColor: AppColors.grey,
          centerTitle: true,
          scrolledUnderElevation: 0,
          color: AppColors.grey,
          elevation: 0,
        ),
      ),
      supportedLocales: [
        Locale('fr'), // French
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: local,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null &&
            supportedLocales.any(
              (element) =>
                  element.languageCode == locale.languageCode,
            )) {
          return locale;
        }
        // If the current device locale is not supported, use the first one
        return supportedLocales.first;
      },
    );
  }
}
