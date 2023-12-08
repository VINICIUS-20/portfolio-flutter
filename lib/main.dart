import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:portfolio_example/localizacao.dart';
import 'package:portfolio_example/tratamentos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sobre nós!',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Raleway',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trataments = [
    {'photo': 'assets/tramento_facial.webp'},
    {'photo': 'assets/tratamento_corporal.png'},
    {'photo': 'assets/tratamento_capilar.avif'},
    {'photo': 'assets/manicure_pedicure.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nosso Portfólio'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 16),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Seja bem vindo!',
                    textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Courier',
                        color: Colors.black),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 20),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Montserrat',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                    'Centro de Estética Ça Va',
                    textStyle: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'RaleWay',
                        color: Colors.brown),
                    speed: const Duration(milliseconds: 100),
                  ),
                      ],
                      pause: const Duration(milliseconds: 0),
                      repeatForever: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Quem somos?\n\nSomos uma renomada clínica de estética dedicada a proporcionar serviços de alta qualidade para melhorar a beleza, autoestima e bem-estar de nossos clientes. Fundada com a missão de ajudar as pessoas a se sentirem melhor, nossa clínica oferece vários tratamentos e procedimentos estéticos personalizados para atender às necessidades de cada cliente.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: trataments.map(
                    (language) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                              language['photo'],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              'centrodeesteticaçava@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            accountName: Text(
              'Centro de Estética Ça Va',
              style: TextStyle(fontSize: 20),
            ),
            currentAccountPicture: Padding(
              padding: EdgeInsets.only(bottom: 5),
              //child: PinchZoom(
              // child: Image.asset('assets/logo.png'),
              // maxScale: 2.5,
              //onZoomStart: () {
              //  print('Start zooming');
              // },
              //onZoomEnd: () {
              //  print('Stop zooming');
              //},
              // ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              //child: PhotoView(
              // imageProvider: AssetImage("assests/logo.png"),
              //),
            ),
            decoration: const ShapeDecoration(
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.brown,
                        width: 4.0,
                        style: BorderStyle.solid)),
                gradient: LinearGradient(colors: [Colors.brown, Colors.brown])),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text(
              'Sobre nós',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.face_2,
              color: Colors.black,
            ),
            title: Text(
              'Tratamentos',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectsScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              title: Text(
                'Contato e localização',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumePage(),
                  ),
                );
              })
        ])));
  }
}
