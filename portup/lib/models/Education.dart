class Education {
  final String title;
  final String description;
  final String city;
  final String school;
  final DateTime startDate;
  final DateTime endDate;

  Education(
    this.city,
    this.title,
    this.description,
    this.school,
    this.startDate,
    this.endDate,
  );

  Education.fromJson(Map<String, dynamic> json)
      : city = json["city"],
        title = json["title"],
        description = json["description"],
        school = json["school"],
        startDate = DateTime.now(),
        endDate = DateTime.now();

  Map<String, dynamic> toJson() => {
        'city': city,
        'title': title,
        'description': description,
        'school': school,
        'startDate': startDate,
        'endDate': endDate,
      };
}
