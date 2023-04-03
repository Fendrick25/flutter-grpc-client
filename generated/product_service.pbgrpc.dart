///
//  Generated code. Do not modify.
//  source: product_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'product_service.pb.dart' as $0;
export 'product_service.pb.dart';

class ProductServiceClient extends $grpc.Client {
  static final _$getProduct = $grpc.ClientMethod<$0.ProductRequest, $0.Product>(
      '/proto.ProductService/getProduct',
      ($0.ProductRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Product.fromBuffer(value));
  static final _$listenProductStream =
      $grpc.ClientMethod<$0.Identity, $0.Product>(
          '/proto.ProductService/listenProductStream',
          ($0.Identity value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Product.fromBuffer(value));
  static final _$streamProduct = $grpc.ClientMethod<$0.Identity, $0.Product>(
      '/proto.ProductService/streamProduct',
      ($0.Identity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Product.fromBuffer(value));

  ProductServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Product> getProduct($0.ProductRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProduct, request, options: options);
  }

  $grpc.ResponseStream<$0.Product> listenProductStream($0.Identity request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listenProductStream, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.Product> streamProduct($0.Identity request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamProduct, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ProductServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ProductService';

  ProductServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ProductRequest, $0.Product>(
        'getProduct',
        getProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProductRequest.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Identity, $0.Product>(
        'listenProductStream',
        listenProductStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Identity.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Identity, $0.Product>(
        'streamProduct',
        streamProduct_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Identity.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
  }

  $async.Future<$0.Product> getProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProductRequest> request) async {
    return getProduct(call, await request);
  }

  $async.Stream<$0.Product> listenProductStream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Identity> request) async* {
    yield* listenProductStream(call, await request);
  }

  $async.Stream<$0.Product> streamProduct_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Identity> request) async* {
    yield* streamProduct(call, await request);
  }

  $async.Future<$0.Product> getProduct(
      $grpc.ServiceCall call, $0.ProductRequest request);
  $async.Stream<$0.Product> listenProductStream(
      $grpc.ServiceCall call, $0.Identity request);
  $async.Stream<$0.Product> streamProduct(
      $grpc.ServiceCall call, $0.Identity request);
}
