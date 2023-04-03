import 'package:flutter_grpc/generated/product_service.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GrpcService{
  final channel = ClientChannel(
    '192.168.2.49', //localhost
    port: 50052,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  Future<Product> getProduct(ProductRequest request) async {
    final stub = ProductServiceClient(channel); // This class is auto generated
    try {
      return await stub.getProduct(request);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
  
  Stream<Product> listenProductStream(Identity identity) async *{
    final stub = ProductServiceClient(channel);
    while(true){
      try{
        var products = stub.listenProductStream(identity);
        await for(final product in products){
          yield product;
        }
      }on Exception catch(e){
        yield * Stream.error(e);
      }
      await Future.delayed(const Duration(seconds: 3));
    }
  }
}