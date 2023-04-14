import 'package:blockchain/view/components/common/card_icon.dart';
import 'package:blockchain/view/pages/code/code_edittor_sm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualNode extends StatefulWidget {
  const IndividualNode({super.key});

  @override
  State<IndividualNode> createState() => _IndividualNodeState();
}

class _IndividualNodeState extends State<IndividualNode> {
  final _peers = [
    {
      "project_name": "Peer 1",
      "node_status": "Active",
    },
    {
      "project_name": "Peer 2",
      "node_status": "Active",
    },
    {
      "project_name": "peer 3",
      "node_status": "Stopped",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              CategoryCardMallika1(
                title: "Code Edit",
                image: "https://static.thenounproject.com/png/37814-200.png",
                // image: "null",
                onTap: () {
                  Get.to(() => const CodeEdit());
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Organisation:"),
                  Text(
                    "KCG College of Technology",
                    style: TextStyle(
                      color: Color(0xffFF8527),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // List view builder to show the list of nodes with icon to stop and start the node

          const Text(
            "List of Peer Nodes",
            style: TextStyle(
              color: Color(0xffFF8527),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width - 20,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  // leading: const Icon(Icons.ac_unit),
                  title: Text(_peers[index]["project_name"].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},

                        // icon: const Icon(Icons.play_arrow),
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
