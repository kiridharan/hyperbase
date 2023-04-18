import 'package:blockchain/view/components/common/button.dart';
import 'package:blockchain/view/components/common/card_icon.dart';
import 'package:blockchain/view/pages/code/code_edittor_sm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelCreation extends StatefulWidget {
  const ChannelCreation({super.key});

  @override
  State<ChannelCreation> createState() => _ChannelCreationState();
}

class _ChannelCreationState extends State<ChannelCreation> {
  final List<String> _texts = [
    "Peer 1",
    "Peer 2",
    "Peer 3",
    "Peer 4",
    "Peer 5",
  ];
  bool visible = false;
  List<bool> _isChecked = [];
  final List<String> _projects = [
    "Staff",
    "Students",
    "Parents",
  ];

  String _project = "Staff";
  // function to set visible to true if list is not empty
  bool _setVisiblity() {
    if (_isChecked.contains(true)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _setVisiblity();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // create widget for  a dropdown `channel type` with options `public` and `private`
              SizedBox(
                height: height / 3,
                width: width,
                child: ListView.builder(
                  itemCount: _texts.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(_texts[index]),
                      value: _isChecked[index],
                      onChanged: (val) {
                        setState(
                          () {
                            _isChecked[index] = val!;
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              // select project name from drop down
              Wrap(
                alignment: WrapAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                //  S direction: Axis.vertical,

                // crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  const Text("Select Project Name: "),
                  SizedBox(
                    height: height / 3,
                    width: width / 3.5,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _project,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          // print(newValue);
                          _project = newValue!;
                        });
                      },
                      items: _projects
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const Text("Deploy Smart Contract: "),
                  CategoryCardMallika1(
                    title: "Deploy",
                    image:
                        "https://static.thenounproject.com/png/37814-200.png",
                    onTap: () {
                      Get.to(() => const FileUpload());
                    },
                    selected: false,
                  ),
                ],
              ),

              Visibility(
                visible: _setVisiblity(),
                child: GradientButtonFb(
                  text: "Create Channel",
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
