<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 21:46
 */
//on indique que l'on manipule les fichier json
header("Content-type: application/json; charset=utf-8");

try{

    function affichageJsonErreur( $message ){
        //on instancie le tableau de reponse json
        $reponse = array();
        //si variable json non existante on renvoie une reponse
        $reponse['etat'] = false;
        $reponse['message'] = $message;
        $reponse['reponse']["resultat"] = "";
        //on convertit l'array en Json
        $resultatFormatJson = json_encode( $reponse );
        //on regarde si la conversion ce passe bien
        if( $resultatFormatJson ){
            //si elle se passe bien on l'affiche
            echo $resultatFormatJson;

        }
        else{
            //si elle se passe mal on renvoyer un son erreur
            echo "{
                    'etat':false,
                    'message':\"$message\",
                    \"reponse\":{\"resultat\":\"\"}
                
                 }";

        }
    }
    //fonction affcihage de json reussite
    function affichageJson( $message , $resultat){
        //on instancie le tableau de reponse json
        $reponse = array();
        //si variable json non existante on renvoie une reponse
        $reponse['etat'] = true;
        $reponse['message'] = $message;
        $reponse['reponse']["resultat"] = $resultat;
        //on convertit l'array en Json
        $resultatFormatJson = json_encode( $reponse );
        //on regarde si la conversion ce passe bien
        if( $resultatFormatJson ){
            //si elle se passe bien on l'affiche
            echo $resultatFormatJson;

        }
        else{
            //si elle se passe mal on renvoyer un son erreur
            echo "{
                    'etat':false,
                    'message':\"$message\",
                    \"reponse\":{\"resultat\":\"\"}
                 }";

        }
    }
    function affichageJsonBoucle( $message , $resultat){

    }
}
catch(Exception $e){
    echo $e->getMessage();
}
finally{

}

?>