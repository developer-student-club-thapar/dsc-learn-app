import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preference_service.dart';

final notificationServiceProvider = Provider<NotificationService>(
  (ref) => NotificationService(
    preferenceService: ref.read(preferenceServiceProvider),
  ),
);

/// Service class to show notifications using flutter_local_notifications plugin
class NotificationService {
  static const _notificationIdKey = 'notificationId';

  final PreferenceService preferenceService;
  late final Future _doneFuture;

  // ignore: close_sinks, never closed
  final _onNotificationClickedStreamController =
      StreamController<String?>.broadcast();

  /// Returns a [Stream] that is called when a user presses a notification message displayed
  /// via [FlutterLocalNotificationsPlugin].
  Stream<String?> get onNotificationClicked =>
      _onNotificationClickedStreamController.stream;

  /// instance of Flutter local notifications plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService({
    required this.preferenceService,
  }) {
    _doneFuture = _init();
  }

  /// initializes FlutterLocalNotifications plugin
  Future _init() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestSoundPermission: false,
        requestBadgePermission: false,
      ),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onSelectNotification,
    );
    // create notification channels, if platform is android
    if (Platform.isAndroid) {
      final platformImplementation = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      await platformImplementation?.requestPermission();

      await platformImplementation?.createNotificationChannel(
        const AndroidNotificationChannel(
          'DSC Learn App',
          'New Notification',
          importance: Importance.max,
          playSound: true,
          enableVibration: true,
        ),
      );
    } else if (Platform.isIOS) {
      final platformImplementation = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
      // request notification permission
      await platformImplementation?.requestPermissions(
        sound: true,
        alert: true,
        badge: true,
      );
    }
  }

  Future get initializationDone => _doneFuture;

  /// returns the payload of the notification (displayed by this service)
  /// through which the app is launched
  Future<String?> getAppLaunchNotificationPayload() async {
    return (await _flutterLocalNotificationsPlugin
            .getNotificationAppLaunchDetails())
        ?.notificationResponse
        ?.payload;
  }

  /// shows notification using the Flutter local notifications plugin
  showNotification({
    required String title,
    required String? message,
    Map<String, dynamic> data = const {},
  }) {
    debugPrint(
      'NotificationService: showNotification(title: $title, '
      'message: $message, '
      'data: $data)',
    );
    // get notification id from preferences
    final notificationId = preferenceService.getInt(_notificationIdKey) ?? 1;
    final groupIdentifier = _getGroupIdentifier(data);
    debugPrint(
      'showing notification: $notificationId, groupIdentifier: $groupIdentifier',
    );
    // show the notification
    _flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      message,
      NotificationDetails(
        iOS: DarwinNotificationDetails(
          // provided a thread identifier to group notifications together
          threadIdentifier: groupIdentifier,
        ),
        android: AndroidNotificationDetails(
          'new-notification',
          'notification',
          importance: Importance.max,
          playSound: true,
          enableVibration: true,
          enableLights: true,
          // provided a group key to group notifications together (it's not working though)
          groupKey: groupIdentifier,
        ),
      ),
      payload: jsonEncode(data),
    );
    // update notification id (loop it from 1 to 1000)
    preferenceService.setInt(
      _notificationIdKey,
      notificationId < 1000 ? notificationId + 1 : 1,
    );
  }

  /// clears all notifications for the app
  void clearAllNotifications() async =>
      await _flutterLocalNotificationsPlugin.cancelAll();

  /// Callback that is called when a notification is clicked
  void _onSelectNotification(NotificationResponse response) {
    debugPrint(
      'NotificationService: selectNotification: payload: ${response.payload}',
    );
    // put value in onNotificationClicked
    _onNotificationClickedStreamController.sink.add(response.payload);
    // clear all notifications
    clearAllNotifications();
  }

  _getGroupIdentifier(Map<String, dynamic> data) => 'kdfkjsdbkfbjbfadkb';
}
