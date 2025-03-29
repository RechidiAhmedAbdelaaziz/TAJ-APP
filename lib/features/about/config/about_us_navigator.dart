import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/core/router/router.dart';
import 'package:taj_elsafa/features/about/ui/about_us_screen.dart';
import 'package:taj_elsafa/features/about/ui/contact_us.dart';
import 'package:taj_elsafa/features/about/ui/terms_condition.dart';

class AboutNavigator extends AppNavigatorBase {
  AboutNavigator.aboutUs() : super(path: AppRoutes.aboutUs);

  AboutNavigator.termsAndConditions()
    : super(path: AppRoutes.termsAndConditions);

  AboutNavigator.contactUs() : super(path: AppRoutes.contactUs);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.aboutUs,
      builder: (context, state) => const AboutUsScreen(),
    ),

    GoRoute(
      path: AppRoutes.termsAndConditions,
      builder: (context, state) {
        return const TermsCondition();
      },
    ),

    GoRoute(
      path: AppRoutes.contactUs,
      builder: (context, state) {
        return const ContactUs();
      },
    ),
  ];
}
