import 'package:go_router/go_router.dart';
import 'package:soundboard_web/features/mood/mood.dart';
import 'package:soundboard_web/app/router/route.dart';
import 'package:soundboard_web/app/app.dart';
import 'package:soundboard_web/main.dart';

GoRouter routes() => GoRouter(
      initialLocation: AppRoute.moodPageRoute,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              SoundboardBottomNavBar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoute.moodPage,
                  path: AppRoute.moodPageRoute,
                  builder: (context, state) => const MoodPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoute.adminPage,
                  path: AppRoute.adminPageRoute,
                  builder: (context, state) =>
                      const MyHomePage(title: 'Flutter Demo Home Page'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
