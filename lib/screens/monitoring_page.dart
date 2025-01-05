import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:neo_ice/database/app_database.dart';

class MonitoringPage extends StatelessWidget {
  final List<Produto> produtos;

  const MonitoringPage({super.key, required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Quantidade Vendida por Produto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _getBarGroupsQuantidade(),
                  titlesData: _getTitlesData(),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Faturamento por Produto (R\$)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _getBarGroupsFaturamento(),
                  titlesData: _getTitlesData(),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cria as barras para o gráfico de quantidade
  List<BarChartGroupData> _getBarGroupsQuantidade() {
    return produtos.asMap().entries.map((entry) {
      final index = entry.key;
      final produto = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
              toY: produto.quantidade.toDouble(), color: Colors.blue),
        ],
      );
    }).toList();
  }

  // Cria as barras para o gráfico de faturamento
  List<BarChartGroupData> _getBarGroupsFaturamento() {
    return produtos.asMap().entries.map((entry) {
      final index = entry.key;
      final produto = entry.value;
      final faturamento = produto.quantidade * produto.valor;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: faturamento, color: Colors.green),
        ],
      );
    }).toList();
  }

  // Configura os rótulos do eixo X
  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            if (value.toInt() >= 0 && value.toInt() < produtos.length) {
              return Text(
                produtos[value.toInt()].nome,
                style: const TextStyle(fontSize: 12),
              );
            }
            return const Text('');
          },
        ),
      ),
    );
  }
}
