import 'package:go_router/go_router.dart';
import 'package:devto_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

final appRouter = GoRouter(
  initialLocation: '/main/0',
  routes: [
    GoRoute(
      path: '/main/:page',
      name: MainScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return MainScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'home',
          name: HomeScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'search/:tab',
          name: SearchScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            final tabIndex = int.parse(state.pathParameters['tab'] ?? '0');
            return SearchScreen(tabIndex: tabIndex);
          },
        ),
        GoRoute(
          path: 'config',
          name: ConfigsScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            return const ConfigsScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/main/0',
    ),
  ],
);
