<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:55
 */
/**
 * Renvoie sous forme JSON la latitude et longitude d'une salle
 *
 * @copyright ailTECH
 * @author Alexandre
 * @version 1
 * @since 06/03/2017
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
    //on commence les teste pour voir si les info envoyer sont bien

    if( !empty($_GET['key']) )
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
            if( !empty($_GET['idSpe'])    )
            {//a rajouetr
                //on teste le spectacle
                $idSpe = $_GET['idSpe'];//on initilaise dans une variable

                        if( $api_komidi->getSpe($idSpe)->rowCount() == 0 )
                        {
                            affichageJsonErreur("Ce club n'existe pas.");
                        }
                        else
                        {
                            if( $resultat = $api_komidi->getGeoSpe($idSpe) )
                            {
                                //enfin la reponse de l'api avec les information
                                affichageJson( "Spectacle trouvee, traiter et renvoyer." , $resultat);
                            }
                            else
                            {
                                affichageJsonErreur("Requete impossible.");
                            }
                        }



            }
            else
            {
                affichageJsonErreur("Un element attendu n'est pas du bon type.");
            }
        }
    }
    else
    {
        affichageJsonErreur("Votre clée de connection est invalide, inexistante.");
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