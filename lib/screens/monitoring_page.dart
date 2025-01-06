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
                  gridData: FlGridData(show: true),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          produtos[group.x.toInt()].nome +
                              '\nQuantidade: ${rod.y}',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
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
                  gridData: FlGridData(show: true),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.greenAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          produtos[group.x.toInt()].nome +
                              '\nFaturamento: R\$ ${rod.y.toStringAsFixed(2)}',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
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
            y: produto.quantidade.toDouble(),
            colors: [Colors.blue],
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
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
          BarChartRodData(
            y: faturamento,
            colors: [Colors.green],
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }

  // Configura os rótulos do eixo X
  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitles: (value) {
          return value.toInt().toString();
        },
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        getTitles: (value) {
          if (value.toInt() >= 0 && value.toInt() < produtos.length) {
            return produtos[value.toInt()].nome;
          }
          return '';
        },
      ),
    );
  }
}
