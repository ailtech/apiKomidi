<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 17/03/17
 * Time: 11:33
 */
/**
 * Renvoie sous forme JSON la liste des spetacle
 *
 * @copyright ailTECH
 * @author Alexandre
 * @version 1
 * @since 06/03/2017
 */
try
{
    //on fait appelle au fichier de configuration pour avoir acce a l'objet api
    require 'config/config.php';
    //erreur et exception capturer et envoyer par email a l'administrateur
    set_error_handler('gestionDesErreurs');
    set_exception_handler("gestionDesExceptions");
    //on precise que l'on renvoie du json
    header("Content-type:application/json");

    if( !empty( $_GET['key'] ) )
    {
        //on teste la clée
        $cle = $_GET['key'];
        if( $api_komidi->getCle( $cle )->rowCount() == 0 )
        {
            affichageJsonErreur("Votre clée de connection est invalide.");
            //echo "key inexiistante dans bdd";
        }
        else
        {
            //si cle valide on extrait et on renvoie le fichier json
            if( $resultat = $api_komidi->getAllSpe() )
            {
                //cas ou on a pu lancer la requete
                //echo print_r($resultat);//debug
                //echo $resultat[0]['photo'];//debug
                affichageJson( "Liste des spectacles trouvee, traiter et renvoyer." , $resultat);
            }
            else
            {
                affichageJsonErreur("Impossible d'acceder a la base de donne.");
            }
        }
    }
    else
    {
        affichageJsonErreur("Votre clée de connection est inexistante.");
    }
}
catch( Exception $e)
{
    //echo $e->getMessage();
    affichageJsonErreur("erreur inconnue survenue.");
}
finally
{

}

?>