import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gika/model/detail_model.dart';
import 'package:gika/provider/detail_provider.dart';
import 'package:gika/services/theme.dart';
import 'package:provider/provider.dart';

class DetailRoute extends StatelessWidget {
  int index;
  DetailRoute({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailModel? detailModel;
    Provider.of<DetailUserProvider>(context)
        .getDetail(index)
        .then((data) => detailModel = data);

    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: SingleChildScrollView(
        child: Consumer<DetailUserProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: (value.data == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.02,
                      ),
                      SizedBox(child: Text(value.data!.title)),
                      SizedBox(
                        height: screenHeight(context) * 0.04,
                      ),
                      Text(
                        'Body',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight(context) * 0.02,
                      ),
                      SizedBox(child: Text(value.data!.body))
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
