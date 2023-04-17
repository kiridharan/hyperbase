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

  getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isNetwork = prefs.getBool("isNetwork");
    var org = prefs.getString("org");
    var namespace = prefs.getString("namespace");
    // print("org: $org");
    // print("namespace: $namespace");
    // print("isNetwork: $isNetwork");
    return [isNetwork, org, namespace];
  }

  storeOrgNet(String org, String network) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("org: $org");
    // print("network: $network");
    prefs.setString(org, network);
  }

  getOrgNet(String network) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var org = prefs.getString(network);
    // print("org: $org 99");
    return org.toString();
  }

  delKey(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(id);

    // return key.toString();
  }
}
