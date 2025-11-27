class Pays {
  final String nom;
  final String capitale;
  final String population; // string ok ("67 millions") ou int si tu préfères
  final String superficie; // string ok ("643 801 km²")
  final String langues;
  final String image; // chemin vers l'asset (ex: 'assets/images/france.png')

  const Pays({
    required this.nom,
    required this.capitale,
    required this.population,
    required this.superficie,
    required this.langues,
    required this.image,
  });

  // Optionnel : création depuis Map (utile si tu pars d'un JSON)
  factory Pays.fromMap(Map<String, dynamic> m) => Pays(
        nom: m['nom'] ?? '',
        capitale: m['capitale'] ?? '',
        population: m['population']?.toString() ?? '',
        superficie: m['superficie']?.toString() ?? '',
        langues: m['langues'] ?? '',
        image: m['image'] ?? '',
      );

  Map<String, String> toMap() => {
        'nom': nom,
        'capitale': capitale,
        'population': population,
        'superficie': superficie,
        'langues': langues,
        'image': image,
      };
}
