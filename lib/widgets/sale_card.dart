import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  final int venda;
  final double valor;
  final DateTime data;

  const SaleCard({
    super.key,
    required this.venda,
    required this.valor,
    required this.data,
  });

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
              child: Icon(
                Icons.shopping_bag,
                size: 40,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Expanded(
                  flex: 1,
                  child: Text(
                    'Venda: $venda',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Valor:  R\$${valor.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 26),
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
