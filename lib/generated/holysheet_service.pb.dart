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
    ..aOS(3, 'path')
    ..a<$core.int>(5, 'sheets', $pb.PbFieldType.O3)
    ..aInt64(6, 'size')
    ..aInt64(7, 'date')
    ..aOB(8, 'selfOwned', protoName: 'selfOwned')
    ..aOS(9, 'owner')
    ..aOS(10, 'driveLink', protoName: 'driveLink')
    ..aOB(11, 'starred')
    ..aOB(12, 'trashed')
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
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);

  @$pb.TagNumber(5)
  $core.int get sheets => $_getIZ(3);
  @$pb.TagNumber(5)
  set sheets($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasSheets() => $_has(3);
  @$pb.TagNumber(5)
  void clearSheets() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get size => $_getI64(4);
  @$pb.TagNumber(6)
  set size($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(6)
  void clearSize() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get date => $_getI64(5);
  @$pb.TagNumber(7)
  set date($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasDate() => $_has(5);
  @$pb.TagNumber(7)
  void clearDate() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get selfOwned => $_getBF(6);
  @$pb.TagNumber(8)
  set selfOwned($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasSelfOwned() => $_has(6);
  @$pb.TagNumber(8)
  void clearSelfOwned() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get owner => $_getSZ(7);
  @$pb.TagNumber(9)
  set owner($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasOwner() => $_has(7);
  @$pb.TagNumber(9)
  void clearOwner() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get driveLink => $_getSZ(8);
  @$pb.TagNumber(10)
  set driveLink($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasDriveLink() => $_has(8);
  @$pb.TagNumber(10)
  void clearDriveLink() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get starred => $_getBF(9);
  @$pb.TagNumber(11)
  set starred($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasStarred() => $_has(9);
  @$pb.TagNumber(11)
  void clearStarred() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get trashed => $_getBF(10);
  @$pb.TagNumber(12)
  set trashed($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasTrashed() => $_has(10);
  @$pb.TagNumber(12)
  void clearTrashed() => clearField(12);
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
    ..aOS(1, 'token')
    ..aOS(2, 'path')
    ..aOB(3, 'starred')
    ..aOB(4, 'trashed')
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
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get starred => $_getBF(2);
  @$pb.TagNumber(3)
  set starred($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStarred() => $_has(2);
  @$pb.TagNumber(3)
  void clearStarred() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get trashed => $_getBF(3);
  @$pb.TagNumber(4)
  set trashed($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTrashed() => $_has(3);
  @$pb.TagNumber(4)
  void clearTrashed() => clearField(4);
}

class ListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..pc<ListItem>(1, 'items', $pb.PbFieldType.PM, subBuilder: ListItem.create)
    ..pPS(2, 'folders')
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

  @$pb.TagNumber(2)
  $core.List<$core.String> get folders => $_getList(1);
}

class UploadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'path')
    ..aOS(3, 'name')
    ..aOS(4, 'id')
    ..e<UploadRequest_Upload>(5, 'upload', $pb.PbFieldType.OE, defaultOrMaker: UploadRequest_Upload.MULTIPART, valueOf: UploadRequest_Upload.valueOf, enumValues: UploadRequest_Upload.values)
    ..e<UploadRequest_Compression>(6, 'compression', $pb.PbFieldType.OE, defaultOrMaker: UploadRequest_Compression.NONE, valueOf: UploadRequest_Compression.valueOf, enumValues: UploadRequest_Compression.values)
    ..aInt64(7, 'sheetSize', protoName: 'sheetSize')
    ..aInt64(8, 'fileSize', protoName: 'fileSize')
    ..aOS(9, 'processingId', protoName: 'processingId')
    ..aOS(10, 'localPath', protoName: 'localPath')
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
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  UploadRequest_Upload get upload => $_getN(4);
  @$pb.TagNumber(5)
  set upload(UploadRequest_Upload v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpload() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpload() => clearField(5);

  @$pb.TagNumber(6)
  UploadRequest_Compression get compression => $_getN(5);
  @$pb.TagNumber(6)
  set compression(UploadRequest_Compression v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCompression() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompression() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get sheetSize => $_getI64(6);
  @$pb.TagNumber(7)
  set sheetSize($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSheetSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearSheetSize() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get fileSize => $_getI64(7);
  @$pb.TagNumber(8)
  set fileSize($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFileSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileSize() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get processingId => $_getSZ(8);
  @$pb.TagNumber(9)
  set processingId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasProcessingId() => $_has(8);
  @$pb.TagNumber(9)
  void clearProcessingId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get localPath => $_getSZ(9);
  @$pb.TagNumber(10)
  set localPath($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLocalPath() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocalPath() => clearField(10);
}

class UploadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..e<UploadResponse_UploadStatus>(1, 'uploadStatus', $pb.PbFieldType.OE, protoName: 'uploadStatus', defaultOrMaker: UploadResponse_UploadStatus.READY, valueOf: UploadResponse_UploadStatus.valueOf, enumValues: UploadResponse_UploadStatus.values)
    ..aOM<ListItem>(2, 'item', subBuilder: ListItem.create)
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
  UploadResponse_UploadStatus get uploadStatus => $_getN(0);
  @$pb.TagNumber(1)
  set uploadStatus(UploadResponse_UploadStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUploadStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadStatus() => clearField(1);

  @$pb.TagNumber(2)
  ListItem get item => $_getN(1);
  @$pb.TagNumber(2)
  set item(ListItem v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearItem() => clearField(2);
  @$pb.TagNumber(2)
  ListItem ensureItem() => $_ensure(1);
}

class FileChunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FileChunk', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'processingId', protoName: 'processingId')
    ..a<$core.List<$core.int>>(2, 'content', $pb.PbFieldType.OY)
    ..e<FileChunk_ChunkStatus>(3, 'status', $pb.PbFieldType.OE, defaultOrMaker: FileChunk_ChunkStatus.Normal, valueOf: FileChunk_ChunkStatus.valueOf, enumValues: FileChunk_ChunkStatus.values)
    ..hasRequiredFields = false
  ;

  FileChunk._() : super();
  factory FileChunk() => create();
  factory FileChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FileChunk clone() => FileChunk()..mergeFromMessage(this);
  FileChunk copyWith(void Function(FileChunk) updates) => super.copyWith((message) => updates(message as FileChunk));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileChunk create() => FileChunk._();
  FileChunk createEmptyInstance() => create();
  static $pb.PbList<FileChunk> createRepeated() => $pb.PbList<FileChunk>();
  @$core.pragma('dart2js:noInline')
  static FileChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileChunk>(create);
  static FileChunk _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get processingId => $_getSZ(0);
  @$pb.TagNumber(1)
  set processingId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProcessingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProcessingId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get content => $_getN(1);
  @$pb.TagNumber(2)
  set content($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  FileChunk_ChunkStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(FileChunk_ChunkStatus v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class ChunkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChunkResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aInt64(1, 'currentBuffer', protoName: 'currentBuffer')
    ..hasRequiredFields = false
  ;

  ChunkResponse._() : super();
  factory ChunkResponse() => create();
  factory ChunkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChunkResponse clone() => ChunkResponse()..mergeFromMessage(this);
  ChunkResponse copyWith(void Function(ChunkResponse) updates) => super.copyWith((message) => updates(message as ChunkResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChunkResponse create() => ChunkResponse._();
  ChunkResponse createEmptyInstance() => create();
  static $pb.PbList<ChunkResponse> createRepeated() => $pb.PbList<ChunkResponse>();
  @$core.pragma('dart2js:noInline')
  static ChunkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkResponse>(create);
  static ChunkResponse _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentBuffer => $_getI64(0);
  @$pb.TagNumber(1)
  set currentBuffer($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentBuffer() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentBuffer() => clearField(1);
}

class CreateFolderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateFolderRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'path')
    ..hasRequiredFields = false
  ;

  CreateFolderRequest._() : super();
  factory CreateFolderRequest() => create();
  factory CreateFolderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFolderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateFolderRequest clone() => CreateFolderRequest()..mergeFromMessage(this);
  CreateFolderRequest copyWith(void Function(CreateFolderRequest) updates) => super.copyWith((message) => updates(message as CreateFolderRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateFolderRequest create() => CreateFolderRequest._();
  CreateFolderRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFolderRequest> createRepeated() => $pb.PbList<CreateFolderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFolderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFolderRequest>(create);
  static CreateFolderRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
}

class FolderResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FolderResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FolderResponse._() : super();
  factory FolderResponse() => create();
  factory FolderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FolderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FolderResponse clone() => FolderResponse()..mergeFromMessage(this);
  FolderResponse copyWith(void Function(FolderResponse) updates) => super.copyWith((message) => updates(message as FolderResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FolderResponse create() => FolderResponse._();
  FolderResponse createEmptyInstance() => create();
  static $pb.PbList<FolderResponse> createRepeated() => $pb.PbList<FolderResponse>();
  @$core.pragma('dart2js:noInline')
  static FolderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FolderResponse>(create);
  static FolderResponse _defaultInstance;
}

class DownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DownloadRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'id')
    ..aOS(3, 'path')
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
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);
}

class DownloadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DownloadResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..e<DownloadResponse_DownloadStatus>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: DownloadResponse_DownloadStatus.PENDING, valueOf: DownloadResponse_DownloadStatus.valueOf, enumValues: DownloadResponse_DownloadStatus.values)
    ..a<$core.double>(2, 'percentage', $pb.PbFieldType.OD)
    ..aOM<ListItem>(3, 'item', subBuilder: ListItem.create)
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

class RemoveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RemoveRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'id')
    ..aOB(3, 'permanent')
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
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get permanent => $_getBF(2);
  @$pb.TagNumber(3)
  set permanent($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermanent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermanent() => clearField(3);
}

class RemoveResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RemoveResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
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
}

class RestoreRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RestoreRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'id')
    ..hasRequiredFields = false
  ;

  RestoreRequest._() : super();
  factory RestoreRequest() => create();
  factory RestoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RestoreRequest clone() => RestoreRequest()..mergeFromMessage(this);
  RestoreRequest copyWith(void Function(RestoreRequest) updates) => super.copyWith((message) => updates(message as RestoreRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RestoreRequest create() => RestoreRequest._();
  RestoreRequest createEmptyInstance() => create();
  static $pb.PbList<RestoreRequest> createRepeated() => $pb.PbList<RestoreRequest>();
  @$core.pragma('dart2js:noInline')
  static RestoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreRequest>(create);
  static RestoreRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class RestoreResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RestoreResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RestoreResponse._() : super();
  factory RestoreResponse() => create();
  factory RestoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RestoreResponse clone() => RestoreResponse()..mergeFromMessage(this);
  RestoreResponse copyWith(void Function(RestoreResponse) updates) => super.copyWith((message) => updates(message as RestoreResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RestoreResponse create() => RestoreResponse._();
  RestoreResponse createEmptyInstance() => create();
  static $pb.PbList<RestoreResponse> createRepeated() => $pb.PbList<RestoreResponse>();
  @$core.pragma('dart2js:noInline')
  static RestoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestoreResponse>(create);
  static RestoreResponse _defaultInstance;
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
    ..pPS(1, 'snippetResult', protoName: 'snippetResult')
    ..pc<SerializedVariable>(2, 'variables', $pb.PbFieldType.PM, subBuilder: SerializedVariable.create)
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

  @$pb.TagNumber(1)
  $core.List<$core.String> get snippetResult => $_getList(0);

  @$pb.TagNumber(2)
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

class StarRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StarRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'id')
    ..aOB(3, 'starred')
    ..hasRequiredFields = false
  ;

  StarRequest._() : super();
  factory StarRequest() => create();
  factory StarRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StarRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StarRequest clone() => StarRequest()..mergeFromMessage(this);
  StarRequest copyWith(void Function(StarRequest) updates) => super.copyWith((message) => updates(message as StarRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StarRequest create() => StarRequest._();
  StarRequest createEmptyInstance() => create();
  static $pb.PbList<StarRequest> createRepeated() => $pb.PbList<StarRequest>();
  @$core.pragma('dart2js:noInline')
  static StarRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StarRequest>(create);
  static StarRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get starred => $_getBF(2);
  @$pb.TagNumber(3)
  set starred($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStarred() => $_has(2);
  @$pb.TagNumber(3)
  void clearStarred() => clearField(3);
}

class StarResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StarResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  StarResponse._() : super();
  factory StarResponse() => create();
  factory StarResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StarResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StarResponse clone() => StarResponse()..mergeFromMessage(this);
  StarResponse copyWith(void Function(StarResponse) updates) => super.copyWith((message) => updates(message as StarResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StarResponse create() => StarResponse._();
  StarResponse createEmptyInstance() => create();
  static $pb.PbList<StarResponse> createRepeated() => $pb.PbList<StarResponse>();
  @$core.pragma('dart2js:noInline')
  static StarResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StarResponse>(create);
  static StarResponse _defaultInstance;
}

class MoveFileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MoveFileRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'id')
    ..aOS(3, 'path')
    ..hasRequiredFields = false
  ;

  MoveFileRequest._() : super();
  factory MoveFileRequest() => create();
  factory MoveFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MoveFileRequest clone() => MoveFileRequest()..mergeFromMessage(this);
  MoveFileRequest copyWith(void Function(MoveFileRequest) updates) => super.copyWith((message) => updates(message as MoveFileRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MoveFileRequest create() => MoveFileRequest._();
  MoveFileRequest createEmptyInstance() => create();
  static $pb.PbList<MoveFileRequest> createRepeated() => $pb.PbList<MoveFileRequest>();
  @$core.pragma('dart2js:noInline')
  static MoveFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveFileRequest>(create);
  static MoveFileRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);
}

class MoveFileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MoveFileResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MoveFileResponse._() : super();
  factory MoveFileResponse() => create();
  factory MoveFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MoveFileResponse clone() => MoveFileResponse()..mergeFromMessage(this);
  MoveFileResponse copyWith(void Function(MoveFileResponse) updates) => super.copyWith((message) => updates(message as MoveFileResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MoveFileResponse create() => MoveFileResponse._();
  MoveFileResponse createEmptyInstance() => create();
  static $pb.PbList<MoveFileResponse> createRepeated() => $pb.PbList<MoveFileResponse>();
  @$core.pragma('dart2js:noInline')
  static MoveFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveFileResponse>(create);
  static MoveFileResponse _defaultInstance;
}

class RenameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RenameRequest', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..aOS(1, 'token')
    ..aOS(2, 'id')
    ..aOS(3, 'name')
    ..hasRequiredFields = false
  ;

  RenameRequest._() : super();
  factory RenameRequest() => create();
  factory RenameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RenameRequest clone() => RenameRequest()..mergeFromMessage(this);
  RenameRequest copyWith(void Function(RenameRequest) updates) => super.copyWith((message) => updates(message as RenameRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RenameRequest create() => RenameRequest._();
  RenameRequest createEmptyInstance() => create();
  static $pb.PbList<RenameRequest> createRepeated() => $pb.PbList<RenameRequest>();
  @$core.pragma('dart2js:noInline')
  static RenameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameRequest>(create);
  static RenameRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class RenameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RenameResponse', package: const $pb.PackageName('com.uddernetworks.grpc'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RenameResponse._() : super();
  factory RenameResponse() => create();
  factory RenameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RenameResponse clone() => RenameResponse()..mergeFromMessage(this);
  RenameResponse copyWith(void Function(RenameResponse) updates) => super.copyWith((message) => updates(message as RenameResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RenameResponse create() => RenameResponse._();
  RenameResponse createEmptyInstance() => create();
  static $pb.PbList<RenameResponse> createRepeated() => $pb.PbList<RenameResponse>();
  @$core.pragma('dart2js:noInline')
  static RenameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameResponse>(create);
  static RenameResponse _defaultInstance;
}

