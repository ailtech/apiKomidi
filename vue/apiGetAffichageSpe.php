<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 17/03/17
 * Time: 11:33
 */
try{
    require 'config/config.php';

    //on precise que l'on renvoie du json
    header("Content-type:application/json");
    if( !empty( $_GET['key'] ) ){
        //on teste la clée
        $cle = $_GET['key'];
        if( $api_komidi->getCle( $cle )->rowCount() == 0 ){
            affichageJsonErreur("Votre clée de connection est invalide.");
            //echo "key inexiistante dans bdd";
        }
        else{
            //si cle valide on extrait et on renvoie le fichier json
            if( $resultat = $api_komidi->getAllSpe() ){
                //cas ou on a pu lancer la requete
                affichageJson( "Liste des spectacles trouvee, traiter et renvoyer." , $resultat);
            }
            else{
                affichageJsonErreur("Impossible d'acceder a la base de donne.");
            }
        }
    }
    else{
        affichageJsonErreur("Votre clée de connection est inexistante.");
    }
}
catch( Exception $e){
    //echo $e->getMessage();
    affichageJsonErreur("erreur inconnue survenue.");
}
finally{

}

?>