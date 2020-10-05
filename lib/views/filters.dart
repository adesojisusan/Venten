import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:venten/components/custom_card.dart';
import 'package:venten/models/filter.dart';
import 'package:venten/views/car_owners.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  List filters = List();
  bool loading = true;

  getFilters() async {
    var url = 'https://ven10.co/assessment/filter.json';
    var res = await http.get(url);
    if (res.statusCode == 200) {
      filters = jsonDecode(res.body);
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Filters'),
      ),
      body: loading ? Center(child: CircularProgressIndicator()) : buildList(),
    );
  }

  buildList() {
    if (filters.isEmpty) {
      return Text('Filter is empty');
    } else {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        physics: ClampingScrollPhysics(),
        itemCount: filters.length,
        itemBuilder: (_, index) {
          Filter filter = Filter.fromJson(filters[index]);
          return Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
              top: index == 0? 10.0:0.0,
            ),
            child: CustomCard(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CarOwners(filter: filter);
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: filter.startYear != null &&
                              filter.endYear != null,
                          child: Text(
                            '${filter.startYear} - ${filter.endYear}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Visibility(
                          visible: filter.gender != null && filter.gender.isNotEmpty,
                          child: Text('·'),
                        ),
                        SizedBox(width: 5.0),
                        Visibility(
                          visible:
                              filter.gender != null && filter.gender.isNotEmpty,
                          child: Text('${filter.gender}'),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Visibility(
                      visible: filter.countries.isNotEmpty,
                      child: Row(
                        children: [
                          Text(
                              '${filter.countries.toString().replaceAll('[', '').replaceAll(']', '')}'),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Visibility(
                      visible: filter.colors.isNotEmpty,
                      child: Text(
                          '${filter.colors.toString().replaceAll('[', '').replaceAll(']', '')}'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
