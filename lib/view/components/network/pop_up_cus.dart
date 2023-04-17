import 'package:blockchain/const/constant.dart';
import 'package:blockchain/helper/local.dart';
import 'package:blockchain/view/components/common/input_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopupDialog extends StatefulWidget {
  final Set<String> options;
  const PopupDialog({
    super.key,
    required this.options,
  });

  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  late String selectedValue;
  late TextEditingController textEditingController;
  LocalHelper localHelper = LocalHelper();
  // final Set<String> _options = {};
  String org = "";

  @override
  void initState() {
    super.initState();

    widget.options.add("Select");
    selectedValue = widget.options.first;
    textEditingController = TextEditingController();
    // _getData();
  }

  setorg(se) async {
    org = await localHelper.getOrgNet(se);
    print("org: $org");
    return org.toString();
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select an option'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedValue,
              items: widget.options
                  .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                  print(selectedValue);
                  org = setorg(selectedValue) as String;
                  print(org.toString());
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Enter Channel Name",
            ),
            EmailInputFb1(
              inputController: textEditingController,
              text: "Enter Channel Name",
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () async {
            print("$org $selectedValue ${textEditingController.text}");
            final response =
                await http.post(Uri.parse('$BASE_URL/createChannel'), body: {
              "ORG_CHANNEL": textEditingController.text,
              "ORG_NAME": org,
              "NAMESPACE": selectedValue,
            });

            print("response: ${response.statusCode}");
            print("response: ${response.body}");
            // print("response: ${response.r}")
            if (response.statusCode == 200) {
              print("channel created");
              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     title: const Text('Success'),
              //     content: const Text('Channel created successfully'),
              //     actions: <Widget>[
              //       TextButton(
              //         child: const Text('OK'),
              //         onPressed: () {
              //           Navigator.of(context).pop();
              //         },
              //       ),
              //     ],
              //   ),
              // );
              Navigator.of(context).pop();
            } else {
              print("org not created");
            }
          },
        ),
      ],
    );
  }
}
