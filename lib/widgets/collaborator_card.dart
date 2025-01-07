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
          child: Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person_2,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    nome,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
