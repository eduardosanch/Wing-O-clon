import 'package:flutter/material.dart';

import '../../../../core/services/notification_service.dart';
import '../../../../core/models/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() =>
      _NotificationsPageState();
}

class _NotificationsPageState
    extends State<NotificationsPage> {

  final NotificationService
      _notificationService =
      NotificationService();

  List<NotificationModel>
      notifications = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  Future<void> loadNotifications() async {

    try {

      final data =
          await _notificationService
              .getNotifications();

      if (!mounted) return;

      setState(() {
        notifications = data;
        loading = false;
      });

    } catch (e) {

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {
      return const Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("Notificaciones"),
      ),

      body: ListView.builder(

        padding:
            const EdgeInsets.all(20),

        itemCount: notifications.length,

        itemBuilder: (_, index) {

          final notification =
              notifications[index];

          return Container(

            margin:
                const EdgeInsets.only(
              bottom: 20,
            ),

            padding:
                const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color:
                  const Color(0xFF0D3B4C),
              borderRadius:
                  BorderRadius.circular(
                20,
              ),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  notification.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  notification.message,
                  style: const TextStyle(
                    color:
                        Colors.white70,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}