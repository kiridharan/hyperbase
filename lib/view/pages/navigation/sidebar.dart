import 'package:blockchain/const/constant.dart';
import 'package:blockchain/view/pages/code/code_edittor_sm.dart';
import 'package:blockchain/view/pages/network/networks_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List _pages = [
    // const HomePage(),
    const NetworkPage(),
    const FileUpload(),
  ];

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HyperBASE'),
      //   automaticallyImplyLeading: false,
      // ),
      body: Row(
        children: [
          if (!isSmallScreen)
            SafeArea(
              child: NavigationRail(
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                    // html.window.history.pushState(
                    //     null, '', '/${_pages[index].runtimeType.toString()}');
                  });
                },
                leading: Column(
                  children: [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Text('hyperbase',
                        style: GoogleFonts.dancingScript(
                          fontSize: 38,
                          color: actionColor,
                        )),
                  ],
                ),
                destinations: const [
                  // NavigationRailDestination(
                  //   icon: FaIcon(
                  //     FontAwesomeIcons.table,
                  //     size: 20,
                  //   ),
                  //   label: Text('Dashboard'),
                  // ),
                  NavigationRailDestination(
                    icon: FaIcon(
                      FontAwesomeIcons.networkWired,
                      size: 20,
                    ),
                    label: Text('Network'),
                  ),
                  NavigationRailDestination(
                    icon: FaIcon(
                      FontAwesomeIcons.codeMerge,
                      size: 20,
                    ),
                    label: Text('Smart Contract'),
                  ),
                ],
                // backgroundColor
                trailing: Container(
                  width: 200,
                  height: 400,
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // create a container for show the usage of CPU and RAM

                      const Padding(
                        padding: EdgeInsets.only(right: 30, top: 20),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Github: "),
                          TextButton(
                              onPressed: () {
                                // CONVERT STRING TO URI

                                launchUrl(
                                    Uri.parse("https://github.com/kiridharan"));
                              },
                              child: const Text("LINK"))
                        ],
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.only(right: 30, top: 20),
                        child: Text(
                          "About Us",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Text(
                        """Group of 4 students from KCG College of Technology. Developing HyperBase for smart deployment with security and automation . 
                        \n * You could deploy a blockchain in minutes \n \n Developed by: A7 teams""",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      ),
                    ],
                  ),
                ),
                unselectedIconTheme: const IconThemeData(color: Colors.black),
                selectedIconTheme: const IconThemeData(color: primaryColor),
                elevation: 1,
                extended: true,
                indicatorColor: Colors.amberAccent,
                labelType: NavigationRailLabelType.none,
                selectedLabelTextStyle: const TextStyle(
                  color: primaryColor,
                ),
                selectedIndex: selectedIndex,
              ),
            ),
          Expanded(
            child: _pages[selectedIndex],
          )
        ],
      ),
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: primaryColor,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: const [
                // BottomNavigationBarItem(
                //   icon: FaIcon(
                //     FontAwesomeIcons.table,
                //     size: 20,
                //   ),
                //   label: 'Dashboard',
                // ),
                BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.networkWired,
                      size: 20,
                    ),
                    label: 'Network'),
                BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.codeMerge,
                      size: 20,
                    ),
                    label: 'Smart Contract'),
              ],
            )
          : null,
    );
  }
}
