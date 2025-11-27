import 'package:flutter/material.dart';
import '../models/pays.dart';
import 'country_detail_page.dart';
import 'welcome_page.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  // Liste des Pays en utilisant le modèle Pays
  static const List<Pays> countries = [
    Pays(
      nom: 'France',
      capitale: 'Paris',
      population: '67 millions',
      superficie: '643 801 km²',
      langues: 'Français',
      image: 'assets/images/france.png',
    ),
    Pays(
      nom: 'Tunisie',
      capitale: 'Tunis',
      population: '12 millions',
      superficie: '163 610 km²',
      langues: 'Arabe',
      image: 'assets/images/tunisie.png',
    ),
    Pays(
      nom: 'Brésil',
      capitale: 'Brasília',
      population: '215 millions',
      superficie: '8 515 767 km²',
      langues: 'Portugais',
      image: 'assets/images/bresil.png',
    ),
    Pays(
      nom: 'Italie',
      capitale: 'Rome',
      population: '59 millions',
      superficie: '301 340 km²',
      langues: 'Italien',
      image: 'assets/images/italie.png',
    ),
    Pays(
      nom: 'Canada',
      capitale: 'Ottawa',
      population: '39 millions',
      superficie: '9 984 670 km²',
      langues: 'Anglais',
      image: 'assets/images/canada.png',
    ),
    Pays(
      nom: 'Australie',
      capitale: 'Canberra',
      population: '26 millions',
      superficie: '7 692 024 km²',
      langues: 'Anglais',
      image: 'assets/images/australie.png',
    ),
    Pays(
      nom: 'Allemagne',
      capitale: 'Berlin',
      population: '84 millions',
      superficie: '357 022 km²',
      langues: 'Allemand',
      image: 'assets/images/allemagne.png',
    ),
    Pays(
      nom: 'Espagne',
      capitale: 'Madrid',
      population: '47 millions',
      superficie: '505 990 km²',
      langues: 'Espagnol',
      image: 'assets/images/espagne.png',
    ),
    Pays(
      nom: 'Afrique du Sud',
      capitale: 'Pretoria',
      population: '60 millions',
      superficie: '1 219 090 km²',
      langues: 'Afrikaans',
      image: 'assets/images/afrique_sud.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Pays'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/globe.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Quitter'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Quitter l’application'),
                    content: const Text('Voulez-vous vraiment quitter ?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Oui'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final Pays country = countries[index];
          return ListTile(
            leading: Image.asset(country.image, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(country.nom),
            subtitle: Text('Capitale: ${country.capitale}'),
            onTap: () {
              // Navigation vers la page détail en passant l'objet Pays
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetailPage(pays: country),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
