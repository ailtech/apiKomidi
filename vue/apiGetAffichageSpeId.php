<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 17/03/17
 * Time: 13:31
 */
/**
 * Renvoie sous forme JSON les informations sur un spectacle precis
 *
 * Puis vous pouvez continuer avec une description plus détaillée
 * avec autant de lignes que vous le désirez.
 * Vous pouvez déclarer vos variables et constantes.
 * Vous pouvez insérer des liens vers des ressources externes
 *
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
    //erreur et exception capturer et envoiyer par mail a l'administrateur
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
            if( !empty( $_GET['idSpe']) )
            {
                //on extrait la donne
                $idSpe = $_GET['idSpe'];
                //on lance la requete
                $resultat = $api_komidi->getSpeId( $idSpe );
                //on verifie si le spectacle existe
                if( count($resultat) == 0 )
                {
                    // cas ou le spectacle nexiste pas
                    affichageJsonErreur("Spectacle inconnue a la base de donne.");
                }
                else
                {
                    affichageJson( "Spectacle trouvee, traiter et renvoyer." , $resultat);

                }
            }
            else
            {
                affichageJsonErreur("Spectacle inexistant dans la base de donne.");
            }
            /*
            if( $resultat = $api_komidi->getAllSpe() ){
                //cas ou on a pu lancer la requete
                affichageJson( "Liste des spectacles trouvee, traiter et renvoyer." , $resultat);
            }
            else{
                affichageJsonErreur("Impossible d'acceder a la base de donne.");
            }
            */
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