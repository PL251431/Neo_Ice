import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/widgets/moonitoring_bar_chart.dart';

class MonitoringPage extends StatefulWidget {
  final List<Produto> produtos;
  final List<Venda> vendas;

  const MonitoringPage({
    super.key,
    required this.produtos,
    required this.vendas,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  late Map<int, double> quantidadeVendidaPorProduto;
  late Map<int, double> faturamentoPorProduto;
  late double maxQuantidadeVendida;
  late double maxFaturamento;

  @override
  void initState() {
    super.initState();
    _calcularVendas();
  }

  void _calcularVendas() {
    quantidadeVendidaPorProduto = {};
    faturamentoPorProduto = {};
    maxQuantidadeVendida = 0.0;
    maxFaturamento = 0.0;

    for (var venda in widget.vendas) {
      final produtoId = venda.produtoId;
      final quantidadeVendida = venda.valor /
          widget.produtos
              .firstWhere((produto) => produto.id == produtoId)
              .valor;
      if (quantidadeVendidaPorProduto.containsKey(produtoId)) {
        quantidadeVendidaPorProduto[produtoId] =
            quantidadeVendidaPorProduto[produtoId]! + quantidadeVendida;
      } else {
        quantidadeVendidaPorProduto[produtoId] = quantidadeVendida;
      }
      if (faturamentoPorProduto.containsKey(produtoId)) {
        faturamentoPorProduto[produtoId] =
            faturamentoPorProduto[produtoId]! + venda.valor;
      } else {
        faturamentoPorProduto[produtoId] = venda.valor;
      }
      if (quantidadeVendida > maxQuantidadeVendida) {
        maxQuantidadeVendida = quantidadeVendida;
      }
      if (venda.valor > maxFaturamento) {
        maxFaturamento = venda.valor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'MONITORAMENTO DE VENDAS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Quantidade Vendida por Produto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: MoonitoringBarChart(
              barGroupFunc: () => _getBarGroups(isQuantidade: true),
              titleFunc: () => _getTitlesData(isQuantidade: true),
              medida: 'Quantidade',
            ),
          ),
          const Text(
            'Faturamento por Produto (R\$)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: MoonitoringBarChart(
              barGroupFunc: () => _getBarGroups(isQuantidade: false),
              titleFunc: () => _getTitlesData(isQuantidade: false),
              medida: 'Faturamento',
            ),
          ),
        ],
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
            toY: yValue,
            width: 30,
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
        ],
      );
    }).toList();
  }

  double _calculateInterval(double maxValue) {
    double interval = maxValue / 0.5;
    if (interval < 1) {
      interval = 1;
    }
    return interval;
  }

  FlTitlesData _getTitlesData({required bool isQuantidade}) {
    double interval = isQuantidade
        ? _calculateInterval(maxQuantidadeVendida)
        : _calculateInterval(maxFaturamento);

    return FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 34,
            getTitlesWidget: (double value, TitleMeta meta) {
              return Text(
                value.toStringAsFixed(0),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              );
            },
            interval: interval,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) {
              if (value.toInt() >= 0 &&
                  value.toInt() < widget.produtos.length) {
                return Text(
                  widget.produtos[value.toInt()].nome,
                  style: TextStyle(fontSize: 15),
                );
              }
              return Text('');
            },
          ),
        ));
  }
}
