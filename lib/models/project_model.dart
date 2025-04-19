// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

//import 'dart:convert';

// ProjectModel projectModelFromJson(String str) => ProjectModel.fromJson(json.decode(str));

// String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
    int id;
    String titre;
    String categorie;
    String description;
    String photo;

    ProjectModel({
        required this.id,
        required this.titre,
        required this.categorie,
        required this.description,
        required this.photo,
    });

    // factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    //     titre: json["titre"],
    //     categorie: json["categorie"],
    //     description: json["description"],
    //     photo: json["photo"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "titre": titre,
    //     "categorie": categorie,
    //     "description": description,
    //     "photo": photo,
    // };
}
List<ProjectModel>projectlist = [
  ProjectModel(
    id: 1,
    titre: "Gaz Tataouine",
    categorie: "Dévloppement",
    description: "Le projet gaz de Tataouine ou TGP (Tataouine Gas Project) a pour objectif principal d’alimenter la région de Tataouine en gaz commercial. Il est situé à la région de Gordhab (Gouvernorat de Tataouine) et il est développé à 100% par l’ETAP.Ce projet vise à récupérer et traiter 600 000 m3/jour de gaz venant des concessions du sud (en particulier le gaz de Nawara). Il est constitué d’un pipeline de 12’’ de diamètre et de 94 km de longueur (relié au pipeline principal de Nawara), de 2 vannes de sectionnement (LVS 1 et LVS 2), d’une usine de traitement de gaz à Tataouine (GTP-T) et d’une usine de mise en bouteilles de GPL (Bottling Unit).L’usine GTP-T a pour objectif la production de gaz commercial qui va alimenter le réseau de la STEG à Tataouine ainsi que du GPL domestique pour les besoins de l’usine de mise en bouteilles, du propane commercial, du butane commercial et du condensat qui seront transportés jusqu’à Gabes par camions.",
    photo: "assets/images/gaz tataouine.png"
    ),
  ProjectModel(
    id: 2,
    titre: "Didon",
    categorie: "Dévloppement",
    description: "Le champ est situé à 78 km au large du Golfe de Gabès. La surface de la concession DIDON est de 53 km2.Le champ a été découvert en 1975 suite à la découverte de Didon-1, le puits Didon-2 a été foré en 1985 pour évaluer l'extension de l'accumulation d'hydrocarbures.La phase I de développement du champ a commencé en 1997 et le premier pétrole a eu lieu en mai 1998 à partir d'un seul puits sous-marin D3H connecté à une barge FPSO par MP ZARAT. Un autre puits sous-marin D4H a été foré en 2002 et raccordé pour sa mise en production en 2004.Suite à l’augmentation de la production d’eau, la phase II de développement du champ a démarré par PA RESOURCES PART en 2005 avec l'installation d'une plateforme fixe de production à quatre (04) pieux et le forage de quatre (4) puits supplémentaires (D-5H, D-6H, D-7H et D-10H).Actuellement, cette concession est détenue à 100% par ETAP, suite au SPA/TA (SALE & PURCHASE AGREEMENT / TRANSITION AGREEMENT) entre ETAP et PART depuis mai 2016.Suite à la baisse de la production journalière, ETAP a décidé de suspendre la production en fin 2017 et de réaliser une étude réservoir et technico-économique afin de réévaluer le potentiel du champ.Cette étude s'est conclue en 2019 avec des résultats positifs et prometteurs. Après laquelle, ETAP a l'intention de poursuivre l'exploitation du champ DIDON pour une période supplémentaire de minimum 15 ans à travers un troisième plan de développement (PHASE III).",
    photo: "assets/images/didon3_02.jpg"
    ),
  ProjectModel(
    id: 3,
    titre: "zarat",
    categorie: "Exploration",
    description: "Le projet Zarat s’inscrit dans le cadre d’une vision stratégique visant à consolider la position de l’ETAP en tant qu’opérateur dans le domaine de l’exploration et de la production pétrolière. Cette vision a été traduite au fil des années par la prise de décisions stratégiques visant à opérer plusieurs permis de recherche pétrolière, parmi lesquels figuraient l’ancien permis Nord des Chotts et l’actuel permis Chaal.Le permis Zarat représente un pas significatif vers l’exploration en offshore, situé dans une zone pétrolière prolifique, entourée par plusieurs champs pétroliers notables tels que les Champs de Miskar, Hasdrubal, Didon, entre autres. Cette proximité avec des champs pétroliers productifs d’huile et de gaz à partir de l’Eocène (Fm El Guéria) et de l’Abiod, souligne le potentiel significatif de cette région en termes d’exploration et de production.L'objectif primordial de ce projet est d’initier une approche multidisciplinaire, visant à réévaluer le potentiel pétrolier du permis, identifier les prospects et sélectionner le prospect candidat pour le nouveau forage d’exploration. Une attention particulière a été accordée aux objectifs profonds, notamment le Jurassique et le Trias, suite à des études démontrant leur potentiel pétrolier. Cette démarche reflète notre engagement envers une exploration méthodique et approfondie pour maximiser les opportunités dans cette région stratégique.",
    photo: "assets/images/zarat.png"
    ),
  ProjectModel(
    id: 4,
    titre: "Chaal",
    categorie: "Exploration",
    description: "Dans une optique de renouveler ses réserves Nationales en hydrocarbures (Huile et gaz) et amplifier sa capacité de production à travers des découvertes des nouveaux gisement, ETAP a orienté sa stratégie vers l'operating dans le domaine EP (exploration et Production), particulièrement l'exploration pétrolière en onshore de la Tunisie, par ses propres moyens.En s'appuyant sur ses compétences professionnelles, sa bonne connaissance du sous sol tunisien sur le plan G&G, son savoir faire dans les travaux de recherche dans le domaine d'exploration pétrolière et sa maitrise de la technologie, ETAP a pris l'initiative de prendre le risque d'être un opérateur national dans l'industrie Pétrolier en upstream.Dans ce contexte, une direction a été créer chargée de la réalisation des projets d'exploration des permis détenus par ETAP. Le Portefeuille actuel de cette direction DOC couvre principalement le projet des travaux de recherches du permis Chaal.",
    photo: "assets/images/Chaal.png"
    ),
  ProjectModel(
    id: 5,
    titre: "Tataouine photovolatique 10 MWC",
    categorie: " énergie renouvelable",
    description: "ETAP et ENI ont signé un accord cadre de partenariat pour le développement de projets à partir de sources d'énergies renouvelables, le 30 Novembre 2016."
"Le consortium ETAP-ENI a obtenu l'accord de principe CTER01/2018 du 27 Avril 2018, pour la réalisation d’un projet de production d'électricité à partir de l’énergie solaire photovoltaïque d'une puissance de 10 MWc, sous le régime d'Autorisation"
"Un appel d’offre a été lancé le 18/09/2018 pour les travaux de réalisation en EPC de la station photovoltaïque. Le consortium SOCOBAT/ETELEC a été retenu après évaluation technique et économique."
"La SPV nommée SEREE a été créée le 10/04/2019 pour la réalisation et l’exploitation de la centrale photovoltaïque. Ce projet sera exploité sur une période de 20 ans et s’étalera sur une superficie de 20 Hectares.",
    photo: "assets/images/tatouine 10MWC.png"
    ),
  ProjectModel(
    id: 6,
    titre: "Adam",
    categorie: "Energie renouvelable",
    description: "Les coûts de réalisation de la centrale photovoltaïque (CAPEX) et OPEX sont supportés par ETAP et Eni à concurrence de50% chacun."
"Le gaz économisé est estimé à 2,8 Msm3 par an."
"25/10/2018 Accord de Principe partagé entre ETAP, Eni, OMV, MEDCO."
"18/02/2019 Signature du contrat avec METKA(délai contractuel 8 mois)."
"Montant du contrat: 10,365,000 Keuro avec 4 années de OM (deux années sont optionnelles). 11,6MUSD.",
    photo: "assets/images/adem.png",
    ),


];
