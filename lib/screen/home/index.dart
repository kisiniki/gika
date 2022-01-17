import 'package:flutter/material.dart';
import 'package:gika/custom_widgets/item_list.dart';
import 'package:gika/custom_widgets/snack_bar.dart';
import 'package:gika/model/home_model.dart';
import 'package:gika/provider/detail_provider.dart';
import 'package:gika/provider/home_provider.dart';
import 'package:gika/router/constants.dart';
import 'package:gika/services/theme.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  List<HomeModel> _homeModel = [];

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context)
        .fetchListUser()
        .then((data) => _homeModel = data);
    Future<void> _getDetailUser(int index) async {
      final prov = Provider.of<DetailUserProvider>(context, listen: false);
      try {
        await prov.getDetail(index);
        if (!mounted) return;
      } catch (e) {
        if (!mounted) return;
        showSnackBar(context, e.toString());
      }
      if (!mounted) return;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('LIST USER'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<HomeProvider>(
              builder: (context, value, child) => ListView.builder(
                primary: false,
                        shrinkWrap: true,
                  itemCount: _homeModel.length,
                  itemBuilder: (ctx, index) {
                    var data = value.data[index];
                    return InkWell(
                      onTap: () {
                        _getDetailUser(index).then((value) =>
                                          Navigator.pushNamed(context, detailRoute,
                                              arguments: {'index':data.id}));
                      },
                      child: ItemListContainer(title: data.title, body: data.body),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
