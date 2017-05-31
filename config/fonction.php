<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 21:46
 */
/**
 * Fichier qui contient les fonction qui permet de renvoyer les erreur, à l'administrateur pour être au cournat d'eventuelle erreur et exception.
 *
 * @copyright ailTECH
 * @author Alexandre
 * @version 1
 * @since 06/03/2017
 */
//on indique que l'on manipule les fichier json
header("Content-type: application/json; charset=utf-8");

try
{

    function affichageJsonErreur( $message )
    {
        //on instancie le tableau de reponse json
        $reponse = array();
        //si variable json non existante on renvoie une reponse
        $reponse['etat'] = false;
        $reponse['message'] = $message;
        $reponse['reponse']["resultat"] = "";
        //on convertit l'array en Json
        $resultatFormatJson = json_encode( $reponse );
        //on regarde si la conversion ce passe bien
        if( $resultatFormatJson )
        {
            //si elle se passe bien on l'affiche
            echo $resultatFormatJson;

        }
        else
        {
            //si elle se passe mal on renvoyer un son erreur
            echo "{
                    'etat':false,
                    'message':\"$message\",
                    \"reponse\":{\"resultat\":\"\"}
                
                 }";

        }
    }
    //fonction affcihage de json reussite
    function affichageJson( $message , $resultat)
    {
        //on instancie le tableau de reponse json
        $reponse = array();
        //si variable json non existante on renvoie une reponse
        $reponse['etat'] = true;
        $reponse['message'] = $message;
        $reponse['reponse']["resultat"] = $resultat;
        //on convertit l'array en Json
        $resultatFormatJson = json_encode( $reponse );
        //on regarde si la conversion ce passe bien
        if( $resultatFormatJson )
        {
            //si elle se passe bien on l'affiche
            echo $resultatFormatJson;

        }
        else
        {
            //si elle se passe mal on renvoyer un son erreur
            echo "{
                    'etat':false,
                    'message':\"$message\",
                    \"reponse\":{\"resultat\":\"\"}
                 }";

        }
    }
    //-------------------------------------------
    function gestionDesErreurs($type, $message, $fichier, $ligne)
    {

        switch ($type)
        {
            case E_USER_ERROR:

                $type_erreur = "Erreur fatale";

                break;


            case E_WARNING:

            case E_USER_WARNING:

                $type_erreur = "Avertissement";

                break;


            case E_NOTICE:

            case E_USER_NOTICE:

                $type_erreur = "Remarque";

                break;


            case E_STRICT:

                $type_erreur = "Syntaxe Obsolète";

                break;


            default:

                $type_erreur = "Erreur inconnue";

                break;

        }

        $msg_erreur = $type_erreur.":".$fichier.":".$ligne.":".$message;
        //envoyeErreur($msg_erreur);
        //echo $msg_erreur;

    }
    //--------------------------------------------------
    function gestionDesExceptions($exception)
    {

        $msg_erreur = "ERREUR : ".$exception->getMessage().":".$exception->getFile().":".$exception->getLine();
        //envoyeErreur($msg_erreur);
        //echo $msg_erreur;

    }
    //---------------------------------------------------
    function envoyeErreur($msg_erreur)
    {

        if( strlen($msg_erreur) <= 70 )
        {
            mail("lefevre451@gmail.com", "Rapport Erreur Exception.", $msg_erreur);
        }
        else
        {
            $msg_erreur = wordwrap($msg_erreur,70);
            mail("lefevre451@gmail.com", "Rapport Erreur Exception.", $msg_erreur);
        }
    }
    //-----------------------------------------------------
}
catch(Exception $e)
{
    echo $e->getMessage();
}
finally
{

}

?>