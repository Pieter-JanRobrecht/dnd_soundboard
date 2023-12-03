import 'package:go_router/go_router.dart';
import 'package:soundboard_app/app/app.dart';
import 'package:soundboard_app/app/router/route.dart';
import 'package:soundboard_app/features/select-image/select_image.dart';
import 'package:soundboard_app/features/select-video/select_video.dart';

GoRouter routes() => GoRouter(
      initialLocation: AppRoute.selectImagePageRoute,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              SoundboardBottomNavBar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoute.selectImagePage,
                  path: AppRoute.selectImagePageRoute,
                  builder: (context, state) => const SelectImagePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoute.selectVideoPage,
                  path: AppRoute.selectVideoPageRoute,
                  builder: (context, state) => const SelectVideoPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
