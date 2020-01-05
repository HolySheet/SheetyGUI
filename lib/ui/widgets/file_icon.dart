import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/list_response.dart';

class FileIcon extends StatefulWidget {
  final bool selected;
  final ListItem listItem;
  final Function(BuildContext, ListItem) onTap;

  FileIcon({Key key, this.selected, this.listItem, this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => FileIconState(listItem, onTap);
}

class FileIconState extends State<FileIcon> {
  final ListItem listItem;
  final Function(BuildContext, ListItem) onTap;

  FileIconState(this.listItem, this.onTap);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onTap?.call(context, listItem),
        child: Card(
          elevation: widget.selected ? 10 : 5,
          shape: RoundedRectangleBorder(
              side: widget.selected
                  ? BorderSide(color: Colors.blue)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(4)),
          margin: EdgeInsets.all(10),
          child: SizedBox(
            width: 125,
            height: 125,
            child: Stack(
              children: [
                if (!listItem.selfOwned)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(85, 75, 25, 0),
                    child: Icon(
                      Icons.group,
                      size: 25,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.network(
                      ExtensionPreview.getPreviewFromExtension(listItem.name
                          .substring(listItem.name.indexOf('.') + 1,
                              listItem.name.length)),
                    width: 64,
                    height: 64,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: SizedBox(
                    width: 125,
                    height: 35,
                    child: Text(listItem.name, textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class ExtensionPreview {
  static const audio = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/audio', [
    '3gp',
    'aa',
    'aac',
    'aax',
    'act',
    'aiff',
    'alac',
    'amr',
    'ape',
    'au',
    'awb',
    'dct',
    'dss',
    'dvf',
    'flac',
    'gsm',
    'iklax',
    'ivs',
    'm4a',
    'm4b',
    'm4p',
    'mmf',
    'mp3',
    'mpc',
    'msv',
    'nmf',
    'nsf',
    'ogg,','oga,','mogg',
    'opus',
    'ra', 'rm',
    'ra',
    'raw',
    'sln',
    'tta',
    'voc',
    'vox',
    'wav',
    'wma',
    'wv',
    'webm',
    '8svx'
  ]);
  static const document = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/application/vnd.google-apps.document',
      ['txt', 'rtf', 'log', 'doc', 'docx', 'pdf']);

  static const image = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/image', [
    'jpeg',
    'jpg',
    'jiff',
    'tiff',
    'gif',
    'bmp',
    'png',
    'ppm',
    'pgm',
    'pbm',
    'pnm',
    'webp',
    'ecw',
    'fits',
    'flif',
    'ico',
    'ilbm',
    'img',
    'nrrd',
    'pam',
    'pcx',
    'pgf',
    'plbm',
    'sgi',
    'sid',
    'tga',
    'xisf',
    'svg',
    'ai',
    'gcm'
  ]);
  static const presentation = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/application/vnd.google-apps.presentation',
      [
        'ppt',
        'pptx',
        'pptm',
        'potx',
        'potm',
        'pot',
        'ppsx',
        'ppsm',
        'pps',
        'ppam',
        'ppa'
      ]);

//  static const script = FileIcon('script', []);
//  static const site = FileIcon('site', []);
  static const spreadsheet = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/application/vnd.google-apps.spreadsheet',
      [
        'csv',
        'tsv',
        'xls',
        'dif',
        'ods',
        'ots',
        'xlm',
        'xlsb',
        'xlsm',
        'xlsx',
        'xlt',
        'xltm',
        'xlts'
      ]);
  static const video = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/application/vnd.google-apps.video',
      ['avi', 'flv', 'wmv', 'mov', 'mp4']);
  static const pdf = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/128/type/application/pdf',
      ['pdf']);
  static const zip = ExtensionPreview(
      'https://ssl.gstatic.com/docs/doclist/images/mediatype/icon_2_archive_x64.png',
      ['zip']);

  static const file = ExtensionPreview(
      'https://drive-thirdparty.googleusercontent.com/64/type/');

  static const List<ExtensionPreview> values = const [
    audio,
    document,
    image,
    presentation,
    spreadsheet,
    video,
    pdf,
    zip
  ];

  final String url;
  final List<String> extensions;

  const ExtensionPreview(this.url, [this.extensions = const []]);

  static String getPreviewFromExtension(String extension) => values
      .firstWhere((icon) => icon.extensions.contains(extension),
          orElse: () => file)
      .url;
}
