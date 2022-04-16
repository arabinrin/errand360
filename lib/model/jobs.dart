class JobModel {
  int? id;
  String? title;
  String? location;
  String? descr;
  String? type;
  double? price;
  JobModel(
      {this.location, this.price, this.title, this.type, this.descr, this.id});
}

List<JobModel> jobs = [
  JobModel(
      location: 'New York, New York',
      price: 32,
      title: 'Operation Manager',
      descr:
          'We are looking for someone to assist the human resources team in the recruiting and hiring process, implement policies and strategies to improve productivity and efficiency levels and building an enjoyable company culture',
      type: 'Remote',
      id: 1),
  JobModel(
      location: 'New York, New York',
      price: 32,
      title: 'Operation Manager',
      descr:
          'We are looking for someone to assist the human resources team in the recruiting and hiring process, implement policies and strategies to improve productivity and efficiency levels and building an enjoyable company culture',
      type: 'Remote',
      id: 1),
  JobModel(
      location: 'New York, New York',
      price: 32,
      title: 'Operation Manager',
      descr:
          'We are looking for someone to assist the human resources team in the recruiting and hiring process, implement policies and strategies to improve productivity and efficiency levels and building an enjoyable company culture',
      type: 'Remote',
      id: 1),
];
