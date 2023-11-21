import 'package:flutter/material.dart';
import 'package:portfolio_example/projeto_model.dart';
import 'projeto_detalhe.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Project> projects = [
    Project('Botox facial', '', 'assets/botox.png',
        'O procedimento de Botox envolve a injeção de pequenas quantidades da toxina botulínica em áreas específicas do rosto para reduzir temporariamente as rugas.'),
    Project('Criolipólise', '', 'assets/criolipolise.jpg',
        'A criolipólise é um procedimento estético não invasivo que utiliza resfriamento controlado para reduzir a gordura localizada.'),
    Project('Massagem', '', 'assets/massagem.jpg',
        'A massagem é uma técnica terapêutica que envolve a manipulação dos tecidos moles do corpo para promover relaxamento, alívio da tensão muscular e melhoria da circulação sanguínea.'),
    Project('Peeling de diamante', '', 'assets/peeling_de_diamante.jpg',
        'O peeling de diamante é um procedimento estético não invasivo que esfolia a camada superficial da pele usando um instrumento com ponta de diamante.'),
    Project('Designer de unhas', '', 'assets/designer_de_unhas.jpg',
        'O serviço de design de unhas envolve a estilização e embelezamento das unhas por um profissional.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tratamentos'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectDetailsScreen(
                      project: projects[index],
                    ),
                  ),
                );
              },
              
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Row(
                  children: [
                    Hero(
                      tag: projects[index].image,
                      child: Image.asset(
                        projects[index].image,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projects[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            projects[index].githubLink,
                            style: TextStyle(color: Colors.brown),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
