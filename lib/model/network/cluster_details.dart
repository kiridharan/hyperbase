class Stdout {
  String namespace;
  String name;
  String ready;
  String status;
  String restarts;
  String age;

  Stdout({
    required this.namespace,
    required this.name,
    required this.ready,
    required this.status,
    required this.restarts,
    required this.age,
  });

  factory Stdout.fromJson(Map<String, dynamic> json) {
    return Stdout(
      namespace: json['NAMESPACE'],
      name: json['NAME'],
      ready: json['READY'],
      status: json['STATUS'],
      restarts: json['RESTARTS'],
      age: json['AGE'],
    );
  }
}

class ResponseData {
  String message;
  List<Stdout> stdout;

  ResponseData({
    required this.message,
    required this.stdout,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['stdout'] as List;
    List<Stdout> stdoutList = list.map((i) => Stdout.fromJson(i)).toList();

    return ResponseData(
      message: json['message'],
      stdout: stdoutList,
    );
  }
}
