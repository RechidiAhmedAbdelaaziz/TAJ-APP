part of 'router.dart';

class ClientRouter extends AppRouter {
  ClientRouter()
    : super(
        routes: [
          ...HandingOverNavigator.routes,
          ...RatingNavigator.routes,
          ...NotesNavigator.routes,
          ...RequestNavigator.routes,
          ...RealStatesNavigator.routes,
          ...AboutNavigator.routes,
          ...DocumentsNavigator.routes,
          ...NotificationNavigator.routes,
          ...ProfileNavigator.routes,
          ...HomeNavigator.routes,
          ...AuthNavigator.routes,
          ...TicketNavigator.routes,
        ],
      );
}
