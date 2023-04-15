import 'package:blockchain/const/constant.dart';
import 'package:blockchain/view/components/network/create_card.dart';
import 'package:blockchain/view/pages/network/create_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChooseNetwork extends StatefulWidget {
  const ChooseNetwork({super.key});

  @override
  State<ChooseNetwork> createState() => _ChooseNetworkState();
}

class _ChooseNetworkState extends State<ChooseNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          "Choose Network",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CardFb1(
                icon: Icons.add_circle_outline,
                text: "Create Custom network ",
                subtitle:
                    "This network will be created \n  with the help of the \n  configuration file with your input",
                onPressed: () {
                  Get.to(() => const CreateNode());
                },
              ),
              CardFb1(
                icon: Icons.curtains_closed,
                text: "Create default network ",
                subtitle:
                    "This network has preconfigured \n  node and peers containing \n 3 . peer \n 3 org  ",
                onPressed: () async {
                  final response =
                      await http.get(Uri.parse('$BASE_URL/defaultNetwork'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
