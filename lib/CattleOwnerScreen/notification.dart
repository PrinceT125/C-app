import 'package:flutter/material.dart';



class notification extends StatefulWidget {
  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cattle Telemedicine Notifications',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: NotificationScreen(),
//     );
//   }
// }
//
// class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Vaccination Reminder',
      body: 'It\'s time to vaccinate the cattle for Bovine Tuberculosis.',
      time: '1 hour ago',
    ),
    NotificationItem(
      title: 'Emergency Alert: Bovine Mastitis',
      body: 'Cow #23 shows signs of mastitis. Immediate attention required!',
      time: '2 hours ago',
    ),
    NotificationItem(
      title: 'Cattle Checkup Due',
      body: 'The scheduled health checkup for cattle herd #A123 is coming up in 3 days.',
      time: '6 hours ago',
    ),
    NotificationItem(
      title: 'Veterinary Consultation Scheduled',
      body: 'Your virtual consultation with Dr. Smith is confirmed for tomorrow at 10:00 AM.',
      time: '12 hours ago',
    ),
    NotificationItem(
      title: 'Cattle Health Monitoring Update',
      body: 'Cow #45 has had a temperature spike. Check for any signs of illness.',
      time: '1 day ago',
    ),
    // Add more notifications as required
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Cattle Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(notification: notification);
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          notification.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(notification.body),
        trailing: Text(notification.time, style: TextStyle(color: Colors.grey)),
        onTap: () {
          // Handle tap event to navigate to more details about the notification
          // For example, navigate to the cow health details screen or consultation history.
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String body;
  final String time;

  NotificationItem({required this.title, required this.body, required this.time});
}
