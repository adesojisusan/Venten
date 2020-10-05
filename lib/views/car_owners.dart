import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venten/components/custom_card.dart';
import 'package:venten/models/filter.dart';
import 'package:venten/util.dart';

class CarOwners extends StatefulWidget {
  final Filter filter;

  CarOwners({this.filter});

  @override
  _CarOwnersState createState() => _CarOwnersState();
}

class _CarOwnersState extends State<CarOwners> {
  List owners = List();
  bool loading = true;
  

  @override
  void initState() {
    super.initState();
    loadCsv();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Owners'),
      ),
      body: loading ? Center(child: CircularProgressIndicator()) : buildList(),
    );
  }

  buildList() {
    if (owners.isEmpty) {
      return Center(child: Text('No results found'));
    } else {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        physics: ClampingScrollPhysics(),
        itemCount: owners.length,
        itemBuilder: (_, index) {
          List owner = owners[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
              top: index == 0? 10.0:0.0,
            ),
            child: CustomCard(
              borderRadius: BorderRadius.circular(10.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${owner[1]} ${owner[2]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    Text('${owner[3]}'),
                    Text('${owner[9]}'),
                    Text('${owner[4]}'),
                    Text('${owner[5]}, ${owner[7]}, ${owner[6]}'),
                    Text('${owner[8]}'),
                    Text('${owner[10]}'),
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
