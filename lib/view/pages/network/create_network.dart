import 'package:blockchain/helper/local.dart';
import 'package:blockchain/view/components/common/input_field.dart';
import 'package:flutter/material.dart';

class CreateNode extends StatefulWidget {
  const CreateNode({Key? key}) : super(key: key);

  @override
  _CreateNodeState createState() => _CreateNodeState();
}

class _CreateNodeState extends State<CreateNode> {
  final _formKey = GlobalKey<FormState>();
  // SharedPreferences prefs = Get.find<SharedPreferences>();
  final TextEditingController _org = TextEditingController();
  LocalHelper localHelper = LocalHelper();
  final TextEditingController _namespace = TextEditingController();
  // final TextEditingController _channel = TextEditingController();
  // final TextEditingController _chaincodename = TextEditingController();
  // final TextEditingController _path = TextEditingController();

  // void createOrg() async {
  //   var res1 = http.get(Uri.parse("$BASE_URL/kindinit"));
  //   final response = await http.post(
  //     Uri.parse('$BASE_URL/createOrg'),
  //     body: {
  //       "ORG_NAME": "$_org.text",
  //       "NAMESPACE": "$_namespace.text",
  //     },
  //   );
  // }
  @override
  void initState() {
    super.initState();
    // createOrg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Create Network',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
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
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      if (mounted) {
                        setState(() {
                          localHelper.setAll(true, _org.text, _namespace.text);
                          print("org: ${_org.text}");
                        });
                      }

                      // Get.to((context) => const NetworkPage());
                      // if (response.statusCode == 200) {
                      //   Get.snackbar(
                      //     "Success",
                      //     "Network created successfully",
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     backgroundColor: Colors.green,
                      //     colorText: Colors.white,
                      //   );
                      // } else {
                      //   Get.snackbar(
                      //     "Error",
                      //     "Network creation failed",
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     backgroundColor: Colors.red,
                      //     colorText: Colors.white,
                      //   );
                    }

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text(' submitted successfully!'),
                    //   ),
                    // );
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
