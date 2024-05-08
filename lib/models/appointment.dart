class DataAppointment {
  final List<Appointment> upcoming;
  final List<Appointment> completed;
  final List<Appointment> canceled;

  DataAppointment(
      {required this.upcoming,
      required this.completed,
      required this.canceled});
  factory DataAppointment.fromJson(Map<String, dynamic> json) =>
      DataAppointment(
          upcoming: List<Appointment>.from(
              json["upcoming"].map((x) => Appointment.fromJson(x))),
          completed: List<Appointment>.from(
              json["completed"].map((x) => Appointment.fromJson(x))),
          canceled: List<Appointment>.from(
              json["canceled"].map((x) => Appointment.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'upcoming': List.from(upcoming.map((e) => e.toJson())),
        'completed': List.from(upcoming.map((e) => e.toJson())),
        'canceled': List.from(upcoming.map((e) => e.toJson())),
      };
}

class Appointment {
  final String id;
  final String img;
  final String name;
  final String fee;
  final String rate;
  final String reviewCount;
  final String location;
  final String experience;
  final String time;

  Appointment(
      {required this.id,
      required this.img,
      required this.name,
      required this.fee,
      required this.rate,
      required this.reviewCount,
      required this.location,
      required this.experience,
      required this.time});
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
        id: json['id'] ?? '',
        img: json['img'] ?? '',
        name: json['name'] ?? '',
        fee: json['fee'] ?? '',
        rate: json['rate'] ?? '',
        reviewCount: json['review_count'] ?? '',
        location: json['location'] ?? '',
        experience: json['experience'] ?? '',
        time: json['time'] ?? '');
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'img': img,
        'name': name,
        'fee': fee,
        'rate': rate,
        'review_count': reviewCount,
        'location': location,
        'experience': experience,
        'time': time
      };
}
