class Feuille {
  String _id;
  String epreuve;
  String nom;
  String enseignant;
  String classe;
  String filiere;
  String annee;
  String type;
  int nbrPage;
  int semestre;
  int session;

//<editor-fold desc="Data Methods">

  Feuille({
    required this.epreuve,
    required this.nom,
    required this.enseignant,
    required this.classe,
    required this.filiere,
    required this.annee,
    required this.type,
    required this.nbrPage,
    required this.semestre,
    required this.session,
    required String id,
  }) : _id = id;


  @override
  String toString() {
    return 'Feuille{ _id: $_id, epreuve: $epreuve, nom: $nom, enseignant: $enseignant, classe: $classe, filiere: $filiere, annee: $annee, type: $type, nbrPage: $nbrPage, semestre: $semestre,}';
  }

  Feuille copyWith({
    String? id,
    String? epreuve,
    String? nom,
    String? enseignant,
    String? classe,
    String? filiere,
    String? annee,
    String? type,
    int? nbrPage,
    int? semestre,
    int? session
  }) {
    return Feuille(
      id: id ?? _id,
      epreuve: epreuve ?? this.epreuve,
      nom: nom ?? this.nom,
      enseignant: enseignant ?? this.enseignant,
      classe: classe ?? this.classe,
      filiere: filiere ?? this.filiere,
      annee: annee ?? this.annee,
      type: type ?? this.type,
      nbrPage: nbrPage ?? this.nbrPage,
      semestre: semestre ?? this.semestre,
      session: session ?? this.session,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': _id,
      'epreuve': epreuve,
      'nom': nom,
      'enseignant': enseignant,
      'classe': classe,
      'filiere': filiere,
      'annee': annee,
      'type': type,
      'nbrPage': nbrPage,
      'semestre': semestre,
    };
  }

  factory Feuille.fromMap(Map<String, dynamic> map) {
    return Feuille(
      id: map['_id'] as String,
      epreuve: map['epreuve'] as String,
      nom: map['nom'] as String,
      enseignant: map['enseignant'] as String,
      classe: map['classe'] as String,
      filiere: map['filiere'] as String,
      annee: map['annee_academique'] as String,
      type: map['type'] as String,
      nbrPage: map['nbr_page'] as int,
      semestre: map['semestre'] as int ,
      session: map['session'] as int ,
    );
  }

//</editor-fold>
}