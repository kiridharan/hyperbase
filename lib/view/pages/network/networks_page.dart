import 'dart:convert';
import 'package:blockchain/const/constant.dart';
import 'package:blockchain/model/network/cluster_details.dart';
import 'package:blockchain/view/components/network/create_card.dart';
import 'package:blockchain/view/components/network/network_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  late Future<ResponseData> futureResponseData;

  @override
  void initState() {
    super.initState();
    futureResponseData = fetchResponseData();
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                const Text(
                  'Network Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: CardFb1(
                              text: 'Create Default Network',
                              subtitle: 'Create a default network',
                              onPressed: () {
                                Navigator.pushNamed(context, "createNetwork");
                              },
                            ));
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.plus,
                      color: Colors.white, size: 16),
                  label: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Add New Network'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              width: double.infinity,

              child: FutureBuilder<ResponseData>(
                future: futureResponseData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final testNetworkItems = snapshot.data!.stdout.where(
                      (item) => item.namespace.contains('hyperbase'),
                    );

                    print(testNetworkItems);
                    return testNetworkItems.isEmpty || testNetworkItems.isEmpty
                        ? CardFb1(
                            text: "No network ..\n Create default Network",
                            subtitle: "This Node \n #3 ordered \n #3 org  ",
                            onPressed: () async {
                              final response = await http
                                  .get(Uri.parse('$BASE_URL/defaultNetwork'));
                            })
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: testNetworkItems.length,
                            itemBuilder: (context, index) {
                              return NetworkInfoCard(
                                name: testNetworkItems.elementAt(index).name,
                                status:
                                    testNetworkItems.elementAt(index).status,
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
}
