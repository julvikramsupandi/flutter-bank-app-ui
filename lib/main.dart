import 'package:flutter/material.dart';
import 'package:flutter_ui_bank_app/statistics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Bank App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BankApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BankApp extends StatefulWidget {
  const BankApp({Key? key}) : super(key: key);

  @override
  State<BankApp> createState() => _BankAppState();
}

class _BankAppState extends State<BankApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _top(),
            SizedBox(
              height: 330,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  _card(
                    id: '*********** 34567',
                    balance: '\$600',
                    color: Colors.deepPurple,
                    image: 'assets/images/jig.png',
                  ),
                  _card(
                    id: '*********** 20999',
                    balance: '\$60',
                    color: Colors.blueAccent,
                    image: 'assets/images/jig.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transaction',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _transactions(),
          ],
        ),
      ),
    );
  }

  Widget _transactions() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            _itemTransactions(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Statistics(),
                  ),
                );
              },
              icon: Icons.flight_takeoff,
              desc: 'Traveling',
              time: '3 Day Ago',
              date: '24 feb',
              total: '\$445.000',
              color: Colors.blue,
            ),
            _itemTransactions(
              onTap: () {},
              icon: Icons.fastfood,
              desc: 'Food',
              time: 'Today',
              date: '27 feb',
              total: '\$45.000',
              color: Colors.orange,
            ),
            _itemTransactions(
              onTap: () {},
              icon: Icons.man_outlined,
              desc: 'Yoga',
              time: '1 Month Ago',
              date: '24 Jan',
              total: '\$45.000',
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemTransactions({
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
    required String desc,
    required String total,
    required String time,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 18),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: color),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  total,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _card({
    required String id,
    required Color color,
    required String balance,
    required String image,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(top: 100, left: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(38),
          ),
          child: Stack(children: [
            _cardBackground(size: 40, pTop: 90, pLeft: 300),
            _cardBackground(size: 140, pBottom: -50),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _masterCardLogo(),
                    Text(
                      id,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mastercard',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          balance,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.add, size: 32),
                    )
                  ],
                ),
              ]),
            ),
          ]),
        ),
        Positioned(
          top: 0,
          child: Image.asset(
            image,
            width: 140,
          ),
        )
      ],
    );
  }

  Widget _masterCardLogo() {
    return SizedBox(
      width: 100,
      child: Stack(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBackground({
    double size = 40,
    double? pTop,
    double? pBottom,
    double? pLeft,
    double? pRight,
  }) {
    return Positioned(
      left: pLeft,
      top: pTop,
      bottom: pBottom,
      right: pRight,
      child: Transform.rotate(
        angle: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(size / 6),
          ),
          width: size,
          height: size,
        ),
      ),
    );
  }

  Widget _top() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'My Card',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '27 Feb',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '😝',
            style: TextStyle(fontSize: 24),
          ),
        )
      ]),
    );
  }
}
