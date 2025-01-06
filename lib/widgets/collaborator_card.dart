import 'package:flutter/material.dart';

class CollaboratorCard extends StatelessWidget {
  final String nome;
  final int numero;

  const CollaboratorCard({
    super.key,
    required this.nome,
    required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 80,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vendor: $nome',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Telefone: $numero',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
