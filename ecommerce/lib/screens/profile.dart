import 'package:ecommerce/models/event_provider.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/widget/bottom_navigation_bar.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User loggedInUser = Provider.of<UserProvider>(context).loggedInUser!;
    final eventProvider = Provider.of<EventProvider>(context);
    final dateFormatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.mainScreen),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              "PERSONAL INFORMATION",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFF98CA0)),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(loggedInUser.name),
              subtitle: Text(loggedInUser.phoneNumber),
              tileColor: const Color(0x3ACFCCCC),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(loggedInUser.province),
              subtitle: Text(loggedInUser.commune),
              tileColor: const Color(0x3ACFCCCC),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Text(
                  "EVENT REMINDER",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFF98CA0)),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => showReminderDialog(context, (title, date) {
                    eventProvider.addEvent(title, date);
                  }),
                ),
              ],
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: eventProvider.events.length,
              itemBuilder: (context, index) {
                Event event = eventProvider.events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text("${dateFormatter.format(DateTime.parse(event.date))} - ${getDaysRemaining(event.date)} days remaining"),
                  leading: const Icon(Icons.access_alarm),
                  tileColor: const Color(0x3ACFCCCC),
                  onTap: () {
                    showReminderDialog(context, (newTitle, newDate) {
                      eventProvider.editEvent(index, newTitle, newDate);
                    }, title: event.title, date: event.date);
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => eventProvider.deleteEvent(index),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onItemTapped: (index) {
          if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  int getDaysRemaining(String eventDate) {
    DateTime currentDate = DateTime.now();
    DateTime eventDateTime = DateTime.parse(eventDate);
    return eventDateTime.difference(currentDate).inDays;
  }

  void showReminderDialog(BuildContext context, Function(String, String) handleReminder,
      {String? title, String? date}) {
    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController dateController = TextEditingController(text: date);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title == null ? 'Add New Event' : 'Edit Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Event Reminder Title',
                ),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Select Date',
                  hintText: 'Tap to select date',
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    dateController.text = formattedDate;
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String newTitle = titleController.text;
                String newDate = dateController.text;

                if (newTitle.isNotEmpty && newDate.isNotEmpty) {
                  handleReminder(newTitle, newDate);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in both fields')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}


