import 'package:flutter/material.dart';
import 'package:ui/core/constants/colors_const.dart';
import 'package:ui/models/users_model.dart';
import 'package:ui/service/users_service.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key}) : super(key: key);

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.menu, color: ColorsConst.colorGrey),
        title: Text(
          'Contacts',
          style: TextStyle(color: ColorsConst.colorGrey),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: ColorsConst.colorGrey),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: UsersService.getData(),
        builder: (ctx, AsyncSnapshot<List<Users>> snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snap.hasError) {
            return const Center(child: Text('No Internet'));
          } else {
            return ListView.builder(
              itemBuilder: (_, __) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                  ),
                  title: Text(snap.data![__].name.toString()),
                  subtitle:
                      Text(snap.data![__].company!.catchPhrase.toString()),
                );
              },
              itemCount: snap.data!.length,
            );
          }
        },
      ),
    );
  }
}
