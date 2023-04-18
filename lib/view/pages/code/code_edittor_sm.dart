import 'dart:async';
import 'package:blockchain/const/constant.dart';
import 'package:blockchain/view/components/createnode/textinput_field.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  String? _fileName;
  String? _path;
  late final String _extension = 'js';
  bool _loadingPath = false;
  bool _loadingFile = false;

  smd(org, net, channel, chaincode) async {
    final request = http.post(
      Uri.parse('$BASE_URL/deployChaincode'),
      body: {
        "ORG_NAME": org,
        "NAMESPACE": net,
        "ORG_CHANNEL": channel,
        "CHAINCODE_NAME": chaincode,
        // "PATH_TO_CHAINCODE":""
      },
    );

// Add string fields to the request body
  }

  Future<void> _getPath() async {
    setState(() => _loadingPath = true);
    try {
      _path = null;
      _path = (await getApplicationDocumentsDirectory()).path;
    } on Exception catch (e) {
      print('Error: $e');
    }
    setState(() => _loadingPath = false);
  }

  Future<void> _getFile() async {
    setState(() => _loadingFile = true);
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [_extension],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        _fileName = file.name;
        _path = file.path;
      } else {
        // User canceled the picker
        _fileName = null;
        _path = null;
      }
    } on Exception catch (e) {
      print('Error: $e');
    }
    setState(() => _loadingFile = !_loadingFile);
  }

  Future<void> _uploadFile() async {
    setState(() => _loadingFile = true);
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://example.com/upload'),
      );
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        _path!,
      ));
      var response = await request.send();
      if (response.statusCode == 200) {
        print('File uploaded');
      } else {
        print('Error uploading file');
      }
    } on Exception catch (e) {
      print('Error: $e');
    }
    setState(() => _loadingFile = false);
  }

  TextEditingController inputController = TextEditingController();
  TextEditingController inputController1 = TextEditingController();
  TextEditingController inputController2 = TextEditingController();
  TextEditingController inputController3 = TextEditingController();
  @override
  void initState() {
    inputController = TextEditingController();
    inputController1 = TextEditingController();
    inputController2 = TextEditingController();
    inputController3 = TextEditingController();
    super.initState();
    _getPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('File Upload'),
      ),
      body: Column(
        children: [
          EmailInputFb(
              inputController: inputController,
              hintText: "enter net",
              text: "enter net"),
          EmailInputFb(
              inputController: inputController1,
              hintText: "enter channel",
              text: "enter channel"),
          EmailInputFb(
              inputController: inputController2,
              hintText: "enter sm",
              text: "enter sm"),
          EmailInputFb(
            inputController: inputController3,
            hintText: "enter org",
            text: "enter org",
          ),
          Text('Selected file: ${_fileName ?? "None"}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _getPath();
              smd(
                inputController3.text,
                inputController.text,
                inputController1.text,
                inputController2.text,
              );
            },
            child: _loadingPath
                ? const CircularProgressIndicator()
                : const Text('Upload File'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadingFile ? null : _getFile,
            child: Text('Select ${_extension.toUpperCase()} File'),
          ),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.green,
          //   ),
          //   onPressed: (_path != null && !_loadingFile) ? _uploadFile : null,
          //   child: const Text('Upload File'),
          // ),
        ],
      ),
    );
  }
}
