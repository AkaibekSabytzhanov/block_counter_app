import 'package:block_counter_app/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterBloc(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    ),
  ));
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        title: const Center(
          child: Text('Bloc Counter App'),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(fontSize: 36.0),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "2",
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
            onPressed: () {
              counterBloc.add(CounterEvent.Decrement);
            },
          ),
          FloatingActionButton(
            heroTag: "3",
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.loop),
            onPressed: () {
              counterBloc.add(CounterEvent.Reset);
            },
          ),
          FloatingActionButton(
            heroTag: "1",
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.add),
            onPressed: () {
              counterBloc.add(CounterEvent.Increment);
            },
          ),
        ],
      ),
    );
  }
}
