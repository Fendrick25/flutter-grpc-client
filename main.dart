import 'package:flutter/material.dart';
import 'package:flutter_grpc/generated/product_service.pbgrpc.dart';
import 'package:flutter_grpc/grpc/grpc_service.dart';

GrpcService service = GrpcService();
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      ProductRequest request = ProductRequest()
        ..id = "8";
      Future<Product> product = GrpcService().getProduct(request);
      product.then((Product result) {
        print(result.toProto3Json());
      });
      _counter++;
    });
  }

  void _listenProductStream() {
    setState(() {
      Identity identity = Identity();
      identity.id = "8";
      Stream<Product> products = GrpcService().listenProductStream(identity);
      products.forEach((element) {print(element.toProto3Json());});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _listenProductStream,
            tooltip: 'Listen to Product Stream',
            child: const Icon(Icons.add),
          ),
        ],
      )


    );
  }
}
