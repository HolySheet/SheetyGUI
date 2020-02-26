///
//  Generated code. Do not modify.
//  source: sheety_gui_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SelectorRequest_SelectionMode extends $pb.ProtobufEnum {
  static const SelectorRequest_SelectionMode Open = SelectorRequest_SelectionMode._(0, 'Open');
  static const SelectorRequest_SelectionMode Save = SelectorRequest_SelectionMode._(1, 'Save');

  static const $core.List<SelectorRequest_SelectionMode> values = <SelectorRequest_SelectionMode> [
    Open,
    Save,
  ];

  static final $core.Map<$core.int, SelectorRequest_SelectionMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SelectorRequest_SelectionMode valueOf($core.int value) => _byValue[value];

  const SelectorRequest_SelectionMode._($core.int v, $core.String n) : super(v, n);
}

class SelectorRequest_FileSelection extends $pb.ProtobufEnum {
  static const SelectorRequest_FileSelection Files = SelectorRequest_FileSelection._(0, 'Files');
  static const SelectorRequest_FileSelection Directories = SelectorRequest_FileSelection._(1, 'Directories');
  static const SelectorRequest_FileSelection All = SelectorRequest_FileSelection._(2, 'All');

  static const $core.List<SelectorRequest_FileSelection> values = <SelectorRequest_FileSelection> [
    Files,
    Directories,
    All,
  ];

  static final $core.Map<$core.int, SelectorRequest_FileSelection> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SelectorRequest_FileSelection valueOf($core.int value) => _byValue[value];

  const SelectorRequest_FileSelection._($core.int v, $core.String n) : super(v, n);
}

