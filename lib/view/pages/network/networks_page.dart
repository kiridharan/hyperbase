import 'dart:convert';
import 'package:blockchain/const/constant.dart';
import 'package:blockchain/controller/login/auth_service.dart';
import 'package:blockchain/helper/filter.dart';
import 'package:blockchain/helper/local.dart';
import 'package:blockchain/model/network/cluster_details.dart';
import 'package:blockchain/view/components/network/create_card.dart';
import 'package:blockchain/view/components/network/network_info_card.dart';
import 'package:blockchain/view/pages/login/login_page.dart';
import 'package:blockchain/view/pages/network/choose_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  late Future<ResponseData> futureResponseData;
  LocalHelper localHelper = LocalHelper();
  AuthService authService = AuthService();
  Filter filter = Filter();
  String? org = "";
  String? namespace = "";
  bool? isNetwork = false;
  String ID = "";
  setquery() async {
    var str = await authService.queryUser("hyperbase_adhavan_5");
    print(str.keys.first);
    ID = str[str.keys.first];
    print("${ID}ID");
    localHelper.storeOrgNet("ID", ID);
    return str;
  }

  getOrg() async {
    org = await localHelper.getOrg();
    namespace = await localHelper.getNamespace();
    isNetwork = await localHelper.getIsNetwork();

    // print("org: $org");
    // print("namespace: $namespace");

    // print("isNetwork: $isNetwork");
  }

  @override
  void initState() {
    super.initState();
    setquery();
    futureResponseData = fetchResponseData();
    getOrg();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    'Network Information',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  isSmallScreen
                      ? IconButton(
                          onPressed: () {}, icon: const Icon(Icons.add))
                      : TextButton.icon(
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
                  IconButton(
                    onPressed: () {
                      // dialog for creating default network
                      setState(() {
                        print("logout");
                        localHelper.storeOrgNet("AccessToken", "");
                        localHelper.storeOrgNet("isLogin", "false");
                        localHelper.delKey("ID");
                        localHelper.delKey("ID");
                        Get.to(() => const LoginView());
                      });
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              width: double.infinity,

              child: FutureBuilder<ResponseData>(
                future: futureResponseData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final testNetworkItems = snapshot.data!.stdout;

                    Set set = {};
                    for (var element in testNetworkItems) {
                      set.add(element.namespace);
                    }
                    // print(set.length);
                    set.remove("ingress-nginx");
                    set.remove("kube-system");
                    set.remove("cert-manager");
                    set.remove("local-path-storage");

                    return set.isEmpty
                        ? CardFb1(
                            icon: Icons.add_circle_outline,
                            text: "No network ..\n Create default Network",
                            subtitle: "This Node \n #3 ordered \n #3 org  ",
                            onPressed: () async {
                              Get.to(() => const ChooseNetwork());
                            })
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: set.length,
                            itemBuilder: (context, index) {
                              // print(network);
                              return NetworkInfoCard(
                                // namespace: set.elementAt(index),
                                name: set.elementAt(index),
                                status: "Running",
                              );
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
              // CardFb1(
              //   text:
              //       'Create a new network \n With pre configured settings',
              //   subtitle: ' - 3 Ordered \n - 3 ORG  \n - 3 CA',
              //   onPressed: () {
              //     Navigator.pushNamed(context, "defaultNetwork");
              //   },
              // ),
            ),
          ],
        ),
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
  // @override
  // void dispose() {
  //   fetchResponseData();
  //   super.dispose();
  // }
}
