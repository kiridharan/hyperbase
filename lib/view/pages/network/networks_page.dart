import 'package:blockchain/const/constant.dart';
import 'package:blockchain/view/components/network/create_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Navigator.pushNamed(context, "createNetwork");
                },
                icon: const FaIcon(FontAwesomeIcons.plus,
                    color: Colors.white, size: 16),
                label: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add Network'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 20,
            children: [
              Container(
                width: 250,
                height: 230,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.5),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(10, 20),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: Colors.grey.withOpacity(.05)),
                  ],
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Text(
                        "K",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "KCG COllege Network",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Nothing running",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              CardFb1(
                text: 'Create a new network \n With pre configured settings',
                subtitle: ' - 3 Ordered \n - 3 ORG  \n - 3 CA',
                onPressed: () {
                  Navigator.pushNamed(context, "defaultNetwork");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
