class ApplicantModel {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;
  String? education;
  String? experience;
  List<String>? social_skil;
  ApplicantModel(
      {this.email,
      this.experience,
      this.first_name,
      this.avatar,
      this.last_name,
      this.education,
      this.id,
      this.social_skil});
}

List<ApplicantModel> aplicantModels = [
  ApplicantModel(
      education: 'University of Benin',
      email: 'rachel.howell@reqres.in',
      first_name: 'Rachel',
      last_name: 'Howell',
      avatar: 'https://reqres.in/img/faces/12-image.jpg',
      social_skil: [
        'Emphathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      id: 12),
  ApplicantModel(
      education: 'University of Lagos',
      email: 'george.edwards@reqres.in',
      first_name: 'George',
      last_name: 'Edwards',
      avatar: 'https://reqres.in/img/faces/11-image.jpg',
      social_skil: [
        'Emphathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      id: 11),
  ApplicantModel(
      education: "Federal Uuniversity if Technology",
      email: 'byron.fields@reqres.in',
      first_name: 'Byron',
      last_name: 'Fields',
      avatar: "https://reqres.in/img/faces/10-image.jpg",
      social_skil: [
        'Emphathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      id: 10),
  ApplicantModel(
      id: 9,
      education: 'University of Benin',
      email: "tobias.funke@reqres.in",
      first_name: "Tobias",
      last_name: "Funke",
      social_skil: [
        'Emphathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      avatar: "https://reqres.in/img/faces/9-image.jpg"),
  ApplicantModel(
      education: "Polythecnic of Business Studies",
      id: 8,
      email: "lindsay.ferguson@reqres.in",
      first_name: "Lindsay",
      social_skil: [
        'Emphathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      last_name: "Ferguson",
      avatar: "https://reqres.in/img/faces/8-image.jpg"),
  ApplicantModel(
      education: 'University of Benin',
      id: 7,
      email: "michael.lawson@reqres.in",
      first_name: "Michael",
      last_name: "Lawson",
      social_skil: [
        'Emphathy',
        'Corporation',
        'Listening',
        'Verbal communication',
        'Written communication'
      ],
      avatar: "https://reqres.in/img/faces/7-image.jpg"),
];
