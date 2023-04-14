import 'package:blockchain/const/constant.dart';
import 'package:flutter/material.dart';

class CreateNode extends StatefulWidget {
  const CreateNode({super.key});

  @override
  State<CreateNode> createState() => _CreateNodeState();
}

class _CreateNodeState extends State<CreateNode> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Create Network',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: IntrinsicHeight(
          child: Container(
        margin: const EdgeInsets.all(
            8.0), // just to make the contianer stand out, you can remove it

        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
                fit: BoxFit.cover,
                height: width * 0.25, // 25% of screen width
                width: width * 0.25,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text(
                    'product.name',
                    style: TextStyle(fontSize: 17),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(direction: Axis.vertical, children: const [
                        Text(
                          'Rs200',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs300',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 17,
                              color: Colors.blueGrey),
                        ),
                      ]))
                ])),
          ],
        ),
      )),
    );
  }
}
