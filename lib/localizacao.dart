import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização'),
      ),
      body: Ink(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.brown.shade100, Colors.brown.shade300])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Centro de Estética Ça Va',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                  'R. Cel. Luís Lustosa, 1736 - Batel, Guarapuava - PR, 85015-340'),
              SizedBox(height: 10),
              Text(
                  'http://www.sistemafiep.org.br/'),
              SizedBox(height: 10),
              Text(
                  'Telefone: (042) 3621 - 3800'),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SfMaps(
                layers: [
                  MapTileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    initialZoomLevel: 15,
                    initialFocalLatLng:
                        MapLatLng(-25.38973731995469, -51.47881887989549),
                    initialMarkersCount: 1,
                    markerBuilder: (BuildContext context, int index) {
                      return MapMarker(
                        latitude: -25.38973731995469,
                        longitude: -51.47881887989549,
                        iconColor: Colors.red,
                        iconStrokeColor: Colors.red,
                        iconStrokeWidth: 10.0,
                        iconType: MapIconType.circle,
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
