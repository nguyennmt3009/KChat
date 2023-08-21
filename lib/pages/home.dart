import 'package:flutter/material.dart';
import 'package:kchat/utils/native_method.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<String> _setupRakutenPoint() async {
    return await NativeMethod.invokeMethod(NativeMethodType.setupRakutenPoint);
  }

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
              const SizedBox(height: 30.0),
              FilledButton(
                onPressed: () {
                  _setupRakutenPoint()
                    .then((value) => {
                      print('setupRakutenPoint: value=$value')
                    });
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 205, 41, 41),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: const Text('楽天ポイントカード'),
              ),
            ],
          )
        ],
      ),
    );
  }
}


