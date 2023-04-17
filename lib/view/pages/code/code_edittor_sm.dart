import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:blockchain/const/constant.dart';
import 'package:blockchain/view/components/common/upload_button.dart';
import 'package:flutter/material.dart';

class SmartContractListPage extends StatefulWidget {
  const SmartContractListPage({super.key});

  @override
  _SmartContractListPageState createState() => _SmartContractListPageState();
}

class _SmartContractListPageState extends State<SmartContractListPage> {
  List<dynamic> smartContracts = [];
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    // fetchSmartContracts();
  }

  // _openFileExplorer() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['js'],
  //   );
  //   print(result);
  //   if (result != null) {
  //     setState(() {
  //       _selectedFile = File(result.files.single.path!);
  //     });
  //   }
  // }
  void uploadFile() async {
    final input = FileUploadInputElement();
    input.accept = '.js'; // accept only .txt files
    input.click();

    // wait for user to select file
    await input.onChange.first;
    print(input.files!.first.name);
    print(input.files!.first.size);
    // print("${input.files!.first.relativePath} ${input.files!.first.type}");
    // print(input.files!);
    final selectedFile = input.files!.first;
  }

// This code creates a FileUploadInputElement and sets it to accept only .txt files. When the user selects a file, it creates a FormData object and appends the selected file to it using the appendBlob() method. It then sends the form data to the server using an HttpRequest object and waits for the response. The response can

  void _uploadToServer() async {
    if (_selectedFile == null) {
      return;
    }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$BASE_URL/deployChaincode'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        _selectedFile!.relativePath!,
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
    } else {
      print('Error uploading file');
    }
  }

  // Future<void> fetchSmartContracts() async {
  //   final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       smartContracts = jsonDecode(response.body);
  //     });
  //   } else {
  //     throw Exception('Failed to load smart contracts');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Text("Smart Contracts"),
        actions: [
          GradientButtonFb4(
            onPressed: () {
              uploadFile();
            },
            // _uploadFile();

            text: "Upload SMART CONTRACT",
          )
        ],
      ),
      body: ListView.builder(
        itemCount: smartContracts.length,
        itemBuilder: (context, index) {
          final smartContract = smartContracts[index];
          return ListTile(
            title: Text(smartContract['name']),
            subtitle: Text(smartContract['address']),
          );
        },
      ),
    );
  }
}
