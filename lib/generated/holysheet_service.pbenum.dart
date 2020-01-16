///
//  Generated code. Do not modify.
//  source: holysheet_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UploadRequest_Upload extends $pb.ProtobufEnum {
  static const UploadRequest_Upload MULTIPART = UploadRequest_Upload._(0, 'MULTIPART');
  static const UploadRequest_Upload DIRECT = UploadRequest_Upload._(1, 'DIRECT');

  static const $core.List<UploadRequest_Upload> values = <UploadRequest_Upload> [
    MULTIPART,
    DIRECT,
  ];

  static final $core.Map<$core.int, UploadRequest_Upload> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UploadRequest_Upload valueOf($core.int value) => _byValue[value];

  const UploadRequest_Upload._($core.int v, $core.String n) : super(v, n);
}

class UploadRequest_Compression extends $pb.ProtobufEnum {
  static const UploadRequest_Compression NONE = UploadRequest_Compression._(0, 'NONE');
  static const UploadRequest_Compression ZIP = UploadRequest_Compression._(1, 'ZIP');

  static const $core.List<UploadRequest_Compression> values = <UploadRequest_Compression> [
    NONE,
    ZIP,
  ];

  static final $core.Map<$core.int, UploadRequest_Compression> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UploadRequest_Compression valueOf($core.int value) => _byValue[value];

  const UploadRequest_Compression._($core.int v, $core.String n) : super(v, n);
}

class UploadResponse_UploadStatus extends $pb.ProtobufEnum {
  static const UploadResponse_UploadStatus PENDING = UploadResponse_UploadStatus._(0, 'PENDING');
  static const UploadResponse_UploadStatus UPLOADING = UploadResponse_UploadStatus._(1, 'UPLOADING');
  static const UploadResponse_UploadStatus COMPLETE = UploadResponse_UploadStatus._(2, 'COMPLETE');

  static const $core.List<UploadResponse_UploadStatus> values = <UploadResponse_UploadStatus> [
    PENDING,
    UPLOADING,
    COMPLETE,
  ];

  static final $core.Map<$core.int, UploadResponse_UploadStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UploadResponse_UploadStatus valueOf($core.int value) => _byValue[value];

  const UploadResponse_UploadStatus._($core.int v, $core.String n) : super(v, n);
}

class DownloadResponse_DownloadStatus extends $pb.ProtobufEnum {
  static const DownloadResponse_DownloadStatus PENDING = DownloadResponse_DownloadStatus._(0, 'PENDING');
  static const DownloadResponse_DownloadStatus DOWNLOADING = DownloadResponse_DownloadStatus._(1, 'DOWNLOADING');
  static const DownloadResponse_DownloadStatus COMPLETE = DownloadResponse_DownloadStatus._(2, 'COMPLETE');

  static const $core.List<DownloadResponse_DownloadStatus> values = <DownloadResponse_DownloadStatus> [
    PENDING,
    DOWNLOADING,
    COMPLETE,
  ];

  static final $core.Map<$core.int, DownloadResponse_DownloadStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DownloadResponse_DownloadStatus valueOf($core.int value) => _byValue[value];

  const DownloadResponse_DownloadStatus._($core.int v, $core.String n) : super(v, n);
}

class RemoveResponse_RemoveStatus extends $pb.ProtobufEnum {
  static const RemoveResponse_RemoveStatus PENDING = RemoveResponse_RemoveStatus._(0, 'PENDING');
  static const RemoveResponse_RemoveStatus REMOVING = RemoveResponse_RemoveStatus._(1, 'REMOVING');
  static const RemoveResponse_RemoveStatus COMPLETE = RemoveResponse_RemoveStatus._(2, 'COMPLETE');

  static const $core.List<RemoveResponse_RemoveStatus> values = <RemoveResponse_RemoveStatus> [
    PENDING,
    REMOVING,
    COMPLETE,
  ];

  static final $core.Map<$core.int, RemoveResponse_RemoveStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RemoveResponse_RemoveStatus valueOf($core.int value) => _byValue[value];

  const RemoveResponse_RemoveStatus._($core.int v, $core.String n) : super(v, n);
}

