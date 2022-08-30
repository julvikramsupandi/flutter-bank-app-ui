import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            _menu(),
            const SizedBox(height: 30),
            _total(),
            const SizedBox(height: 30),
            _chart(),
            const SizedBox(height: 30),
            _statistic(),
          ],
        ),
      ),
    );
  }

  Widget _statistic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.tune,
                  color: Colors.white54,
                  size: 32,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black12,
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black12,
                    ),
                    child: const Center(
                      child: Text(
                        '55%',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Avarage Spend',
                      style: TextStyle(color: Colors.white54),
                    ),
                    const Text(
                      '\$4,100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.file_open,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _chart() {
    return SizedBox(
      height: 240,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: _bottomTitleWidgets,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              curveSmoothness: 0.4,
              color: Colors.cyanAccent,
              barWidth: 6,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              spots: const [
                FlSpot(1, 3),
                FlSpot(2, 1),
                FlSpot(3, 5),
                FlSpot(4, 2),
                FlSpot(5, 5),
                FlSpot(6, 6),
                FlSpot(7, 9),
              ],
            )
          ],
          minX: 0,
          maxX: 8,
          maxY: 10,
          minY: 0,
        ),
      ),
    );
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white60, fontSize: 14);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Thu', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 4:
        text = const Text('Thr', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 6:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget _total() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Text(
                'Total Income',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$2,500',
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(color: Colors.white38),
          ),
          Column(
            children: const [
              Text(
                'Expanses',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$1,450',
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menu() {
    return CarouselSlider(
      items: [
        _itemMenu(
          index: 0,
          color: Colors.blueAccent,
          icon: Icons.flight_takeoff,
        ),
        _itemMenu(
          index: 1,
          color: Colors.orange,
          icon: Icons.fastfood,
        ),
        _itemMenu(
          index: 2,
          color: Colors.red,
          icon: Icons.man_outlined,
        ),
      ],
      options: CarouselOptions(
        autoPlay: false,
        height: 100,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        initialPage: _currentIndex,
        onPageChanged: (i, reason) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  Widget _itemMenu({
    required int index,
    required Color color,
    required IconData icon,
  }) {
    Color bgColor = index == _currentIndex ? color : Colors.transparent;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        child: Icon(
          icon,
          color: bgColor == color ? Colors.white : color,
          size: 28,
        ),
      ),
    );
  }
}
