import 'package:blockchain/const/constant.dart';
import 'package:blockchain/view/components/home/container_card.dart';
import 'package:blockchain/view/pages/individualnode/individual_node.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String imageURL = "assets/images/node.png";
  final _nodeData = [
    {
      "project_name": "KCG College",
      "node_status": "Active",
    },
    {
      "project_name": "Staff Project",
      "node_status": "Active",
    },
    {
      "project_name": "Student Data",
      "node_status": "Stopped",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final isSmallScreen = MediaQuery.of(context).size.width < 600;
    // final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: ,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          // title: const Text("HyperBASE"),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const IndividualNode());
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 20,
                    runSpacing: 30,
                    children: [
                      ViewCards(
                        text: 2.toString(),
                        imageUrl: imageURL,
                        subtitle: "PROJECT",
                        onPressed: () {
                          // print("Network");
                        },
                      ),

                      ViewCards(
                        text: 3.toString(),
                        imageUrl: imageURL,
                        subtitle: "NETWORKS",
                        onPressed: () {
                          // print("Network");
                        },
                      ),

                      ViewCards(
                        text: 12.toString(),
                        imageUrl: imageURL,
                        subtitle: "NODES",
                        onPressed: () {
                          // print("Network");
                        },
                      ),

                      ViewCards(
                        text: 1.toString(),
                        imageUrl: imageURL,
                        subtitle: "CLOUDS",
                        onPressed: () {
                          // print("Network");
                        },
                      ),
                      // const NetworkCard()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: actionColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ListView for showing all running nodes
                    child: ListView.builder(
                        itemCount: _nodeData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Get.to(() => const IndividualNode());
                            },
                            leading: Icon(
                              _nodeData[index]["node_status"] == "Active"
                                  ? Icons.circle
                                  : Icons.rectangle,
                              color: _nodeData[index]["node_status"] == "Active"
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            title: Text(
                                _nodeData[index]["project_name"] as String),
                            subtitle:
                                Text(_nodeData[index]["node_status"] as String),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
