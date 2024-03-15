import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/notification/local_notification.dart';
import 'package:flutter_lms/myAppd.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  await LocalNotificationService.init();
  token = CacheNetwork.getCachedata(key: 'token');
  user = CacheNetwork.getCachedata(key: 'user');
  password = CacheNetwork.getCachedata(key: 'password');

  runApp(
    const MyApp(),
  );
}
