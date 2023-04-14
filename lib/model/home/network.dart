// ignore_for_file: public_member_api_docs, sort_constructors_first
class Networks {
  String name;
  String active;
  String deaactive;
  String date;
  Networks({
    required this.name,
    required this.active,
    required this.deaactive,
    required this.date,
  });

  static List<Networks> getNetwork() {
    return [
      Networks(
        name: 'Network 1',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 2',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 3',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 4',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 5',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 6',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 7',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
      Networks(
        name: 'Network 8',
        active: 'Active',
        deaactive: 'Deactive',
        date: '2021-09-09',
      ),
    ];
  }
}
