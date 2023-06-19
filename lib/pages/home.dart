import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'KChat',
                style: TextStyle(
                    fontSize: 70.0,
                    fontFamily: 'MoiraiOne',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              const SizedBox(height: 30.0),
              FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chatbox');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey[800],
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: const Text('START'),
              ),
            ],
          )
        ],
      ),
    );
  }
}


