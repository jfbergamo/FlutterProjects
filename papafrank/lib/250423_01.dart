// Bergmasco Jacopo, 5AIA, A.S. 2024-2025
// 23/04/2025, FloatingActionButton Multipli

import 'package:flutter/material.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Pippo LoSballo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    const Text(
                        'Guarda mamma, il numero cambia!',
                    ),
                    Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                    ),
                ],
            ),
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
                FloatingActionButton(
                    onPressed: () => setState(() {
                        _counter++;
                    }),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                    onPressed: () => setState(() {
                        _counter--;
                    }),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                )
            ],
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () => setState(() => _counter++),
        //     tooltip: 'Increment',
        //     child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
