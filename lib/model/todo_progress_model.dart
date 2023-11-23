class ProgressModel {
  final Map<String, dynamic> map;
  const ProgressModel({this.map = const {}});

  String get category => map["category"] as String? ?? '';
  int get total => map["total"] as int? ?? 0;
  int get completed => map["completed"] as int? ?? 0;
  String get percentage => map["percentage"].toString();
}

// {
//             "category": "personal",
//             "total": 2,
//             "completed": 1,
//             "percentage": 50
//         },