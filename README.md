# ProjetGrails

## 1/ Contributeurs

[Tom Phily](https://github.com/PhilyT)  
[Aïchatou Boucara Traoré](https://github.com/boucara)

## 2/ Responsable

[Greg Galli]()

## 3/ Le sujet

Nous allons maintenant créer le projet sur lequel nous allons travailler pendant les séances de TP : 
Nous allons créer une plateforme de gestion de points d’intérêts (au sens large, si vous voulez la dédier à votre passion, faites-vous plaisir!).
Ces points d’intérêts pourraient être des lieux, personnes, objets, ce que vous souhaitez tant que l’on peut les placer sur une carte.
Le rendu de projet prendra la forme d’un site permettant d’administrer ou consulter son contenu selon le rôle de l’utilisateur identifié.

### 3.1/ Contraintes et besoins

Voici la liste des contraintes pour la réalisation de votre projet :
- Votre POI aura, au minimum, un nom, un emplacement (physique, géolocalisation), une ou plusieurs images d’illustration et une description.
- Vos POIs seront répartis dans des groupes, ces groupes seront eux aussi nommés et illustrés.
- Au sein d’un groupe, les POIs ne peuvent apparaitre qu’une seule fois, et y sont seront ordonnés, un POI pourra appartenir à un nombre illimité de groupes.
- Les utilisateurs auront chacun un ou plusieurs rôles qui définiront leur niveau d’accès (administrateur / modérateur / utilisateur) 
- Les administrateurs pourront modifier n’importe quel profil utilisateur peu importe son rôle et créer/modifier/supprimer des utilisateurs/ groupes/ pois
- Les modérateurs pourront modifier les profils utilisateurs d’un niveau «utilisateur» et créer/ modifier/ supprimer les groupes et pois
- Un utilisateur ayant le rôle «utilisateur» pourra consulter les groupes et les pois et éditer son profil.
- Votre plateforme sera composée de 2 parties 
  - Un site qui permettra de créer / modifier / supprimer des ...
    - Utilisateurs
    - Groupes
    - POIs
  - Une API REST que nous développerons lors du cours correspondant
  
### 3.2/ Point de validation

Mettez-vous dans la peau du chef de projet qui reçoit la très sommaire expression des besoins décrite plus haut, réfléchissez au modèle de données que vous utiliseriez pour réaliser ce projet.  
Préparer sur papier ou votre outil préféré, un diagramme de classe pour le projet défini ci-dessus.  
Vous devrez valider ce diagramme avec l’enseignant avant de poursuivre la création de votre projet.

## 4/ Constructions des pages

La plateforme d’administration sera construite à l’aide de la base générée en utilisant le scaffolding proposé par Grails, vous devrez par contre modifier certains éléments pour que l’intégralité soit parfaitement fonctionnel.
Elle devra évidemment permettre de créer / modifier toutes les entités existantes tel que décrit dans la partie «Contraintes et besoins»

> Bonus (+2 points sur la partie projet) : Pour les parties relatives à l’ajout / modification de fichiers image, mettez en place sans utiliser d’extensions, la possibilité d’uploader les fichiers en Ajax en faisant un simple drag’n’drop du fichier sur le champ en question.

##### a.Login

Créez une page de login pour vous identifier en tant qu’utilisateur, cette donnée devra être conservée lors de la navigation, vous pourrez ainsi modifier l’index de votre projet pour qu’il pointe vers cette page
- url d’accès pour la page : /projet/login

Il va sans dire qu’avant de faire ceci, il faudra vous assurer que votre entité «User» possède les attributs nécessaires, à savoir un identifiant (qui pourrait être un mail / un identifiant à part) et un mot de passe.  
C’est une question de bon sens mais les mots de passe doivent être au minimum «hashés» (MD5 / une autre méthode de votre choix) avant d’être persistés et ce afin qu’on ne puisse pas lire ces derniers dans votre base de données.  
Malus (-5 point sur la partie projet) : Si vos mots de passe ne sont pas chiffrés.

##### b.Page d’utilisateur

Construisez les pages (liste / création/ visualisation / modification)en vous inspirant des contrôleurs et vues générées respectant les contraintes suivantes :
- url d’accès pour la page : /projet/user[/id_user[ /action ] ] 
- Si l’utilisateur en question est l’utilisateur courant (identifié),il doit pouvoir éditer toutes les informations de son profil

##### c.Les Groupes et POIs

Construisez des pages (liste / création / visualisation / modification) pour les Groupes et les POIs, tous les attributs de ces derniers devront être modifiables 
- url d’accès pour les pages : 
    - /projet/group[ /id_ group [ /action ] ]
    - /projet/poi[ /id_ poi [ /action ] ]
    
La visualisation des images devra se faire sur les différentes pages, simplement afficher le chemin de l’image n’est pas considéré comme une solution viable.  
Les formulaires de modification et de création impliquant des images devront permettre l’upload de ces dernières.
> Bonus (+2 point sur la partie projet) : Faites en sorte que la liste des POIs au sein d’un Groupe soit modifiable directement en drag’n’drop Ajax, par exemple :
> - Présentez deux listes, l’une représentant les POIs du Groupe, l’autre représentant la liste des POIs qui peuvent y être ajoutés
> - Les POIs pourront être réorganisés (ordre) au sein d’un groupe aussi en drag’n’drop

>Bonus (+2 point sur la partie projet) : Mettez en place au niveau de la gestion des Groupes et Pois une Map, cette dernière vous permettra :
> - Au niveau d’un POI de le visualiser sur la carte et de le déplacer directement depuis la carte, ce qui modifiera les coordonnées de ce dernier
> - Au niveau d’un Groupe, de visualiser l’intégralité des POI qu’il «contient» sur la carte

### Bonus

Dans ce TP vous verrez un certain nombre de parties «Bonus», chacune de ces parties, si réalisées, vous accordera des points en plus pour la partie «Projet» de votre notation (je compte au-delà de 20) qui représente 50% de votre moyenne dans cette matière. 

### Informations complémentaires

Afin de stocker les images que vous allez uploader via les différents formulaires, vous devrez les enregistrer dans votre serveur web (Apache), Grails ne mets pas à disposition d’espace de stockage de fichier persistant, si vous stockez les fichiers dans un répertoire publique de votre projet Grails, ceux-ci seront perdu au redémarrage de votre serveur d’application.  
La bonne méthode consiste à avoir :
- Un serveur d’application (Tomcat en l’occurrencepour Grails) sur un port,ex:8081
- Un serveur web en charge du stockage de fichier (Apache ici) sur un autre port, ex:8080  

Votre projet référencera le chemin interne et externe des images (path & url), la meilleure façon de faire reste de stocker uniquement le nom / la fin du chemin vers le fichier et d’avoir la base du path et de l’url dans un fichier de configuration pour pouvoir reconstruire le path et l’url à la volée.  

### Rendu

Ce projet sera noté à la fin des séances et constituera une part importante de votre notation dans ce module (moitié de votre note)  
La date limite de rendu est fixée au dimanche suivant le dernier cours que nous aurons ensemble, soit le dimanche 1er Octobre à minuit si l’emploi du temps ne subis pas de modifications.  
Tout retard entrainera une pénalité de 2 points par jours.  
La soumission du projet se fera obligatoirement via un git sur lequel vous aurez mis à jour régulièrement votre projet.  
Vous devrez envoyer un mail à mon adresse (greg.galli@tokidev.fr), le sujet du mail sera formaté de la manière suivante :  
[MBDS –Grails] Rendu projet – «Votre Nom»(sans les doubles quotes évidement), vos mails seront triés par un filtre, si vous ne respectez pas ceci, je ne verrai pas votre mail.  
Votre git devra contenir un readme précisant certains éléments que vous souhaiteriez éclaircir et 
pour chaque bonus fait, vous expliquerez brièvement comment vous avez procédé et où je peux trouver les éléments relatifs à ces derniers.  
Si vous avez des questions, adressez-moi un mail à l’adresse greg.galli@tokidev.fr, je ferai de mon mieux pour revenir vers vous le plus rapidement possible.  
Des bonus seront accordés aux groupes qui feront le choix d’implémenter des parties «Bonus» / à ceux qui s’appliqueront particulièrement sur la propreté du code.  
Un design soigné et une bonne ergonomie sont des plus qui seront pris en compte dans la notation de votre projet sans l’impacter de manière dramatique.  
Vous serez noté en tant que binôme sauf si j’estime qu’un élève a fournis beaucoup plus de travail que l’autre, auquel cas, les deux étudiants pourront avoir des notes différentes.  
Les projets copiés se verront systématiquement attribuer une note de 0. 
   
Attention : Si vous avez utilisé une base MySQL ou autre pour votre projet, vous penserez avant le rendu à repasser sur la base de donnée mémoire initialement configurée, je ne peux pas me permettre de créer une base pour chacun des groupes, si vous oubliez cette partie, un malus sera appliqué.
