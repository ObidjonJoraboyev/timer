import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timer/data/models/data_model.dart';
import 'package:timer/data/models/list_model.dart';
import 'package:timer/data/my_response.dart';
import 'package:timer/data/network/api_provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<ListModel> list = [];

  init() async {
    MyResponse myResponse = await ApiProvider.fetchCountry();
    list = myResponse.data as List<ListModel>;
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ...List.generate(list.length, (index) {
            List<DataModel> ls = list[index].data;
            return ListTile(
              onTap: () {},
              subtitle: Text(ls[0].sender.location),
              trailing: Column(
                children: [
                  Text(
                    ls[0].amount.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    list[index].transferDate,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network(ls[0].sender.brandImage)),
              title: Text(ls[0].sender.name),
            );
          })
        ],
      ),
    );
  }
}
