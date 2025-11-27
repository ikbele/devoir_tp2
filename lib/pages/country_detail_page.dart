import 'package:flutter/material.dart';
import '../models/pays.dart';

class CountryDetailPage extends StatelessWidget {
  final Pays pays;

  const CountryDetailPage({super.key, required this.pays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pays.nom),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              pays.image,
              width: 260,
              height: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              pays.nom,
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Exemple : rendre la capitale en vert
            InfoRow(
              label: 'Capitale',
              value: pays.capitale,
              valueColor: Colors.green,
            ),
            InfoRow(label: 'Population', value: pays.population),
            InfoRow(label: 'Superficie', value: pays.superficie),
            InfoRow(label: 'Langues', value: pays.langues),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor; // couleur personnalisable

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: valueColor ?? Colors.black, // noir par défaut
              ),
            ),
          ),
        ],
      ),
    );
  }
}
