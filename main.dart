import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'BIOMETRICS SA';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  // Lista de URLs de las imágenes de serpientes
  final List<String> fishImageUrls = [
    'https://i.pinimg.com/564x/78/67/dc/7867dc95583257c7434b66e5e58edafb.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/9/9b/B._constrictor.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/6/66/Indiancobra.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/0/09/Anaconda_Loreto_Peru.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/1/10/Brooding_female_Python_molurus_bivittatus.jpg',
    'https://www.ngenespanol.com/wp-content/uploads/2023/02/mamba-negra-la-serpiente-mortal-que-domina-el-africa-subsahariana-reptil.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 55, 94, 184),
      ),
      body: _buildGridView([]), // Inicialmente, no muestra imágenes
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 94, 184),
              ),
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 55, 94, 184)),
                accountName: Text(
                  "Joimar Ibarra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("joimaribarra123@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/236x/6c/f9/6e/6cf96e692dde8046be75d15a788ba077.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.article), // Icono de serpiente
              title: const Text('Peces'),
              onTap: () {
                Navigator.pop(context);
                // Muestra las imágenes de serpientes al hacer clic en "Serpientes"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Peces'),
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      ),
                      body: _buildGridView(snakeImageUrls),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.verified_user_rounded), // Icono de desarrollador
              title: const Text('Desarrollador'),
              onTap: () {
                Navigator.pop(context);
                // Acción al hacer clic en "Desarrollador"
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(List<String> urls) {
    return GridView.count(
      crossAxisCount: 2, // Número de columnas
      children: List.generate(urls.length, (index) {
        return Center(
          child: Card(
            child: InkWell(
              onTap: () {
                // Acción al hacer clic en el elemento del grid
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(urls[index]), // URL de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
