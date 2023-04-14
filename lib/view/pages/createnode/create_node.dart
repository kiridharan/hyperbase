import 'package:blockchain/view/components/common/button.dart';
import 'package:blockchain/view/components/createnode/textinput_field.dart';
import 'package:flutter/material.dart';

class CreateNode extends StatefulWidget {
  const CreateNode({super.key});

  @override
  State<CreateNode> createState() => _CreateNodeState();
}

class _CreateNodeState extends State<CreateNode> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //  Radio input in a row with 2 radio buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Consenus Type',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Kafka',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                        const Text(
                          'Raft',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          value: 2,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              EmailInputFb(
                inputController: _controller,
                hintText: 'Name of Org',
                text: 'Org',
              ),

              // ROW which contains 2 text fields
              Row(
                children: [
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'CA Name',
                      text: 'CA Name',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'CA Password',
                      text: 'CA Password',
                    ),
                  ),
                ],
              ),
              EmailInputFb(
                inputController: _controller,
                hintText: 'Ordered Node',
                text: 'Ordered',
              ),
              //  2x2 input fields in a row
              Row(
                children: [
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'BAtch Tiimeout in Sec',
                      text: '2sec',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'Max Message Count',
                      text: '10',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'Absolute Max Bytes',
                      text: '99',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'Preferred Max Bytes',
                      text: '512',
                    ),
                  ),
                ],
              ),

              EmailInputFb(
                inputController: _controller,
                hintText: 'Channel Name',
                text: 'sample channel',
              ),

              // create roadio button to select cloud provides with logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cloud Provider',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'AWS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                        const Text(
                          'GCP',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          value: 2,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                        const Text(
                          'Azure',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio(
                          value: 3,
                          groupValue: 1,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // 2x2 input fields in a row for getting cloud provide loaction , resource group and storage account
              Row(
                children: [
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'Location',
                      text: 'Location',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: EmailInputFb(
                      inputController: _controller,
                      hintText: 'Resource Group',
                      text: 'Resource Group',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GradientButtonFb(
                onPressed: () {},
                text: 'Create Node',
              )
            ],
          ),
        ),
      )),
    );
  }
}
