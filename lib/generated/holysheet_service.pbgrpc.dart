///
//  Generated code. Do not modify.
//  source: holysheet_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'holysheet_service.pb.dart' as $0;
export 'holysheet_service.pb.dart';

class HolySheetServiceClient extends $grpc.Client {
  static final _$listFiles =
      $grpc.ClientMethod<$0.ListRequest, $0.ListResponse>(
          '/com.uddernetworks.grpc.HolySheetService/listFiles',
          ($0.ListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ListResponse.fromBuffer(value));
  static final _$uploadFile =
      $grpc.ClientMethod<$0.UploadRequest, $0.UploadResponse>(
          '/com.uddernetworks.grpc.HolySheetService/uploadFile',
          ($0.UploadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UploadResponse.fromBuffer(value));
  static final _$downloadFile =
      $grpc.ClientMethod<$0.DownloadRequest, $0.DownloadResponse>(
          '/com.uddernetworks.grpc.HolySheetService/downloadFile',
          ($0.DownloadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DownloadResponse.fromBuffer(value));
  static final _$removeFile =
      $grpc.ClientMethod<$0.RemoveRequest, $0.RemoveResponse>(
          '/com.uddernetworks.grpc.HolySheetService/removeFile',
          ($0.RemoveRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RemoveResponse.fromBuffer(value));
  static final _$executeCode =
      $grpc.ClientMethod<$0.CodeExecutionRequest, $0.CodeExecutionResponse>(
          '/com.uddernetworks.grpc.HolySheetService/executeCode',
          ($0.CodeExecutionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CodeExecutionResponse.fromBuffer(value));
  static final _$listenCallbacks = $grpc.ClientMethod<$0.ListenCallbacksRequest,
          $0.CodeExecutionCallbackResponse>(
      '/com.uddernetworks.grpc.HolySheetService/listenCallbacks',
      ($0.ListenCallbacksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CodeExecutionCallbackResponse.fromBuffer(value));

  HolySheetServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.ListResponse> listFiles($0.ListRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$listFiles, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.UploadResponse> uploadFile($0.UploadRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$uploadFile, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$0.DownloadResponse> downloadFile(
      $0.DownloadRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$downloadFile, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$0.RemoveResponse> removeFile($0.RemoveRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$removeFile, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.CodeExecutionResponse> executeCode(
      $0.CodeExecutionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$executeCode, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.CodeExecutionCallbackResponse> listenCallbacks(
      $0.ListenCallbacksRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listenCallbacks, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class HolySheetServiceBase extends $grpc.Service {
  $core.String get $name => 'com.uddernetworks.grpc.HolySheetService';

  HolySheetServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListRequest, $0.ListResponse>(
        'listFiles',
        listFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRequest.fromBuffer(value),
        ($0.ListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadRequest, $0.UploadResponse>(
        'uploadFile',
        uploadFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.UploadRequest.fromBuffer(value),
        ($0.UploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadRequest, $0.DownloadResponse>(
        'downloadFile',
        downloadFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadRequest.fromBuffer(value),
        ($0.DownloadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveRequest, $0.RemoveResponse>(
        'removeFile',
        removeFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.RemoveRequest.fromBuffer(value),
        ($0.RemoveResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CodeExecutionRequest, $0.CodeExecutionResponse>(
            'executeCode',
            executeCode_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CodeExecutionRequest.fromBuffer(value),
            ($0.CodeExecutionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListenCallbacksRequest,
            $0.CodeExecutionCallbackResponse>(
        'listenCallbacks',
        listenCallbacks_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.ListenCallbacksRequest.fromBuffer(value),
        ($0.CodeExecutionCallbackResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListResponse> listFiles_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListRequest> request) async {
    return listFiles(call, await request);
  }

  $async.Stream<$0.UploadResponse> uploadFile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UploadRequest> request) async* {
    yield* uploadFile(call, await request);
  }

  $async.Stream<$0.DownloadResponse> downloadFile_Pre($grpc.ServiceCall call,
      $async.Future<$0.DownloadRequest> request) async* {
    yield* downloadFile(call, await request);
  }

  $async.Stream<$0.RemoveResponse> removeFile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RemoveRequest> request) async* {
    yield* removeFile(call, await request);
  }

  $async.Future<$0.CodeExecutionResponse> executeCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CodeExecutionRequest> request) async {
    return executeCode(call, await request);
  }

  $async.Stream<$0.CodeExecutionCallbackResponse> listenCallbacks_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListenCallbacksRequest> request) async* {
    yield* listenCallbacks(call, await request);
  }

  $async.Future<$0.ListResponse> listFiles(
      $grpc.ServiceCall call, $0.ListRequest request);
  $async.Stream<$0.UploadResponse> uploadFile(
      $grpc.ServiceCall call, $0.UploadRequest request);
  $async.Stream<$0.DownloadResponse> downloadFile(
      $grpc.ServiceCall call, $0.DownloadRequest request);
  $async.Stream<$0.RemoveResponse> removeFile(
      $grpc.ServiceCall call, $0.RemoveRequest request);
  $async.Future<$0.CodeExecutionResponse> executeCode(
      $grpc.ServiceCall call, $0.CodeExecutionRequest request);
  $async.Stream<$0.CodeExecutionCallbackResponse> listenCallbacks(
      $grpc.ServiceCall call, $0.ListenCallbacksRequest request);
}
