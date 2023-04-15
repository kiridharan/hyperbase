import 'package:blockchain/const/constant.dart';
import 'package:flutter/material.dart';

class NetworkDetails extends StatefulWidget {
  const NetworkDetails({super.key});

  @override
  State<NetworkDetails> createState() => _NetworkDetailsState();
}

class _NetworkDetailsState extends State<NetworkDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: const Center(
        child: Text('Network Details'),
      ),
    );
  }
}
