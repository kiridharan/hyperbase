import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  Future<String> getOrg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var org = prefs.getString("org");

    // print("org: $org");
    // print("namespace: $namespace");
    // print("isNetwork: $isNetwork");

    return org.toString();
  }

  Future<bool> getIsNetwork() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isNetwork = prefs.getBool("isNetwork");
    return isNetwork!;
  }

  Future<String> getNamespace() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var namespace = prefs.getString("namespace");
    return namespace.toString();
  }

  setAll(bool isNetwork, String org, String namespace) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isNetwork", isNetwork);
    prefs.setString("org", org);
    prefs.setString("namespace", namespace);
  }
}
