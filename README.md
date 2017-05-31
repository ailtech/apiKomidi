# apiKomidi
depot pour l'api de komidi

1.
Importer le fichier baseDonneKomidiscope.sql dans votre serveur de base de donne ATTENTION dans le fichier il faut modifier 
les ligne 5 : CREATE USER 'komidi'@'localhost' IDENTIFIED BY 'azerty'; a la place de localhost l'adresse de votre serveur 
de base de donnee et a la place de azerty le mot de passe voulue.
ligne 5: GRANT INSERT,SELECT,UPDATE ON db_komidi. * TO 'komidi'@'localhost'; remplacer localhost par l'adrese de votre serveur.

2.Dans le fichier ./modele/bdd.class.php, il faut remplacer les ligne:
    ligne 23: protected $HOTE = "localhost"; Remplacer localhost par l'adresse du serveur.
    ligne 38: protected $USER = "root"; Remplacer root par le nom de l'utilisateur
    ligne 43: protected $MDP = "root"; Remplacer pâr le mot de passe de connection de la base de donnee
    