import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sharez/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: SendRoute.page,
          path: 'send',
          initial: true,
          children: [
            RedirectRoute(
              path: '',
              redirectTo: 'selectFiles',
            ),
            AutoRoute(
              page: FileSelectorRoute.page,
              path: 'selectFiles',
            ),
            AutoRoute(
              page: SendStateRoute.page,
              path: 'sendState',
            ),
          ],
        ),
        AutoRoute(
          page: ReceiveRoute.page,
          path: 'receive',
          children: [
            RedirectRoute(
              path: '',
              redirectTo: 'receiveState',
            ),
            AutoRoute(
              page: ReceiveStateRoute.page,
              path: 'receiveState',
            ),
          ],
        )
      ],
    ),
    AutoRoute(
      page: DownloadsRoute.page,
      path: '/download',
    ),
    AutoRoute(
      page: SettingsRoute.page,
      path: '/settings',
    ),
    CustomRoute(
      page: ConfirmConnectionDialogRoute.page,
      path: '/confirmation',
      customRouteBuilder:
          <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return DialogRoute(
          context: context,
          // this is important
          settings: page,
          builder: (_) => child,
        );
      },
    )
  ];
}
