// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blockchain/helper/local.dart';
import 'package:blockchain/view/pages/network/network_details/newtwork_deatails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkInfoCard extends StatefulWidget {
  final String name;
  final String status;

  const NetworkInfoCard({
    Key? key,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  State<NetworkInfoCard> createState() => _NetworkInfoCardState();
}

class _NetworkInfoCardState extends State<NetworkInfoCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LocalHelper localHelper = LocalHelper();
        localHelper.setAll(true, widget.name, widget.name);
        // Navigator.pushNamed(context, "individualNetwork");
        Get.to(() => const NetworkDetails());
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height * 0.1,
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
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Text(
                widget.name.substring(0, 1),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            Text(
              widget.name.length > 15
                  ? widget.name
                      .substring(0, widget.name.length - 17)
                      .replaceAll("-", " ")
                  : widget.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.status,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
