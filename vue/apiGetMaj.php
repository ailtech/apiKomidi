<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 10/06/17
 * Time: 13:47
 */
try
{
    //on fait appelle au fichier de configuration pour avoir acce a l'objet api
    include 'config/config.php';
    //on capture les exception et erreur et on les envoie a l'administrateur
    set_error_handler('gestionDesErreurs');
    set_exception_handler("gestionDesExceptions");
    //on precise que l'on renvoie du json
    header("Content-type:application/json");

    //on verifie si la version a était envoyer
    if( !empty( $_GET['version'] ) ){
        //on recupere la maj actuele
        $maj = $api_komidi->getMaj();
        //on extrait la version de la variable global
        $version = $_GET['version'];
        //intancie tableau
        $tableau = array();
        //on ectrait la version de la requete
        while( $row = $maj->fetch(PDO::FETCH_ASSOC) ){
            $majVersion = $row['version'];
            //on met les informations dans le tableau.
            array_push($tableau, $row);
        }

        //on verifie
        if( $version == $majVersion ){
            //appli a jour

            affichageJson( "Aucune mise à jour disponible." , $tableau);
        }
        else{
            //appli non a jour
            affichageJson( "Votre application n'est pas à jour." , $tableau);
        }

    }
    else{
        //erreur lors de recuperation de la version
        affichageJsonErreur("version absente.");
    }

}
catch (Exception $e)
{
    //echo $e->getMessage();
}
finally
{

}
?>