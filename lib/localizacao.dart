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
                colors: [Colors.white24, Colors.blueGrey.shade200])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Experiência Profissional',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                  'Desenvolvedora Flutter\nEmpresa TEOREMA SISTEMAS\n Abril 2018 - Presente\n'),
              SizedBox(height: 10),
              Text(
                  'Analista de Suporte\nEmpresa RP INFO\nJunho 2017 - Janeiro 2018\n'),
              Text(
                  'Analista Financeira / Suporte de Hardware\nEmpresa Benderplast LTDA\nAgosto 2013 - Maio 2017\n'),
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
              Text(
                'Educação',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Pós Graduação Desenvolvimento de Aplicações Web e Mobile\nFaculdade Guairacá\n2019 - 2021',
              ),
              SizedBox(height: 10),
              Text(
                'Graduação Análise e Desenvolvimento de Sistemas\nFaculdade Guairacá\n2015 - 2017',
              ),
              SizedBox(height: 10),
              Text(
                'Técnico em Informática\nEnsino Médio\n2010 - 2014',
              ),
              SfMaps(
                layers: [
                  MapTileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    initialZoomLevel: 15,
                    initialFocalLatLng:
                        MapLatLng(-25.395218949348532, -51.478980691614815),
                    initialMarkersCount: 1,
                    markerBuilder: (BuildContext context, int index) {
                      return MapMarker(
                        latitude: -25.395218949348532,
                        longitude: -51.478980691614815,
                        iconColor: Colors.red,
                        iconStrokeColor: Colors.red,
                        iconStrokeWidth: 10.0,
                        iconType: MapIconType.triangle,
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
