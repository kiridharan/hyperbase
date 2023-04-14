import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DefaultNetworkUp extends StatefulWidget {
  const DefaultNetworkUp({super.key});

  @override
  State<DefaultNetworkUp> createState() => _DefaultNetworkUpState();
}

class _DefaultNetworkUpState extends State<DefaultNetworkUp> {
  List<String> messages = [];
  late WebSocketChannel channel;

  Future connectToWebSocket() async {
    channel = WebSocketChannel.connect(Uri.parse("ws://localhost:8080"));

    // listen to incoming messages
    channel.stream.listen((message) {
      // print('Received message: $message');
      setState(() {
        messages.add(message);
        // print(messages);
      });
    });
    return channel;
  }

  void closeWebSocket() {
    channel.sink.close();
  }

  @override
  void initState() {
    super.initState();
    connectToWebSocket();
  }

  @override
  void dispose() {
    closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Stream.fromFuture(connectToWebSocket()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data);
            // print(messages);
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height - 100,
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Text("${messages[index]} $index");
                    },
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    closeWebSocket();
                  },
                  child: const Text('close the connection'),
                ),
              ],
            );
          } else {
            return const Text('Waiting for data...');
          }
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }
}
