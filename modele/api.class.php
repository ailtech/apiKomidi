<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:43
 */
require 'bdd.class.php';

Class api extends bdd{

    function __construct(){

        parent::__construct();
    }

function requeteObjet($str){
    //echo $str;
    try{
        $req = $this->db->prepare($str);
        $req->execute();
        return $req;
    }
    catch (Exception $e){
        return false;
    }

}
function requeteArray($str){
    try{
        $req = $this->db->prepare($str);
        $req->execute();
        $tableau = array();
        while( $row = $req->fetch(PDO::FETCH_ASSOC) ){
            if( isset( $row['photo']) ){
                $photo = $_SERVER['SERVER_NAME']."/image/".$row['photo'];
                $row['photo'] = $photo;
            }
            array_push($tableau, $row);
        }
        //$rst=$req->fetch(PDO::FETCH_ASSOC);
        return $tableau;
    }
    catch (Exception $e){
        return false;
    }
}

//gestion erreur
function gestionErEc($type,$code_err,$msg_err,$fichier_err,$ligne_err){
    $str = "INSERT INTO erec_info_admin(type, code, message, fichier, ligne, date) VALUES (\"$type\",\"$code_err\",\"$msg_err\",\"$fichier_err\",\"$ligne_err\",NOW());";
    return $this->requeteObjet($str);
}


//-------------cle authentification-------------------------------
function getCle( $cle ){
    $str = "SELECT idCle FROM api_key WHERE cle = \"$cle\";";
    return $this->requeteObjet($str);
}
//---------------geolocalisation-----------------------
function getGeoSpe($idSpe){
    $str = "SELECT Spe_titre as titre,Sal_nom as nom_salle,Sal_latitude as latitude,Sal_longitude as longitude
FROM kdi_salle S
INNER JOIN kdi_spectacle SP
ON S.Sal_id = SP.idSpecSalle
AND SP.Spe_id = $idSpe;";
    return $this->requeteArray($str);
}
//---------spectacle-------------
function getSpe($idSpe){
        $str = "SELECT Spe_id FROM kdi_spectacle WHERE Spe_id = $idSpe;";
        return $this->requeteObjet($str);
    }

function getAllSpe(){
    $str = "SELECT Spe_id as id_spe,Spe_affiche as photo,Spe_titre as titre, Spe_resume_long as resume_long, Spe_resume_court as resume_court,Spe_duree as duree,Spe_acteur as acteur,Sal_id as id_salle,Sal_nom as nom_salle, Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse as adresse
FROM kdi_spectacle KSPE
INNER JOIN kdi_salle KS
ON KSPE.IdSpecSalle = KS.Sal_id
ORDER by Spe_titre,Sal_nom;";
    return $this->requeteArray($str);
    //return $this->requeteArray($str);
}

function getSpeId( $idSpe ){
    $str = "SELECT Spe_id as id_spe,Spe_affiche as photo,Spe_titre as titre, Spe_resume_long as resume_long, Spe_resume_court as resume_court,Spe_duree as duree,Spe_acteur as acteur,Sal_id as id_salle,Sal_nom as nom_salle, Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse as adresse
FROM kdi_spectacle KSPE
INNER JOIN kdi_salle KS
ON KSPE.IdSpecSalle = KS.Sal_id
WHERE Spe_id = $idSpe
ORDER by Spe_titre,Sal_nom;";
    return $this->requeteArray($str);
    //return $this->requeteArray($str);
}
//-----------SALLE--------------------
function getAllSalle(){
        $str = "SELECT Sal_id as id_salle,Sal_nom as nom,Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse adresse, Sal_jauge as jauge
FROM kdi_salle;";
        return $this->requeteArray($str);
        //return $this->requeteArray($str);
    }
    function getSalleId( $idSalle ){
        $str = "SELECT Sal_id as id_salle,Sal_nom as nom,Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse adresse, Sal_jauge as jauge
FROM kdi_salle WHERE Sal_id = $idSalle;";
        return $this->requeteArray($str);
        //return $this->requeteArray($str);
    }

}

?>