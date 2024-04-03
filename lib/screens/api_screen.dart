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
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: ls[0].sender.brandImage,
                  errorWidget: (context, url, error) => CachedNetworkImage(
                      imageUrl:
                          "https://bekey.io/static/images/flutter/flutter-logo.png"),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(ls[0].sender.name),
            );
          })
        ],
      ),
    );
  }
}
