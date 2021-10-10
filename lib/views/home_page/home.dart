import 'dart:ui';
import 'package:appdelivery/models/home_model.dart';
import 'package:appdelivery/views/detail_page/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<QuerySnapshot> order;
  late CollectionReference _collectionReference;
  late HomeModel _homeModel;
  @override
  void initState() {
    super.initState();
    order = FirebaseFirestore.instance
        .collection('orders')
        .snapshots(includeMetadataChanges: true);
    _homeModel = HomeModel();
    parseJson();
  }

  Future<void> parseJson() async {
    _collectionReference = FirebaseFirestore.instance.collection('orders');
    DocumentSnapshot snapshot =
        await _collectionReference.doc('Document_oder').get();
    var data = snapshot.data() as Map<String, dynamic>;
    _homeModel = HomeModel.fromJson(data);
  }

  navigateDetail() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách đơn hàng"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.person), onPressed: () => {})
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: order,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading...");
                }
                final data = snapshot.requireData;
                return ListView.builder(
                    itemCount: _homeModel.orders?.length ?? 0,
                    itemBuilder: (context, index) {
                      print(data.runtimeType);
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          dataHome: _homeModel.orders![index],
                                        )));
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 25)),
                                    Text(
                                      '${_homeModel.orders![index].id}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(_homeModel.orders![index].name ?? '',
                                        style: const TextStyle(
                                            color: Colors.black38)),
                                    Text(
                                        _homeModel.orders![index].district ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.black38)),
                                  ],
                                ),

                                Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 25)),
                                    Text(_homeModel.orders![index].status ?? '',
                                        style: const TextStyle(fontSize: 16)),
                                    Text(
                                        'Phí: ${_homeModel.orders![index].fee ?? ''}',
                                        style: const TextStyle(
                                            color: Colors.black38)),
                                    Text(
                                        'Code: ${_homeModel.orders![index].code ?? ''}',
                                        style: const TextStyle(
                                            color: Colors.black38)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Color _getColorStatus(String statuss) {
    if (statuss == 'Đã giao hàng') {
      return Colors.blue;
    } else if (statuss == 'Đã nhận hàng') {
      return Colors.green;
    } else if (statuss == 'Chờ giao hàng') {
      return Colors.yellow;
    } else if (statuss == 'Hủy giao hàng') {
      return Colors.red;
    }
    return Colors.black;
  }
}
