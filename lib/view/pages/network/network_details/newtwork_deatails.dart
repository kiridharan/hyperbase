import 'dart:convert';
import 'package:blockchain/helper/filter.dart';
import 'package:blockchain/helper/local.dart';
import 'package:blockchain/view/components/network/create_card.dart';
import 'package:blockchain/view/components/network/list_view_custom.dart';
import 'package:blockchain/view/pages/network/choose_network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:blockchain/const/constant.dart';
import 'package:blockchain/model/network/cluster_details.dart';
import 'package:flutter/material.dart';

class NetworkDetails extends StatefulWidget {
  const NetworkDetails({super.key});

  @override
  State<NetworkDetails> createState() => _NetworkDetailsState();
}

class _NetworkDetailsState extends State<NetworkDetails> {
  late Future<ResponseData> futureResponseData;
  bool isNetwork = false;
  Filter filter = Filter();
  String org = "";
  String query = "";
  @override
  void initState() {
    super.initState();
    LocalHelper localHelper = LocalHelper();
    localHelper.getOrg().then((value) {
      org = value;
      query = org;
    });
    futureResponseData = fetchResponseData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                // dialog for creating default network
                Get.to(() => const ChooseNetwork());
              },
              icon: const FaIcon(FontAwesomeIcons.plus,
                  color: Colors.white, size: 16),
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Add New Network'),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          title: const Text(
            'Network Details',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: primaryColor,
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 30,
            children: [
              CardFb1(
                text: "Channel",
                icon: Icons.wifi_channel_sharp,
                subtitle: "Channel list",
                onPressed: () {
                  setState(() {
                    query = "channels";
                  });
                },
              ),
              CardFb1(
                text: "Smart Contract",
                icon: Icons.code,
                subtitle: "Smart contract list",
                onPressed: () {
                  setState(() {
                    query = "chaincodes";
                  });
                },
              ),
              CardFb1(
                text: "Certificate Authority",
                icon: Icons.wifi_channel_sharp,
                subtitle: "Channel list",
                onPressed: () {
                  setState(() {
                    query = "-ca";
                  });
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Network List",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const ListViewCustom(
            name: "Name",
            namespace: "Namespace",
            status: "Status",
            actionColor: Colors.white,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.1,
            child: FutureBuilder<ResponseData>(
              future: futureResponseData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var orgfiler = snapshot.data!.stdout.where(
                    (item) => item.namespace.contains(org),
                  );
                  var testNetworkItems = orgfiler.where(
                    (item) => item.name.contains(query),
                  );
                  return testNetworkItems.isEmpty
                      ? SizedBox(
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 200,

                          child: CardFb1(
                              icon: Icons.add_circle_outline,
                              text: "No $query found",
                              subtitle: "Create a new network",
                              onPressed: () async {}),
                        )
                      : ListView.builder(
                          itemCount: testNetworkItems.length,
                          itemBuilder: (context, index) {
                            // print(network);
                            return ListViewCustom(
                                name: testNetworkItems.elementAt(index).name,
                                namespace:
                                    testNetworkItems.elementAt(index).namespace,
                                status:
                                    testNetworkItems.elementAt(index).status,
                                actionColor: Colors.white);
                          },
                        );
                } else if (snapshot.hasData) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return const Center(
                  child: SpinKitSpinningLines(
                    color: primaryColor,
                    size: 50.0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<ResponseData> fetchResponseData() async {
    final response = await http.get(Uri.parse('$BASE_URL/check_cluster'));

    if (response.statusCode == 200) {
      return ResponseData.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load response data');
    }
  }
}
