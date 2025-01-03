import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String name;
  final double valor;
  final int qtd;
  final BuildContext context;

  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.valor,
      required this.qtd,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: image,
              onBackgroundImageError: (_, __) => const Icon(Icons.image),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Preço: R\$ ${valor.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
