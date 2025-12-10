import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String role;
  // "admin" ou "user"
  // On passera la vraie valeur plus tard

  const DashboardPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: role == "admin"
            ? _buildAdminDashboard(context)
            : _buildUserDashboard(context),
      ),
    );
  }

  // -----------------------------------------------------------
  // DASHBOARD ADMIN
  // -----------------------------------------------------------
  Widget _buildAdminDashboard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Statistiques",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        // * Statistiques simples (placeholder)
        Row(
          children: [
            _statCard("Présences aujourd'hui", "25"),
            const SizedBox(width: 15),
            _statCard("Utilisateurs", "12"),
          ],
        ),

        const SizedBox(height: 30),

        const Text(
          "Actions rapides",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        // * Boutons rapides
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/users');
          },
          child: const Text("Gérer les utilisateurs"),
        ),

        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/presence-list');
          },
          child: const Text("Voir toutes les présences"),
        ),
      ],
    );
  }

  // Carte de statistique
  Widget _statCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------------
  // DASHBOARD USER
  // -----------------------------------------------------------
  Widget _buildUserDashboard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bienvenue 👋",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 40),

        // Bouton scanner présence
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/scan-face');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text("Scanner ma présence", style: TextStyle(fontSize: 18)),
          ),
        ),

        const SizedBox(height: 30),

        // Lien vers historique
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/presence-list');
          },
          child: const Text("Voir mon historique de présence"),
        )
      ],
    );
  }
}
