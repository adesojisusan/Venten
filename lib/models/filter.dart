class Filter {
  int id;
  int startYear;
  int endYear;
  String gender;
  List countries;
  List colors;

  Filter(
      {this.id,
        this.startYear,
        this.endYear,
        this.gender,
        this.countries,
        this.colors});

  Filter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startYear = json['start_year'];
    endYear = json['end_year'];
    gender = json['gender'];
    countries = json['countries'].cast<String>();
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_year'] = this.startYear;
    data['end_year'] = this.endYear;
    data['gender'] = this.gender;
    data['countries'] = this.countries;
    data['colors'] = this.colors;
    return data;
  }
}
