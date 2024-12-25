import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(String title, String date) {
    _events.add(Event(title: title, date: date));
    _sortEvents();
    notifyListeners();
  }

  void editEvent(int index, String title, String date) {
    _events[index] = Event(title: title, date: date);
    _sortEvents();
    notifyListeners();
  }

  void deleteEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }

  void _sortEvents() {
    _events.sort((a, b) {
      DateTime dateA = DateTime.parse(a.date);
      DateTime dateB = DateTime.parse(b.date);
      return dateA.compareTo(dateB);
    });
  }
}

class Event {
  final String title;
  final String date;

  Event({required this.title, required this.date});
}
