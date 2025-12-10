import 'package:flutter/material.dart';

class PresenceListPage extends StatelessWidget {
  final String role; // "admin" ou "user"
  // Simulé pour l'instant
  final String userName;

  const PresenceListPage({super.key, required this.role, this.userName = "John Doe"});

  @override
  Widget build(BuildContext context) {
    // Données simulées
    final List<Map<String, String>> presences = role == "admin"
        ? [
      {"user": "Alice", "date": "2025-12-09", "checkin": "08:05", "checkout": "17:00"},
      {"user": "Bob", "date": "2025-12-09", "checkin": "08:15", "checkout": "17:05"},
    ]
        : [
      {"user": userName, "date": "2025-12-09", "checkin": "08:10", "checkout": "17:02"},
      {"user": userName, "date": "2025-12-08", "checkin": "08:12", "checkout": "17:01"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Historique des présences")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: presences.length,
          itemBuilder: (context, index) {
            final presence = presences[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(presence["user"]![0]), // initiale
                ),
                title: Text(role == "admin" ? presence["user"]! : "Présence du jour"),
                subtitle: Text("Date: ${presence["date"]}\n"
                    "Check-in: ${presence["checkin"]}  |  Check-out: ${presence["checkout"]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
