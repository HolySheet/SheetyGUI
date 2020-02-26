///
//  Generated code. Do not modify.
//  source: sheety_gui_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'sheety_gui_service.pbenum.dart';

export 'sheety_gui_service.pbenum.dart';

class SelectorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SelectorRequest', package: const $pb.PackageName('com.uddernetworks.grpc.sheetyGui'), createEmptyInstance: create)
    ..aOS(1, 'title')
    ..aOB(2, 'multiSelect', protoName: 'multiSelect')
    ..aOS(3, 'initialDirectory', protoName: 'initialDirectory')
    ..e<SelectorRequest_SelectionMode>(4, 'mode', $pb.PbFieldType.OE, defaultOrMaker: SelectorRequest_SelectionMode.Open, valueOf: SelectorRequest_SelectionMode.valueOf, enumValues: SelectorRequest_SelectionMode.values)
    ..e<SelectorRequest_FileSelection>(5, 'selectionMode', $pb.PbFieldType.OE, protoName: 'selectionMode', defaultOrMaker: SelectorRequest_FileSelection.Files, valueOf: SelectorRequest_FileSelection.valueOf, enumValues: SelectorRequest_FileSelection.values)
    ..hasRequiredFields = false
  ;

  SelectorRequest._() : super();
  factory SelectorRequest() => create();
  factory SelectorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SelectorRequest clone() => SelectorRequest()..mergeFromMessage(this);
  SelectorRequest copyWith(void Function(SelectorRequest) updates) => super.copyWith((message) => updates(message as SelectorRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectorRequest create() => SelectorRequest._();
  SelectorRequest createEmptyInstance() => create();
  static $pb.PbList<SelectorRequest> createRepeated() => $pb.PbList<SelectorRequest>();
  @$core.pragma('dart2js:noInline')
  static SelectorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectorRequest>(create);
  static SelectorRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get multiSelect => $_getBF(1);
  @$pb.TagNumber(2)
  set multiSelect($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMultiSelect() => $_has(1);
  @$pb.TagNumber(2)
  void clearMultiSelect() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get initialDirectory => $_getSZ(2);
  @$pb.TagNumber(3)
  set initialDirectory($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInitialDirectory() => $_has(2);
  @$pb.TagNumber(3)
  void clearInitialDirectory() => clearField(3);

  @$pb.TagNumber(4)
  SelectorRequest_SelectionMode get mode => $_getN(3);
  @$pb.TagNumber(4)
  set mode(SelectorRequest_SelectionMode v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);

  @$pb.TagNumber(5)
  SelectorRequest_FileSelection get selectionMode => $_getN(4);
  @$pb.TagNumber(5)
  set selectionMode(SelectorRequest_FileSelection v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSelectionMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearSelectionMode() => clearField(5);
}

class SelectorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SelectorResponse', package: const $pb.PackageName('com.uddernetworks.grpc.sheetyGui'), createEmptyInstance: create)
    ..pPS(1, 'files')
    ..aOB(2, 'cancelled')
    ..hasRequiredFields = false
  ;

  SelectorResponse._() : super();
  factory SelectorResponse() => create();
  factory SelectorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SelectorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SelectorResponse clone() => SelectorResponse()..mergeFromMessage(this);
  SelectorResponse copyWith(void Function(SelectorResponse) updates) => super.copyWith((message) => updates(message as SelectorResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectorResponse create() => SelectorResponse._();
  SelectorResponse createEmptyInstance() => create();
  static $pb.PbList<SelectorResponse> createRepeated() => $pb.PbList<SelectorResponse>();
  @$core.pragma('dart2js:noInline')
  static SelectorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SelectorResponse>(create);
  static SelectorResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get files => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get cancelled => $_getBF(1);
  @$pb.TagNumber(2)
  set cancelled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCancelled() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelled() => clearField(2);
}

class ClipboardRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClipboardRequest', package: const $pb.PackageName('com.uddernetworks.grpc.sheetyGui'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ClipboardRequest._() : super();
  factory ClipboardRequest() => create();
  factory ClipboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClipboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ClipboardRequest clone() => ClipboardRequest()..mergeFromMessage(this);
  ClipboardRequest copyWith(void Function(ClipboardRequest) updates) => super.copyWith((message) => updates(message as ClipboardRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClipboardRequest create() => ClipboardRequest._();
  ClipboardRequest createEmptyInstance() => create();
  static $pb.PbList<ClipboardRequest> createRepeated() => $pb.PbList<ClipboardRequest>();
  @$core.pragma('dart2js:noInline')
  static ClipboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClipboardRequest>(create);
  static ClipboardRequest _defaultInstance;
}

class ClipboardResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClipboardResponse', package: const $pb.PackageName('com.uddernetworks.grpc.sheetyGui'), createEmptyInstance: create)
    ..aOS(1, 'content')
    ..hasRequiredFields = false
  ;

  ClipboardResponse._() : super();
  factory ClipboardResponse() => create();
  factory ClipboardResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClipboardResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ClipboardResponse clone() => ClipboardResponse()..mergeFromMessage(this);
  ClipboardResponse copyWith(void Function(ClipboardResponse) updates) => super.copyWith((message) => updates(message as ClipboardResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClipboardResponse create() => ClipboardResponse._();
  ClipboardResponse createEmptyInstance() => create();
  static $pb.PbList<ClipboardResponse> createRepeated() => $pb.PbList<ClipboardResponse>();
  @$core.pragma('dart2js:noInline')
  static ClipboardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClipboardResponse>(create);
  static ClipboardResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

