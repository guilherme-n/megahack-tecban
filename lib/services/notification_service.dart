import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:megahacktecban/components/alert_dialog.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static final CollectionReference _usuariosRef =
      Firestore.instance.collection('usuarios');

  static Future<void> showNotification(
      String title, String body, String payload) async {
    final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '0', 'Pre cadastro cartorio', 'Geral',
        importance: Importance.Max,
        priority: Priority.High,
        color: Colors.blue);

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: payload)
        .then((value) {
      print(payload);
    });
  }

  static Future<void> configureNotification(BuildContext parentContext) async {
    var usuarioAtual = await FirebaseAuth.instance.currentUser();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        if (Platform.isIOS) {
//          var pedidoId = message['pedidoId'];

          String titulo = message['aps']['alert']['title'];
          String corpo = message['aps']['alert']['body'];
          await alertDialog(
            context: parentContext,
            titulo: titulo,
            conteudo: corpo,
            primeiroTexto: 'ok',
            primeiroTextoCallback: () => Navigator.of(parentContext).pop(),
          );
        } else {
          await NotificationService.showNotification(
              message['notification']['title'],
              message['notification']['body'],
              '');
        }
      },
      onResume: (Map<String, dynamic> message) async {
        if (!Platform.isIOS) {
          await NotificationService.showNotification(
              message['notification']['title'],
              message['notification']['body'],
              '');
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        if (!Platform.isIOS) {
          await NotificationService.showNotification(
              message['notification']['title'],
              message['notification']['body'],
              '');
        }
      },
    );
    await _firebaseMessaging.getToken().then((token) {
      if (usuarioAtual != null) {
        _usuariosRef
            .document(usuarioAtual.uid)
            .updateData({'notificationToken': token});
      }
    });
  }

  static Future<void> reenviarSolicitacaoNotificacao(
      BuildContext context) async {
    if (Platform.isIOS) {
      await Future.delayed(Duration(milliseconds: 500));
      var permissaoConcedida =
          await _firebaseMessaging.requestNotificationPermissions();
      if (!permissaoConcedida) {
        await alertDialog(
          context: context,
          titulo: 'As notificações estão desativadas',
          conteudo:
              'Sem elas, você não será avisado sobre o andamento do seu pedido em tempo real',
          primeiroTexto: 'OK',
          primeiroTextoCallback: () => Navigator.of(context).pop(),
        );
      }
    }
  }
}
