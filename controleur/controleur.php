<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:00
 */
try
{
    require 'modele/api.class.php';
    //on fait appelle au module avoir la geolocalisation d'un spectacle
    function vueGetGeoSpe()
    {
        require 'vue/apiGetGeoSpe.php';
    }
    //lolrsque on applle les spectacle
    function vueGetAllSpe()
    {
        require 'vue/apiGetAffichageSpe.php';
    }
    //lorsque l' on veut toute les alle
    function vueGetAllSalle()
    {
        require 'vue/apiGetAffichageSalle.php';
    }
    //lorsque l' on veut une salle precise
    function vueGetSalleId()
    {
        require 'vue/apiGetSalleId.php';
    }
    //lorsque l'on applleun spectacle precis
    function vueGetSpeId()
    {
        require 'vue/apiGetAffichageSpeId.php';
    }
    //lorsque l'on veut savoir si une mise a jour est disponible
    function vueGetMaj()
    {
        require 'vue/apiGetMaj.php';
    }
}
catch( Exception $e )
{
    echo "Erreur rencontrer:".$e->getMessage();
}
finally
{

}

?>