<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:43
 */
require 'bdd.class.php';

/**
 * Class api Objet qui va permettre d'intéragir avec la base de donnee pour renvoyer les information sous forme JSON
 */
Class api extends bdd
{

    /**
     * api constructeur
     */
    function __construct()
    {
        //On fait apelle au constructeur parent
        parent::__construct();
    }

    /**
     * Méthode qui lance des requete et renvoie sous forme d'objet
     * @param $str La requete a executer
     * @return bool|PDOStatement retourne le résultat de la requête sous forme d'objet
     */
function requeteObjet($str)
{
    //echo $str;
    try
    {
        //on prepare la requête
        $req = $this->db->prepare($str);
        //on execute la requête
        $req->execute();
        //on retourne le résultat
        return $req;
    }
    catch (Exception $e)
    {
        return false;
    }

}

    /**
     * Méthode qui lance des requete et renvoie sous forme de tableau.
     * @param $str La requête à executer
     * @return array|bool Retourne le résultat de la requête sous forme de tableau
     */
function requeteArray($str)
{
    try
    {
        //on prepare la requête
        $req = $this->db->prepare($str);
        //on execute la requête
        $req->execute();
        //on créer un tableau vide
        $tableau = array();
        //on fait une boucle sur le resultat pour la photo
        while( $row = $req->fetch(PDO::FETCH_ASSOC) )
        {
            //si la photo et presente on met l'acces a l'image sur le serveur
            if( isset( $row['photo']) )
            {
                //on concatene les information pour former un chemin vers l'image sur le serveur
                $photo = $_SERVER['SERVER_NAME']."/image/".$row['photo'];
                //on le remet dans le tableau.
                $row['photo'] = $photo;
            }
            //on met les informations dans le tableau.
            array_push($tableau, $row);
        }
        //$rst=$req->fetch(PDO::FETCH_ASSOC);
        return $tableau;
    }
    catch (Exception $e)
    {
        return false;
    }
}

//gestion erreur
function gestionErEc($type,$code_err,$msg_err,$fichier_err,$ligne_err)
{
    //requete à executer
    $str = "INSERT INTO erec_info_admin(type, code, message, fichier, ligne, date) VALUES (\"$type\",\"$code_err\",\"$msg_err\",\"$fichier_err\",\"$ligne_err\",NOW());";
    //execution de la requete via la méthode de l'objet
    return $this->requeteObjet($str);
}


//-------------cle authentification-------------------------------
    /**
     * Méthode qui regarde si la clée donnee et conforme
     * @param $cle La clée a tester
     * @return bool|PDOStatement Retourne le resultat de la requête
     */
function getCle( $cle )
{
    //requete à executer
    $str = "SELECT idCle FROM api_key WHERE cle = \"$cle\";";
    //execution de la requete via la méthode de l'objet
    return $this->requeteObjet($str);
}
//---------------geolocalisation-----------------------
    /**
     * Récupere les cordonnee geographique d'une salle
     * @param $idSpe L'identifiant du spectacle sur lequele on doit recuperer les coordonne geographique
     * @return array|bool retourne le resultat sour forme de tableau
     */
function getGeoSpe($idSpe)
{
    //requete à executer
    $str = "SELECT Spe_titre as titre,Sal_nom as nom_salle,Sal_latitude as latitude,Sal_longitude as longitude
FROM kdi_salle S
INNER JOIN kdi_spectacle SP
ON S.Sal_id = SP.idSpecSalle
AND SP.Spe_id = $idSpe;";
    //execution de la requete via la méthode de l'objet
    return $this->requeteArray($str);
}
//---------spectacle-------------
    /**
     * Methode qui retourne les information d'un spectacle precie via son identifiant
     * @param $idSpe identifiant du spectacle
     * @return bool|PDOStatement retourne sous forme d'objet le spectacle
     */
function getSpe($idSpe)
{
        //requete à executer
        $str = "SELECT Spe_id FROM kdi_spectacle WHERE Spe_id = $idSpe;";
        //execution de la requete via la méthode de l'objet
        return $this->requeteObjet($str);
}

    /**
     * Methode qui récupere tout les spectacle.
     * @return array|bool retourne le résultat sous forme de tableau associatif
     */
function getAllSpe()
{
    //requete à executer
    $str = "SELECT Spe_id as id_spe,Spe_affiche as photo,Spe_titre as titre, Spe_resume_long as resume_long, Spe_resume_court as resume_court,Spe_duree as duree,Spe_acteur as acteur,Sal_id as id_salle,Sal_nom as nom_salle, Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse as adresse
FROM kdi_spectacle KSPE
INNER JOIN kdi_salle KS
ON KSPE.IdSpecSalle = KS.Sal_id
ORDER by Spe_titre,Sal_nom;";
    //execution de la requete via la méthode de l'objet
    return $this->requeteArray($str);
    //return $this->requeteArray($str);
}

    /**
     * Méthode qui retourne un spectacle en particulier
     * @param $idSpe identifiant du spectacle
     * @return array|bool retourne le resultat sous forme de tableau associatif
     */
function getSpeId( $idSpe )
{
    //requete à executer
    $str = "SELECT Spe_id as id_spe,Spe_affiche as photo,Spe_titre as titre, Spe_resume_long as resume_long, Spe_resume_court as resume_court,Spe_duree as duree,Spe_acteur as acteur,Sal_id as id_salle,Sal_nom as nom_salle, Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse as adresse
FROM kdi_spectacle KSPE
INNER JOIN kdi_salle KS
ON KSPE.IdSpecSalle = KS.Sal_id
WHERE Spe_id = $idSpe
ORDER by Spe_titre,Sal_nom;";
    //execution de la requete via la méthode de l'objet
    return $this->requeteArray($str);
    //return $this->requeteArray($str);
}
//-----------SALLE--------------------
    /**
     * Methode qui retourne les salle existante
     * @return array|bool
     */
function getAllSalle()
{
        //requete à executer
        $str = "SELECT Sal_id as id_salle,Sal_nom as nom,Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse adresse, Sal_jauge as jauge
        FROM kdi_salle;";
        //execution de la requete via la méthode de l'objet
        return $this->requeteArray($str);
        //return $this->requeteArray($str);
}

    /**
     * Methode qui retourne une salle en particulier
     * @param $idSalle identifiant de la salle
     * @return array|bool retourne le résulltat sous forme de tableau associatif
     */
    function getSalleId( $idSalle )
    {
        //requete à executer
        $str = "SELECT Sal_id as id_salle,Sal_nom as nom,Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse adresse, Sal_jauge as jauge
        FROM kdi_salle WHERE Sal_id = $idSalle;";
        //execution de la requete via la méthode de l'objet
        return $this->requeteArray($str);
        //return $this->requeteArray($str);
    }

}

?>