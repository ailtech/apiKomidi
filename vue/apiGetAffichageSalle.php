<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 17/03/17
 * Time: 12:44
 */
try{
    require 'config/config.php';
    //on precise que l'on renvoie du json
    set_error_handler('gestionDesErreurs');
    set_exception_handler("gestionDesExceptions");
    header("Content-type:application/json");


    if( !empty( $_GET['key'] ) ){
        //on teste la clée
        $cle = $_GET['key'];
        if( $api_komidi->getCle( $cle )->rowCount() == 0 ){
            affichageJsonErreur("Votre clée de connection est invalide.");
            //echo "key inexiistante dans bdd";
        }
        else{
            //ca ou cle valide
            if( $resultat = $api_komidi->getAllSalle() ){
                //on affcihe le fichier json
                affichageJson( "Liste des salle trouvee, traiter et renvoyer." , $resultat);
            }
            else{
                //on afiche fichier json erreur
                affichageJsonErreur("Impossible de se connecter a la base de donnee.");
            }
        }
    }
    else{
        affichageJsonErreur("Votre clée de connection est inexistante.");
    }
}
catch( Exception $e ){

}
finally{

}
?>