// import 'package:flutter/material.dart';
// import 'package:code_editor/code_editor.dart';

// class CodeEdit extends StatelessWidget {
//   const CodeEdit({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // example of a easier way to write code instead of writing it in a single string
//     List<String> contentOfPage1 = [
//       "function helloWorld() {",
//       "  console.log('Hello World!');",
//       "}",
//       "",
//       "helloWorld();",
//     ];
//     List<String> contentOfPage2 = [
//       // Hello world in go
//       "package main",
//       "",
//       "import \"fmt\"",
//       "",
//       "func main() {",
//       "  fmt.Println(\"Hello World!\")",
//       "}",
//     ];

//     List<String> contentOfPage3 = [
//       // smart contracvt in solidity
//       "pragma solidity ^0.4.0;",
//       "",
//       "contract SimpleStorage {",
//       "  uint storedData;",
//       "",
//       "  function set(uint x) {",
//       "    storedData = x;",
//       "  }",
//       "",
//       "  function get() constant returns (uint) {",
//       "    return storedData;",
//       "  }",
//       "}",
//     ];

//     // The files displayed in the navigation bar of the editor.
//     // You are not limited.
//     // By default, [name] = "file.${language ?? 'txt'}", [language] = "text" and [code] = "",
//     List<FileEditor> files = [
//       FileEditor(
//         name: "page1.js",
//         language: "js",
//         code: contentOfPage1.join("\n"), // [code] needs a string
//       ),
//       FileEditor(
//         name: "sample.go",
//         language: "go",
//         code: contentOfPage2.join("\n"),
//       ),
//       FileEditor(
//         name: "sample.sol",
//         language: "solidity",
//         code: contentOfPage3.join("\n"),
//       ),
//     ];

//     // The model used by the CodeEditor widget, you need it in order to control it.
//     // But, since 1.0.0, the model is not required inside the CodeEditor Widget.
//     EditorModel model = EditorModel(
//       files: files, // the files created above
//       // you can customize the editor as you want
//       styleOptions: EditorModelStyleOptions(
//         // theme: EditorModelStyleOptionsTheme.dark,

//         heightOfContainer: MediaQuery.of(context).size.height / 1.5,
//         fontSize: 15,
//       ),
//     );

//     // A custom TextEditingController.
//     final myController = TextEditingController(text: 'hello!');

//     return Scaffold(
//       body: SingleChildScrollView(
//         // /!\ important because of the telephone keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
//         // display the CodeEditor widget
//         child: CodeEditor(
//           model: model, // the model created above, not required since 1.0.0
//           edit: true, // can edit the files? by default true
//           onSubmit: (String? language, String? value) {
//             // called when the user clicks on the "submit" button
//             print("language: $language");
//             print("value: $value");
//           },
//           disableNavigationbar:
//               false, // hide the navigation bar ? by default false
//           textEditingController:
//               myController, // Provide an optional, custom TextEditingController.
//         ),
//       ),
//     );
//   }
// }

import 'package:blockchain/view/components/common/upload_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SmartContractListPage extends StatefulWidget {
  const SmartContractListPage({super.key});

  @override
  _SmartContractListPageState createState() => _SmartContractListPageState();
}

class _SmartContractListPageState extends State<SmartContractListPage> {
  List<dynamic> smartContracts = [];

  @override
  void initState() {
    super.initState();
    fetchSmartContracts();
  }

  Future<void> fetchSmartContracts() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

    if (response.statusCode == 200) {
      setState(() {
        smartContracts = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load smart contracts');
    }
  }

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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const CodeEdit(),
              //   ),
              // );
            },
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
