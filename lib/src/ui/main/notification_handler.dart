import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../logic/services/notification_services.dart';

final notificationHandlerProvider =
    StateNotifierProvider.autoDispose<NotificationHandler, dynamic>(
  (ref) => NotificationHandler(
    notificationService: ref.read(notificationServiceProvider),
    ref: ref,
  ),
);

/// Listens to Firebase Messaging onMessage and onMessageOpenedApp streams
/// - Handles the click events for all notification (via FCM messages and NotificationService both)
/// - Shows FCM notification when app is in foreground and for data messages
class NotificationHandler extends StateNotifier {
  final NotificationService notificationService;
  final AutoDisposeStateNotifierProviderRef ref;
  BuildContext? context;

  late final StreamSubscription _onMessageOpenedAppSubscription;
  late final StreamSubscription _onMessageSubscription;
  late final StreamSubscription _onLocalNotificationClickedSubscription;

  NotificationHandler({
    required this.notificationService,
    required this.ref,
  }) : super(null) {
    () async {
      _onMessageSubscription =
          FirebaseMessaging.onMessage.listen(_handleNewFcmMessage);
      _onMessageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp
          .listen(_handleFcmNotificationClicked);
      _listenLocalNotificationsClickEvents();
      _handleInitialMessage();
    }();
  }

  onUiInit(BuildContext context) => this.context = context;

  onUiDispose() => context = null;

  @override
  void dispose() {
    super.dispose();
    debugPrint('NotificationHandler: dispose()');
    context = null;
    _onMessageOpenedAppSubscription.cancel();
    _onMessageSubscription.cancel();
    _onLocalNotificationClickedSubscription.cancel();
  }

  /// subscribes to local notification click events stream
  _listenLocalNotificationsClickEvents() async {
    _onLocalNotificationClickedSubscription = notificationService
        .onNotificationClicked
        .listen(_handleLocalNotificationClicked);
  }

  /// handles new FCM message
  /// uses NotificationService to show the notification, if required
  void _handleNewFcmMessage(RemoteMessage remoteMessage) {
    debugPrint('NotificationHandler: _handleNewMessage');
    // check if it is a notification message
    if (remoteMessage.notification != null) {
      // handle notification message
      // show the notification, if title is not null or empty
      if (remoteMessage.notification!.title?.isNotEmpty == true) {
        notificationService.showNotification(
          title: remoteMessage.notification!.title!,
          message: remoteMessage.notification!.body,
          data: remoteMessage.data,
        );
      }
    } else {
      // handle data message
      // show the notification, if title is not null
      if (remoteMessage.data['title'] != null) {
        notificationService.showNotification(
          title: remoteMessage.data['title'],
          message: remoteMessage.data['message'],
          data: remoteMessage.data,
        );
      }
    }
  }

  /// Handles initial notification, i.e.,
  /// when app is launched by clicking on a notification
  void _handleInitialMessage() async {
    // get initial FCM message
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      // if FCM initial message is not null, handle FCM notification click event
      debugPrint(
          'NotificationHandler: _handleInitialMessage: ${initialMessage.data}');
      _handleFcmNotificationClicked(initialMessage);
    } else {
      // else, fetch initial local notification message and handle its click, if any
      _handleLocalNotificationClicked(
          await notificationService.getAppLaunchNotificationPayload());
    }
  }

  /// Handles FCM click event
  void _handleFcmNotificationClicked(RemoteMessage remoteMessage) {
    debugPrint('NotificationHandler: _handleClickEvent: ${remoteMessage.data}');
    final clickAction = remoteMessage.data['click_action'];
    if (clickAction != null) {
      _handleClickEvent(remoteMessage.data);
    }
  }

  /// Handles local notification click event
  void _handleLocalNotificationClicked(String? payload) {
    debugPrint('_handleLocalNotificationClicked: _handleClickEvent: $payload');
    if (payload != null) {
      _handleClickEvent(jsonDecode(payload));
    }
  }

  /// handles the click event
  void _handleClickEvent(Map<String, dynamic> data) {
    debugPrint('NotificationHandler: _handleClickEvent: $data');
    final safeContext = context;
    if (safeContext == null) {
      debugPrint(
          'NotificationHandler: ignoring click event as context is null');
      return;
    }
  }
}
