import 'package:flutter/foundation.dart';

class NotificationService extends ChangeNotifier {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final List<String> _notifications = [];

  List<String> get notifications => List.unmodifiable(_notifications);

  int get count => _notifications.length;

  void add(String notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void clear() {
    _notifications.clear();
    notifyListeners();
  }
}