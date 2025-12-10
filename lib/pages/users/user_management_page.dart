import 'package:flutter/material.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données simulées
    final List<Map<String, String>> users = [
      {"name": "Alice", "email": "alice@example.com", "status": "Actif"},
      {"name": "Bob", "email": "bob@example.com", "status": "Inactif"},
      {"name": "Charlie", "email": "charlie@example.com", "status": "Actif"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des utilisateurs"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Ajouter utilisateur (plus tard)
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Ajouter utilisateur (simulation)")));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(user["name"]![0]),
                ),
                title: Text(user["name"]!),
                subtitle: Text(user["email"]!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Voir visage
                    IconButton(
                      icon: const Icon(Icons.face),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Voir visage de ${user["name"]} (simulé)")));
                      },
                    ),
                    // Activer/Désactiver
                    IconButton(
                      icon: Icon(
                        user["status"] == "Actif" ? Icons.toggle_on : Icons.toggle_off,
                        color: user["status"] == "Actif" ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Changer statut de ${user["name"]} (simulé)")));
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
