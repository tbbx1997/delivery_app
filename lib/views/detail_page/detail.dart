import 'dart:math';
import 'dart:ui';
import 'package:appdelivery/models/home_model.dart';
import 'package:appdelivery/views/resource/map_sreen.dart';
import 'package:appdelivery/views/resource/test_dierection.dart';
import 'package:appdelivery/views/resource/test_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.dataHome}) : super(key: key);
  final Orders dataHome;
  final statusMoney = ["Đã thu", "Chưa thu"];
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // sumInt(int a, int b){
  //   return a+b;
  // }
  // main(List<String>args){
  //   var sum;
  //   var b = widget.dataHome.fee;
  //   var a = widget.dataHome.code;
  //   sum = sumInt(a!, b!);
  //   print(sum);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dataHome.id ?? '',
            style: const TextStyle(fontSize: 30), textAlign: TextAlign.center),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.filter_alt), onPressed: () => {})
        ],
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.location_on),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MapScreen()))
        },
      ),
      body: Container(
        color: const Color(0xF1F6F6EF),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const Text(
              "HÀNG HÓA",
              style:
                  TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: const Color(0xFFFFFFFF),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem(widget.dataHome.name_product ?? '', (widget.dataHome.code ?? '').toString()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text(
              "THÔNG TIN GIAO HÀNG",
              style:
                  TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: const Color(0xFFFFFFFF),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Tình trạng giao hàng:',
                            widget.dataHome.status ?? '',
                            isStatus: true),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Phí giao hàng:',
                            (widget.dataHome.fee ?? '').toString()),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Ngày hẹn giao:', (widget.dataHome.status ?? '').toString()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text("THÔNG TIN KHÁCH HÀNG",
                style: TextStyle(
                    fontSize: 16, color: Colors.lightBlueAccent)),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: const Color(0xFFFFFFFF),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Tên khách hàng:',
                            widget.dataHome.name ?? ''),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Điện thoại:', (widget.dataHome.phone ?? '').toString()),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Email:', widget.dataHome.email ?? ''),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Giao hàng đến:', widget.dataHome.address ?? ''),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Quận/Huyện:',
                            widget.dataHome.district ?? ''),
                      ),
                      SizedBox(
                        width: 395,
                        height: 75,
                        child: _rowItem('Tỉnh/Thành phố:', widget.dataHome.city ?? ''),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowItem(String title, String content, {bool isStatus = false}) {
    return Column(
      children: [Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(content,
                      style: TextStyle(
                          fontSize: 16,
                          color: isStatus
                              ? _getColorContent(content)
                              : Colors.black54)),
                )
              ],
            ),
          ],
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12),
          ),
        ),
      )],
    );
  }

  Color _getColorContent(String status) {
    // color of status
    if (status == 'Đã giao hàng') {
      return Colors.blue;
    } else if (status == 'Đã nhận hàng') {
      return Colors.green;
    } else if (status == 'Chờ giao hàng') {
      return Colors.yellow;
    } else if (status == 'Hủy giao hàng') {
      return Colors.red;
    }
    return Colors.black;
  }
   statusMoney(String status){
    var txt = 'Đã thu';
    var txt1 = 'Chua thu';
    if(status == 'Đã giao hàng'){
      return txt;
    }else{
      return txt1;
    }
  }
}

