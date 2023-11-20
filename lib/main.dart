import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_example/localizacao.dart';
import 'package:portfolio_example/projetos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Portfólio',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Raleway',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {'name': 'Tratamento facial', 'photo': 'assets/tramento_facial.webp'},
    {'name': 'Tratamento corporal', 'photo': 'assets/tratamento_corporal.png'},
    {'name': 'Tratamento capilar', 'photo': 'assets/tratamento_capilar.avif'},
    {'name': 'Manicure e pedicure', 'photo': 'assets/manicure_pedicure.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Portfólio'),
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
                    fontFamily: 'RobotoMono',
                    color: Colors.black54),
                speed: const Duration(milliseconds: 100),
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
                    RotateAnimatedText('Centro',
                        textStyle: TextStyle(color: Colors.black54)),
                    RotateAnimatedText('de estética',
                        textStyle: TextStyle(color: Colors.black54)),
                    RotateAnimatedText('Ça va!',
                        textStyle: TextStyle(color: Colors.black54)),
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
              'Quem somos?\n\nSomos uma renomad clínica de estética dedicada a proporcionar serviços de alta qualidade para melhorar a beleza, autoestima e bem-estar de nossos clientes. Fundada com a missão de ajudar as pessoas a se sentirem melhor, nossa clínica oferece vários tratamentos e procedimentos estéticos personalizados para atender às necessidades de cada cliente.',
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
              children: languages.map((language) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(language['photo']),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      )),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              'raqueliggom@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            accountName: Text(
              'Raqueli Gonçalves',
              style: TextStyle(fontSize: 20),
            ),
            currentAccountPicture: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/photo.jpeg'))),
            decoration: const ShapeDecoration(
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 4.0,
                        style: BorderStyle.solid)),
                gradient:
                    LinearGradient(colors: [Colors.blueGrey, Colors.white])),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Sobre',
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
              Icons.build,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Projetos',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectsScreen(),
                  ));
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.library_books,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Localização',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumePage(),
                  ));
            },
          ),
        ]),
      ),
    );
  }
}
