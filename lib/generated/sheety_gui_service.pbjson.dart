///
//  Generated code. Do not modify.
//  source: sheety_gui_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const SelectorRequest$json = const {
  '1': 'SelectorRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'multiSelect', '3': 2, '4': 1, '5': 8, '10': 'multiSelect'},
    const {'1': 'initialDirectory', '3': 3, '4': 1, '5': 9, '10': 'initialDirectory'},
    const {'1': 'mode', '3': 4, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.sheetyGui.SelectorRequest.SelectionMode', '10': 'mode'},
    const {'1': 'selectionMode', '3': 5, '4': 1, '5': 14, '6': '.com.uddernetworks.grpc.sheetyGui.SelectorRequest.FileSelection', '10': 'selectionMode'},
  ],
  '4': const [SelectorRequest_SelectionMode$json, SelectorRequest_FileSelection$json],
};

const SelectorRequest_SelectionMode$json = const {
  '1': 'SelectionMode',
  '2': const [
    const {'1': 'Open', '2': 0},
    const {'1': 'Save', '2': 1},
  ],
};

const SelectorRequest_FileSelection$json = const {
  '1': 'FileSelection',
  '2': const [
    const {'1': 'Files', '2': 0},
    const {'1': 'Directories', '2': 1},
    const {'1': 'All', '2': 2},
  ],
};

const SelectorResponse$json = const {
  '1': 'SelectorResponse',
  '2': const [
    const {'1': 'files', '3': 1, '4': 3, '5': 9, '10': 'files'},
    const {'1': 'cancelled', '3': 2, '4': 1, '5': 8, '10': 'cancelled'},
  ],
};

const ClipboardRequest$json = const {
  '1': 'ClipboardRequest',
};

const ClipboardResponse$json = const {
  '1': 'ClipboardResponse',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

