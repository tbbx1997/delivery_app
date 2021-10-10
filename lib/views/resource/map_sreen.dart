// import 'package:appdelivery/views/resource/widget/home_menu.dart';
// import 'package:appdelivery/views/resource/widget/ride_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//
//   late GoogleMapController _mapController;
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polyline = {};
//   List<LatLng> latlngList = [];
//
//   LatLng _currentMapPosition = LatLng(21.581093286854458, 105.81444567930116);
//
//   void _addMaker() {
//     setState(() {
//       _markers.add(Marker(
//         markerId: MarkerId(_currentMapPosition.toString()),
//         position: _currentMapPosition,
//         icon: BitmapDescriptor.defaultMarker,
//       ));
//     });
//   }
//
//   void _onCameraMove(CameraPosition position) {
//     _currentMapPosition = position.target;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         color: Colors.white,
//         child: Stack(
//           children: <Widget>[
//             GoogleMap(
// //              key: ggKey,
// //              markers: Set.of(markers.values),
//               onMapCreated: (GoogleMapController controller) {
//                 _mapController = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(21.581093286854458, 105.81444567930116),
//                 zoom: 15,
//               ),
//               markers: _markers,
//               onCameraMove: _onCameraMove,
//               polylines: _polyline,
//               onTap: (position) {
//                 print('position123: $position');
//                 latlngList.add(position);
//                 latlngList.add(LatLng(21.581093286854458, 105.81444567930116));
//                 _polyline.add(Polyline(polylineId: PolylineId(
//                     position.toString()), visible: true,
//                   //latlng is List<LatLng>
//                   points: latlngList,
//                   color: Colors.blue,));
//                 setState(() {
//
//                 });
//               },
//             ),
//             Positioned(
//               left: 0,
//               top: 0,
//               right: 0,
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   AppBar(
//                     backgroundColor: Colors.transparent,
//                     elevation: 0.0,
//                     title: Text(
//                       "Delivery App",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     leading: IconButton(
//                       onPressed: () {
//                         print("click menu");
//                       },
//                       icon: const Icon(Icons.menu),
//                       color: Colors.black,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 20, left: 20, right: 20),
//                     child: RidePicker(),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(left: 20,
//                 right: 20,
//                 bottom: 40,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 70.0),
//                   child: ElevatedButton(onPressed: () {},
//                     child: Text('Save'),),
//                 )
//             ),
//           ],
//         ),
//       ),
//       drawer: Drawer(
//         child: HomeMenu(),
//       ),
//     );
//   }
// }