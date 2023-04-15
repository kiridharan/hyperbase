import 'package:blockchain/view/components/common/input_field.dart';
import 'package:flutter/material.dart';

class CreateNode extends StatefulWidget {
  const CreateNode({Key? key}) : super(key: key);

  @override
  _CreateNodeState createState() => _CreateNodeState();
}

class _CreateNodeState extends State<CreateNode> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _org = TextEditingController();
  final TextEditingController _namespace = TextEditingController();
  final TextEditingController _channel = TextEditingController();
  final TextEditingController _chaincodename = TextEditingController();
  final TextEditingController _path = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmailInputFb1(
                text: "Org",
                inputController: _org,
              ),
              EmailInputFb1(
                text: "Namespace",
                inputController: _namespace,
              ),
              EmailInputFb1(
                text: "Channel",
                inputController: _channel,
              ),
              EmailInputFb1(
                text: "Chaincode Name",
                inputController: _chaincodename,
              ),
              EmailInputFb1(
                text: "Path",
                inputController: _path,
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // TODO: Perform form submission

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form submitted successfully!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
