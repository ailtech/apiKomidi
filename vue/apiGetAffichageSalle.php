<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 17/03/17
 * Time: 12:44
 */
/**
 * Renvoie sous forme JSON la liste des salle existante
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
    //erreur et exception capturer et envoyer a l'administrateur
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
            //ca ou cle valide
            if( $resultat = $api_komidi->getAllSalle() )
            {
                //on affcihe le fichier json
                affichageJson( "Liste des salle trouvee, traiter et renvoyer." , $resultat);
            }
            else
            {
                //on afiche fichier json erreur
                affichageJsonErreur("Impossible de se connecter a la base de donnee.");
            }
        }
    }
    else
    {
        affichageJsonErreur("Votre clée de connection est inexistante.");
    }
}
catch( Exception $e )
{

}
finally
{

}
?>