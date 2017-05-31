<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:00
 */
/**
 * Fichier de configuration permet d'instancier les objet et mettre des configuration dans le programme si besoin s'en suit.
 *
 * @copyright ailTECH
 * @author Alexandre
 * @version 1
 * @since 06/03/2017
 */

try
{
    $api_komidi = new api();//on instancie un objet api
}
catch(Exception $e)
{
    echo $e->getMessage();
}
finally
{

}

?>