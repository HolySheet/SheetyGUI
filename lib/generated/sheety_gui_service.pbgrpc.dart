///
//  Generated code. Do not modify.
//  source: sheety_gui_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sheety_gui_service.pb.dart' as $0;
export 'sheety_gui_service.pb.dart';

class SheetyGUIServiceClient extends $grpc.Client {
  static final _$openFileSelector =
      $grpc.ClientMethod<$0.SelectorRequest, $0.SelectorResponse>(
          '/com.uddernetworks.grpc.sheetyGui.SheetyGUIService/openFileSelector',
          ($0.SelectorRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SelectorResponse.fromBuffer(value));
  static final _$getClipboard =
      $grpc.ClientMethod<$0.ClipboardRequest, $0.ClipboardResponse>(
          '/com.uddernetworks.grpc.sheetyGui.SheetyGUIService/getClipboard',
          ($0.ClipboardRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ClipboardResponse.fromBuffer(value));

  SheetyGUIServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.SelectorResponse> openFileSelector(
      $0.SelectorRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$openFileSelector, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ClipboardResponse> getClipboard(
      $0.ClipboardRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getClipboard, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class SheetyGUIServiceBase extends $grpc.Service {
  $core.String get $name => 'com.uddernetworks.grpc.sheetyGui.SheetyGUIService';

  SheetyGUIServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SelectorRequest, $0.SelectorResponse>(
        'openFileSelector',
        openFileSelector_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SelectorRequest.fromBuffer(value),
        ($0.SelectorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClipboardRequest, $0.ClipboardResponse>(
        'getClipboard',
        getClipboard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ClipboardRequest.fromBuffer(value),
        ($0.ClipboardResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SelectorResponse> openFileSelector_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SelectorRequest> request) async {
    return openFileSelector(call, await request);
  }

  $async.Future<$0.ClipboardResponse> getClipboard_Pre($grpc.ServiceCall call,
      $async.Future<$0.ClipboardRequest> request) async {
    return getClipboard(call, await request);
  }

  $async.Future<$0.SelectorResponse> openFileSelector(
      $grpc.ServiceCall call, $0.SelectorRequest request);
  $async.Future<$0.ClipboardResponse> getClipboard(
      $grpc.ServiceCall call, $0.ClipboardRequest request);
}
