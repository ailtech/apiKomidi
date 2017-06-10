
<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:01
 */
//on indique que l'on manipule les fichier json
header("Content-type: application/json; charset=utf-8");
header("Access-Control-Allow-Origin: *");

try
{
    require 'controleur/controleur.php';
    require 'config/fonction.php';
    // regarde si les information des url est bien envoyer
    if( isset($_GET['action']) and !empty($_GET['action']) )
    {
        //lorsquon appelle les coordonne geographique pour geolocalisation
        if( $_GET['action'] == "apiGetGeoSpe")
        {
            vueGetGeoSpe();
            exit();
        }
        //Lorsque on appellle l'affichage des spectacle
        if( $_GET['action'] == "apiGetAllSpe")
        {
            vueGetAllSpe();
            exit();
        }
        //Lorsque on appellle l'affichage des salle
        if( $_GET['action'] == "apiGetAllSalle")
        {
            vueGetAllSalle();
            exit();
        }
        //Lorsque on appellle l'affichage d'une salle precise
        if( $_GET['action'] == "apiGetSalleId")
        {
            vueGetSalleId();
            exit();
        }
        //Lorsque on appellle l'affichage d'un spectacle precie
        if( $_GET['action'] == "apiGetSpeId")
        {
            vueGetSpeId();
            exit();
        }
        //lorsquon appelle les coordonne geographique pour geolocalisation
        if( $_GET['action'] == "apiGetMaj")
        {
            vueGetMaj();
            exit();
        }
        affichageJsonErreur( "Cette option n'existe pas ou n'est pas fournie par l'api." );


    }else
    {
        affichageJsonErreur( "Une erreur est survenue, vérifier les information envoyée." );
    }
}
catch( Exception $e)
{
    affichageJsonErreur( "Une erreur inconnue s'est soulevée." );
}
finally
{

}


?>

