///
//  Generated code. Do not modify.
//  source: holysheet_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'holysheet_service.pbenum.dart';

export 'holysheet_service.pbenum.dart';

class ListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListItem', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'id')
    ..a<$core.int>(3, 'sheets', $pb.PbFieldType.O3)
    ..aInt64(4, 'size')
    ..aInt64(5, 'date')
    ..aOB(6, 'selfOwned', protoName: 'selfOwned')
    ..aOS(7, 'owner')
    ..aOS(8, 'driveLink', protoName: 'driveLink')
    ..hasRequiredFields = false
  ;

  ListItem._() : super();
  factory ListItem() => create();
  factory ListItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListItem clone() => ListItem()..mergeFromMessage(this);
  ListItem copyWith(void Function(ListItem) updates) => super.copyWith((message) => updates(message as ListItem));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListItem create() => ListItem._();
  ListItem createEmptyInstance() => create();
  static $pb.PbList<ListItem> createRepeated() => $pb.PbList<ListItem>();
  @$core.pragma('dart2js:noInline')
  static ListItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListItem>(create);
  static ListItem _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sheets => $_getIZ(2);
  @$pb.TagNumber(3)
  set sheets($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSheets() => $_has(2);
  @$pb.TagNumber(3)
  void clearSheets() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(4)
  set size($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get date => $_getI64(4);
  @$pb.TagNumber(5)
  set date($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get selfOwned => $_getBF(5);
  @$pb.TagNumber(6)
  set selfOwned($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSelfOwned() => $_has(5);
  @$pb.TagNumber(6)
  void clearSelfOwned() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get owner => $_getSZ(6);
  @$pb.TagNumber(7)
  set owner($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOwner() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwner() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get driveLink => $_getSZ(7);
  @$pb.TagNumber(8)
  set driveLink($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDriveLink() => $_has(7);
  @$pb.TagNumber(8)
  void clearDriveLink() => clearField(8);
}

class SerializedVariable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SerializedVariable', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'type')
    ..aOS(3, 'object')
    ..hasRequiredFields = false
  ;

  SerializedVariable._() : super();
  factory SerializedVariable() => create();
  factory SerializedVariable.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SerializedVariable.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SerializedVariable clone() => SerializedVariable()..mergeFromMessage(this);
  SerializedVariable copyWith(void Function(SerializedVariable) updates) => super.copyWith((message) => updates(message as SerializedVariable));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SerializedVariable create() => SerializedVariable._();
  SerializedVariable createEmptyInstance() => create();
  static $pb.PbList<SerializedVariable> createRepeated() => $pb.PbList<SerializedVariable>();
  @$core.pragma('dart2js:noInline')
  static SerializedVariable getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SerializedVariable>(create);
  static SerializedVariable _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get object => $_getSZ(2);
  @$pb.TagNumber(3)
  set object($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasObject() => $_has(2);
  @$pb.TagNumber(3)
  void clearObject() => clearField(3);
}

class ListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'path')
    ..hasRequiredFields = false
  ;

  ListRequest._() : super();
  factory ListRequest() => create();
  factory ListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListRequest clone() => ListRequest()..mergeFromMessage(this);
  ListRequest copyWith(void Function(ListRequest) updates) => super.copyWith((message) => updates(message as ListRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListRequest create() => ListRequest._();
  ListRequest createEmptyInstance() => create();
  static $pb.PbList<ListRequest> createRepeated() => $pb.PbList<ListRequest>();
  @$core.pragma('dart2js:noInline')
  static ListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRequest>(create);
  static ListRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class ListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..pc<ListItem>(1, 'items', $pb.PbFieldType.PM, subBuilder: ListItem.create)
    ..hasRequiredFields = false
  ;

  ListResponse._() : super();
  factory ListResponse() => create();
  factory ListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListResponse clone() => ListResponse()..mergeFromMessage(this);
  ListResponse copyWith(void Function(ListResponse) updates) => super.copyWith((message) => updates(message as ListResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListResponse create() => ListResponse._();
  ListResponse createEmptyInstance() => create();
  static $pb.PbList<ListResponse> createRepeated() => $pb.PbList<ListResponse>();
  @$core.pragma('dart2js:noInline')
  static ListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListResponse>(create);
  static ListResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListItem> get items => $_getList(0);
}

class UploadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'file')
    ..aOS(2, 'id')
    ..e<UploadRequest_Upload>(3, 'upload', $pb.PbFieldType.OE, defaultOrMaker: UploadRequest_Upload.MULTIPART, valueOf: UploadRequest_Upload.valueOf, enumValues: UploadRequest_Upload.values)
    ..e<UploadRequest_Compression>(4, 'compression', $pb.PbFieldType.OE, defaultOrMaker: UploadRequest_Compression.NONE, valueOf: UploadRequest_Compression.valueOf, enumValues: UploadRequest_Compression.values)
    ..aInt64(5, 'sheetSize', protoName: 'sheetSize')
    ..hasRequiredFields = false
  ;

  UploadRequest._() : super();
  factory UploadRequest() => create();
  factory UploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UploadRequest clone() => UploadRequest()..mergeFromMessage(this);
  UploadRequest copyWith(void Function(UploadRequest) updates) => super.copyWith((message) => updates(message as UploadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadRequest create() => UploadRequest._();
  UploadRequest createEmptyInstance() => create();
  static $pb.PbList<UploadRequest> createRepeated() => $pb.PbList<UploadRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadRequest>(create);
  static UploadRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get file => $_getSZ(0);
  @$pb.TagNumber(1)
  set file($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  UploadRequest_Upload get upload => $_getN(2);
  @$pb.TagNumber(3)
  set upload(UploadRequest_Upload v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpload() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpload() => clearField(3);

  @$pb.TagNumber(4)
  UploadRequest_Compression get compression => $_getN(3);
  @$pb.TagNumber(4)
  set compression(UploadRequest_Compression v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompression() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompression() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sheetSize => $_getI64(4);
  @$pb.TagNumber(5)
  set sheetSize($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSheetSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSheetSize() => clearField(5);
}

class UploadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..e<UploadResponse_UploadStatus>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: UploadResponse_UploadStatus.PENDING, valueOf: UploadResponse_UploadStatus.valueOf, enumValues: UploadResponse_UploadStatus.values)
    ..a<$core.double>(2, 'percentage', $pb.PbFieldType.OD)
    ..aOM<ListItem>(3, 'item', subBuilder: ListItem.create)
    ..hasRequiredFields = false
  ;

  UploadResponse._() : super();
  factory UploadResponse() => create();
  factory UploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UploadResponse clone() => UploadResponse()..mergeFromMessage(this);
  UploadResponse copyWith(void Function(UploadResponse) updates) => super.copyWith((message) => updates(message as UploadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadResponse create() => UploadResponse._();
  UploadResponse createEmptyInstance() => create();
  static $pb.PbList<UploadResponse> createRepeated() => $pb.PbList<UploadResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadResponse>(create);
  static UploadResponse _defaultInstance;

  @$pb.TagNumber(1)
  UploadResponse_UploadStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(UploadResponse_UploadStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get percentage => $_getN(1);
  @$pb.TagNumber(2)
  set percentage($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPercentage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercentage() => clearField(2);

  @$pb.TagNumber(3)
  ListItem get item => $_getN(2);
  @$pb.TagNumber(3)
  set item(ListItem v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasItem() => $_has(2);
  @$pb.TagNumber(3)
  void clearItem() => clearField(3);
  @$pb.TagNumber(3)
  ListItem ensureItem() => $_ensure(2);
}

class DownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DownloadRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'path')
    ..hasRequiredFields = false
  ;

  DownloadRequest._() : super();
  factory DownloadRequest() => create();
  factory DownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DownloadRequest clone() => DownloadRequest()..mergeFromMessage(this);
  DownloadRequest copyWith(void Function(DownloadRequest) updates) => super.copyWith((message) => updates(message as DownloadRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadRequest create() => DownloadRequest._();
  DownloadRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadRequest> createRepeated() => $pb.PbList<DownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadRequest>(create);
  static DownloadRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
}

class DownloadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DownloadResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..e<DownloadResponse_DownloadStatus>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: DownloadResponse_DownloadStatus.PENDING, valueOf: DownloadResponse_DownloadStatus.valueOf, enumValues: DownloadResponse_DownloadStatus.values)
    ..a<$core.double>(2, 'percentage', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  DownloadResponse._() : super();
  factory DownloadResponse() => create();
  factory DownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DownloadResponse clone() => DownloadResponse()..mergeFromMessage(this);
  DownloadResponse copyWith(void Function(DownloadResponse) updates) => super.copyWith((message) => updates(message as DownloadResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadResponse create() => DownloadResponse._();
  DownloadResponse createEmptyInstance() => create();
  static $pb.PbList<DownloadResponse> createRepeated() => $pb.PbList<DownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadResponse>(create);
  static DownloadResponse _defaultInstance;

  @$pb.TagNumber(1)
  DownloadResponse_DownloadStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(DownloadResponse_DownloadStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get percentage => $_getN(1);
  @$pb.TagNumber(2)
  set percentage($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPercentage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercentage() => clearField(2);
}

class RemoveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RemoveRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  RemoveRequest._() : super();
  factory RemoveRequest() => create();
  factory RemoveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RemoveRequest clone() => RemoveRequest()..mergeFromMessage(this);
  RemoveRequest copyWith(void Function(RemoveRequest) updates) => super.copyWith((message) => updates(message as RemoveRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveRequest create() => RemoveRequest._();
  RemoveRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveRequest> createRepeated() => $pb.PbList<RemoveRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveRequest>(create);
  static RemoveRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class RemoveResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RemoveResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..e<RemoveResponse_RemoveStatus>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: RemoveResponse_RemoveStatus.PENDING, valueOf: RemoveResponse_RemoveStatus.valueOf, enumValues: RemoveResponse_RemoveStatus.values)
    ..a<$core.double>(2, 'percentage', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  RemoveResponse._() : super();
  factory RemoveResponse() => create();
  factory RemoveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RemoveResponse clone() => RemoveResponse()..mergeFromMessage(this);
  RemoveResponse copyWith(void Function(RemoveResponse) updates) => super.copyWith((message) => updates(message as RemoveResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveResponse create() => RemoveResponse._();
  RemoveResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveResponse> createRepeated() => $pb.PbList<RemoveResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveResponse>(create);
  static RemoveResponse _defaultInstance;

  @$pb.TagNumber(1)
  RemoveResponse_RemoveStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(RemoveResponse_RemoveStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get percentage => $_getN(1);
  @$pb.TagNumber(2)
  set percentage($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPercentage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercentage() => clearField(2);
}

class CodeExecutionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CodeExecutionRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'code')
    ..pPS(2, 'returnVariables', protoName: 'returnVariables')
    ..hasRequiredFields = false
  ;

  CodeExecutionRequest._() : super();
  factory CodeExecutionRequest() => create();
  factory CodeExecutionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodeExecutionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CodeExecutionRequest clone() => CodeExecutionRequest()..mergeFromMessage(this);
  CodeExecutionRequest copyWith(void Function(CodeExecutionRequest) updates) => super.copyWith((message) => updates(message as CodeExecutionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodeExecutionRequest create() => CodeExecutionRequest._();
  CodeExecutionRequest createEmptyInstance() => create();
  static $pb.PbList<CodeExecutionRequest> createRepeated() => $pb.PbList<CodeExecutionRequest>();
  @$core.pragma('dart2js:noInline')
  static CodeExecutionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodeExecutionRequest>(create);
  static CodeExecutionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get returnVariables => $_getList(1);
}

class CodeExecutionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CodeExecutionResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..pPS(2, 'snippetResult', protoName: 'snippetResult')
    ..pc<SerializedVariable>(3, 'variables', $pb.PbFieldType.PM, subBuilder: SerializedVariable.create)
    ..hasRequiredFields = false
  ;

  CodeExecutionResponse._() : super();
  factory CodeExecutionResponse() => create();
  factory CodeExecutionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodeExecutionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CodeExecutionResponse clone() => CodeExecutionResponse()..mergeFromMessage(this);
  CodeExecutionResponse copyWith(void Function(CodeExecutionResponse) updates) => super.copyWith((message) => updates(message as CodeExecutionResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodeExecutionResponse create() => CodeExecutionResponse._();
  CodeExecutionResponse createEmptyInstance() => create();
  static $pb.PbList<CodeExecutionResponse> createRepeated() => $pb.PbList<CodeExecutionResponse>();
  @$core.pragma('dart2js:noInline')
  static CodeExecutionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodeExecutionResponse>(create);
  static CodeExecutionResponse _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.String> get snippetResult => $_getList(0);

  @$pb.TagNumber(3)
  $core.List<SerializedVariable> get variables => $_getList(1);
}

class CodeExecutionCallbackResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CodeExecutionCallbackResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'callbackState', protoName: 'callbackState')
    ..pPS(2, 'snippetResult', protoName: 'snippetResult')
    ..pc<SerializedVariable>(3, 'variables', $pb.PbFieldType.PM, subBuilder: SerializedVariable.create)
    ..hasRequiredFields = false
  ;

  CodeExecutionCallbackResponse._() : super();
  factory CodeExecutionCallbackResponse() => create();
  factory CodeExecutionCallbackResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CodeExecutionCallbackResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CodeExecutionCallbackResponse clone() => CodeExecutionCallbackResponse()..mergeFromMessage(this);
  CodeExecutionCallbackResponse copyWith(void Function(CodeExecutionCallbackResponse) updates) => super.copyWith((message) => updates(message as CodeExecutionCallbackResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CodeExecutionCallbackResponse create() => CodeExecutionCallbackResponse._();
  CodeExecutionCallbackResponse createEmptyInstance() => create();
  static $pb.PbList<CodeExecutionCallbackResponse> createRepeated() => $pb.PbList<CodeExecutionCallbackResponse>();
  @$core.pragma('dart2js:noInline')
  static CodeExecutionCallbackResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CodeExecutionCallbackResponse>(create);
  static CodeExecutionCallbackResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get callbackState => $_getSZ(0);
  @$pb.TagNumber(1)
  set callbackState($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallbackState() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallbackState() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get snippetResult => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<SerializedVariable> get variables => $_getList(2);
}

class ListenCallbacksRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListenCallbacksRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListenCallbacksRequest._() : super();
  factory ListenCallbacksRequest() => create();
  factory ListenCallbacksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListenCallbacksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListenCallbacksRequest clone() => ListenCallbacksRequest()..mergeFromMessage(this);
  ListenCallbacksRequest copyWith(void Function(ListenCallbacksRequest) updates) => super.copyWith((message) => updates(message as ListenCallbacksRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListenCallbacksRequest create() => ListenCallbacksRequest._();
  ListenCallbacksRequest createEmptyInstance() => create();
  static $pb.PbList<ListenCallbacksRequest> createRepeated() => $pb.PbList<ListenCallbacksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListenCallbacksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListenCallbacksRequest>(create);
  static ListenCallbacksRequest _defaultInstance;
}

