import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    String dataFormatada = DateFormat('dd/MM/yyyy').format(data);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Venda #$venda: ',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
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
                    Text('Data:  $dataFormatada',
                        style: TextStyle(fontSize: 16))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
