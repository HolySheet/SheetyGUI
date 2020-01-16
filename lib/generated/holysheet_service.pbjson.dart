///
//  Generated code. Do not modify.
//  source: holysheet_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ListItem$json = const {
  '1': 'ListItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sheets', '3': 3, '4': 1, '5': 5, '10': 'sheets'},
    const {'1': 'size', '3': 4, '4': 1, '5': 3, '10': 'size'},
    const {'1': 'date', '3': 5, '4': 1, '5': 3, '10': 'date'},
    const {'1': 'selfOwned', '3': 6, '4': 1, '5': 8, '10': 'selfOwned'},
    const {'1': 'owner', '3': 7, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'driveLink', '3': 8, '4': 1, '5': 9, '10': 'driveLink'},
  ],
};

const SerializedVariable$json = const {
  '1': 'SerializedVariable',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'object', '3': 3, '4': 1, '5': 9, '10': 'object'},
  ],
};

const ListRequest$json = const {
  '1': 'ListRequest',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

const ListResponse$json = const {
  '1': 'ListResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.uddernetworks.grpc.ListItem', '10': 'items'},
  ],
};

const UploadRequest$json = const {
  '1': 'UploadRequest',
  '2': const [
    const {'1': 'file', '3': 1, '4': 1, '5': 9, '10': 'file'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'upload', '3': 3, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.UploadRequest.Upload', '10': 'upload'},
    const {'1': 'compression', '3': 4, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.UploadRequest.Compression', '10': 'compression'},
    const {'1': 'sheetSize', '3': 5, '4': 1, '5': 3, '10': 'sheetSize'},
  ],
  '4': const [UploadRequest_Upload$json, UploadRequest_Compression$json],
};

const UploadRequest_Upload$json = const {
  '1': 'Upload',
  '2': const [
    const {'1': 'MULTIPART', '2': 0},
    const {'1': 'DIRECT', '2': 1},
  ],
};

const UploadRequest_Compression$json = const {
  '1': 'Compression',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'ZIP', '2': 1},
  ],
};

const UploadResponse$json = const {
  '1': 'UploadResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.UploadResponse.UploadStatus', '10': 'status'},
    const {'1': 'percentage', '3': 2, '4': 1, '5': 1, '10': 'percentage'},
    const {'1': 'item', '3': 3, '4': 1, '5': 11, '6': '.com.uddernetworks.grpc.ListItem', '10': 'item'},
  ],
  '4': const [UploadResponse_UploadStatus$json],
};

const UploadResponse_UploadStatus$json = const {
  '1': 'UploadStatus',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'UPLOADING', '2': 1},
    const {'1': 'COMPLETE', '2': 2},
  ],
};

const DownloadRequest$json = const {
  '1': 'DownloadRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
  ],
};

const DownloadResponse$json = const {
  '1': 'DownloadResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.DownloadResponse.DownloadStatus', '10': 'status'},
    const {'1': 'percentage', '3': 2, '4': 1, '5': 1, '10': 'percentage'},
  ],
  '4': const [DownloadResponse_DownloadStatus$json],
};

const DownloadResponse_DownloadStatus$json = const {
  '1': 'DownloadStatus',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'DOWNLOADING', '2': 1},
    const {'1': 'COMPLETE', '2': 2},
  ],
};

const RemoveRequest$json = const {
  '1': 'RemoveRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const RemoveResponse$json = const {
  '1': 'RemoveResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.RemoveResponse.RemoveStatus', '10': 'status'},
    const {'1': 'percentage', '3': 2, '4': 1, '5': 1, '10': 'percentage'},
  ],
  '4': const [RemoveResponse_RemoveStatus$json],
};

const RemoveResponse_RemoveStatus$json = const {
  '1': 'RemoveStatus',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'REMOVING', '2': 1},
    const {'1': 'COMPLETE', '2': 2},
  ],
};

const CodeExecutionRequest$json = const {
  '1': 'CodeExecutionRequest',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'returnVariables', '3': 2, '4': 3, '5': 9, '10': 'returnVariables'},
  ],
};

const CodeExecutionResponse$json = const {
  '1': 'CodeExecutionResponse',
  '2': const [
    const {'1': 'snippetResult', '3': 2, '4': 3, '5': 9, '10': 'snippetResult'},
    const {'1': 'variables', '3': 3, '4': 3, '5': 11, '6': '.com.uddernetworks.grpc.SerializedVariable', '10': 'variables'},
  ],
};

const CodeExecutionCallbackResponse$json = const {
  '1': 'CodeExecutionCallbackResponse',
  '2': const [
    const {'1': 'callbackState', '3': 1, '4': 1, '5': 9, '10': 'callbackState'},
    const {'1': 'snippetResult', '3': 2, '4': 3, '5': 9, '10': 'snippetResult'},
    const {'1': 'variables', '3': 3, '4': 3, '5': 11, '6': '.com.uddernetworks.grpc.SerializedVariable', '10': 'variables'},
  ],
};

const ListenCallbacksRequest$json = const {
  '1': 'ListenCallbacksRequest',
};

