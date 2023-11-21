import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:portfolio_example/projeto_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  ProjectDetailsScreen({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(project.name),
        ),
        body: Container(
            color: Colors.white10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: project.image,
                    child: Image.asset(
                      project.image,
                      height: 600,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Linkify(
                      onOpen: (link) async {
                        await launchUrlString(link.url);
                      },
                      text: project.githubLink,
                      style: TextStyle(fontSize: 16),
                      linkStyle: TextStyle(
                        color: Colors.black54,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(kIsWeb ? 50 : 0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12),
                                    child: Column(
                                      children: [
                                        Text(
                                          project.name,
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    project.description,
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )));
  }
}
