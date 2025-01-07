import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:neo_ice/database/app_database.dart';

class MonitoringPage extends StatefulWidget {
  final List<Produto> produtos;
  final List<Venda> vendas;

  const MonitoringPage({
    super.key,
    required this.produtos,
    required this.vendas,
  });

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  late Map<int, double> quantidadeVendidaPorProduto;
  late Map<int, double> faturamentoPorProduto;

  @override
  void initState() {
    super.initState();
    _calcularVendas();
  }

  void _calcularVendas() {
    quantidadeVendidaPorProduto = {};
    faturamentoPorProduto = {};

    for (var venda in widget.vendas) {
      final produtoId = venda.produtoId;
      final quantidadeVendida = venda.valor / widget.produtos.firstWhere((produto) => produto.id == produtoId).valor;

      // Atualizando a quantidade vendida
      if (quantidadeVendidaPorProduto.containsKey(produtoId)) {
        quantidadeVendidaPorProduto[produtoId] = quantidadeVendidaPorProduto[produtoId]! + quantidadeVendida;
      } else {
        quantidadeVendidaPorProduto[produtoId] = quantidadeVendida;
      }

      // Atualizando o faturamento
      if (faturamentoPorProduto.containsKey(produtoId)) {
        faturamentoPorProduto[produtoId] = faturamentoPorProduto[produtoId]! + venda.valor;
      } else {
        faturamentoPorProduto[produtoId] = venda.valor;
      }
    }
  }

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
                  barGroups: _getBarGroups(isQuantidade: true),
                  titlesData: _getTitlesData(),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${widget.produtos[group.x.toInt()].nome}\nQuantidade: ${rod.y}',
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
                  barGroups: _getBarGroups(isQuantidade: false),
                  titlesData: _getTitlesData(),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.greenAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${widget.produtos[group.x.toInt()].nome}\nFaturamento: R\$ ${rod.y.toStringAsFixed(2)}',
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

  List<BarChartGroupData> _getBarGroups({required bool isQuantidade}) {
    return widget.produtos.asMap().entries.map((entry) {
      final index = entry.key;
      final produto = entry.value;

      final yValue = isQuantidade
          ? quantidadeVendidaPorProduto[produto.id] ?? 0.0
          : faturamentoPorProduto[produto.id] ?? 0.0;

      final color = isQuantidade ? Colors.blue : Colors.green;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: yValue,
            width: 16,
            borderRadius: BorderRadius.circular(4),
            colors: [color], // Aqui, usamos a propriedade colors para definir a cor
          ),
        ],
      );
    }).toList();
  }

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
          if (value.toInt() >= 0 && value.toInt() < widget.produtos.length) {
            return widget.produtos[value.toInt()].nome;
          }
          return '';
        },
      ),
    );
  }
}
