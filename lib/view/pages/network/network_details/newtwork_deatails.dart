import 'package:blockchain/helper/check_cluster.dart';
import 'package:blockchain/helper/filter.dart';
import 'package:blockchain/helper/local.dart';
import 'package:blockchain/view/components/network/create_card.dart';
import 'package:blockchain/view/components/network/list_view_custom.dart';
import 'package:blockchain/view/components/network/pop_up_cus.dart';
import 'package:blockchain/view/pages/network/choose_network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
  bool isSmallScreen = false;
  bool isNetwork = false;
  final Set<String> _options = {};
  Filter filter = Filter();
  String org = "";
  CheckCluster checkCluster = CheckCluster();
  String query = "";
  void _getData() async {
    ResponseData responseData = await futureResponseData;
    for (var element in responseData.stdout) {
      _options.add(element.namespace);
    }
    print(_options);
    _options.remove("ingress-nginx");
    _options.remove("kube-system");
    _options.remove("cert-manager");
    _options.remove("local-path-storage");
    print(_options);
  }

  @override
  void initState() {
    super.initState();
    LocalHelper localHelper = LocalHelper();
    localHelper.getOrg().then((value) {
      org = value;
      query = "org";
      print("qq  $query");
    });
    futureResponseData = checkCluster.fetchResponseData();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: [
            isSmallScreen
                ? IconButton(
                    onPressed: () {
                      // dialog for creating default network
                      Get.to(() => const ChooseNetwork());
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(10),
                    child: TextButton.icon(
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
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 30,
              runSpacing: 30,
              children: [
                CardFb1(
                  text: "Peer",
                  icon: Icons.wifi_channel_sharp,
                  subtitle: "Channel list",
                  onPressed: () {
                    setState(() {
                      query = "peer";
                      print("$query  peer");
                    });
                  },
                ),
                CardFb1(
                  text: "Smart Contract \n Orderer",
                  icon: Icons.code,
                  subtitle: "Smart contract list",
                  onPressed: () {
                    setState(() {
                      query = "orderer";
                    });
                  },
                ),
                CardFb1(
                  text: "Certificate Authority",
                  icon: Icons.wifi_channel_sharp,
                  subtitle: "CA list",
                  onPressed: () {
                    setState(() {
                      query = "-ca";
                    });
                  },
                ),
                CardFb1(
                  text: "Channel",
                  icon: Icons.wifi_channel_sharp,
                  subtitle: "Channel list",
                  onPressed: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          print(_options);
                          return PopupDialog(
                            options: _options,
                          );
                        },
                      );
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
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const ListViewCustom(
              widget: Text("Action"),
              name: "Name",
              namespace: "Namespace",
              status: "Status",
              actionColor: Colors.white,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.34,
              child: FutureBuilder<ResponseData>(
                future: futureResponseData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var orgfiler = snapshot.data!.stdout.where(
                      (item) => item.namespace.contains(org),
                    );
                    // print(orgfiler.length);
                    // print("org $org");
                    var testNetworkItems = orgfiler.where(
                      (item) => item.name.contains(query),
                    );

                    // print("${testNetworkItems.length} testlenght");
                    // for (var element in testNetworkItems) {
                    //   print(element.name);
                    // }
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
                                  namespace: testNetworkItems
                                      .elementAt(index)
                                      .namespace,
                                  status:
                                      testNetworkItems.elementAt(index).status,
                                  actionColor: Colors.white,
                                  widget: IconButton(
                                    onPressed: () {
                                      // dialog for creating default network
                                      // Get.to(() => const ChooseNetwork());
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ));
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
      ),
    );
  }

  // Future<ResponseData> fetchResponseData() async {
  //   final response = await http.get(Uri.parse('$BASE_URL/check_cluster'));

  //   if (response.statusCode == 200) {
  //     // print(ResponseData.fromJson(jsonDecode(response.body)));
  //     // var data = ResponseData.fromJs on(jsonDecode(response.body));
  //     // print(data.stdout[5].name);
  //     return ResponseData.fromJson(jsonDecode(response.body));
  //   } else {
  //     print(response.body);
  //     throw Exception('Failed to load response data');
  //   }
  // }
}
