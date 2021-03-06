<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 26/05/17
 * Time: 15:02
 */

//classe que l'on va tester
require_once 'api.class.php';

class testapi extends  PHPUnit_Framework_TestCase
{

    public $api;

    function testapi()
    {
        $this->api = new api();
    }

    /**
     *  Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourObjet()
    {
        $this->assertEquals( is_object( $this->api->requeteObjet("SELECT * FROM kdi_spectacle") ),true,"test objet");
    }

    /**
     * Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourArray()
    {
        $this->assertEquals( is_array( $this->api->requeteArray("SELECT * FROM kdi_spectacle") ),true,"test array");
    }

    /**
     *  Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourObjetR1()
    {
        $this->assertEquals( is_object( $this->api->requeteObjet("SELECT idCle FROM api_key WHERE cle = 'erryyuqfgujsqfyud54SF';") ),true,"test objet");
    }

    /**
     *  Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourObjetR2()
    {
        $this->assertEquals( is_object( $this->api->requeteObjet("SELECT Spe_id FROM kdi_spectacle WHERE Spe_id = 5;") ),true,"test objet");
    }

    /**
     * Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourArrayR3()
    {
        $this->assertEquals( is_array( $this->api->requeteArray("SELECT Spe_titre as titre,Sal_nom as nom_salle,Sal_latitude as latitude,Sal_longitude as longitude
FROM kdi_salle S
INNER JOIN kdi_spectacle SP
ON S.Sal_id = SP.idSpecSalle
AND SP.Spe_id = 5;") ),true,"test array");
    }

    /**
     * Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourArrayR4()
    {
        $this->assertEquals( is_array( $this->api->requeteArray("SELECT Spe_id as id_spe,Spe_affiche as photo,Spe_titre as titre, Spe_resume_long as resume_long, Spe_resume_court as resume_court,Spe_duree as duree,Spe_acteur as acteur,Sal_id as id_salle,Sal_nom as nom_salle, Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse as adresse
FROM kdi_spectacle KSPE
INNER JOIN kdi_salle KS
ON KSPE.IdSpecSalle = KS.Sal_id
ORDER by Spe_titre,Sal_nom;") ),true,"test array");
    }

    /**
     * Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourArrayR5()
    {
        $this->assertEquals( is_array( $this->api->requeteArray("SELECT Spe_id as id_spe,Spe_affiche as photo,Spe_titre as titre, Spe_resume_long as resume_long, Spe_resume_court as resume_court,Spe_duree as duree,Spe_acteur as acteur,Sal_id as id_salle,Sal_nom as nom_salle, Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse as adresse
FROM kdi_spectacle KSPE
INNER JOIN kdi_salle KS
ON KSPE.IdSpecSalle = KS.Sal_id
WHERE Spe_id = 5
ORDER by Spe_titre,Sal_nom;") ),true,"test array");
    }

    /**
     * Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourArrayR6()
    {
        $this->assertEquals( is_array( $this->api->requeteArray("SELECT Sal_id as id_salle,Sal_nom as nom,Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse adresse, Sal_jauge as jauge
        FROM kdi_salle;") ),true,"test array");
    }

    /**
     * Methode de test pour le type que retourne la methode
     */
    public function testTypeRetourArrayR7()
    {
        $this->assertEquals( is_array( $this->api->requeteArray("SELECT Sal_id as id_salle,Sal_nom as nom,Sal_latitude as latitude, Sal_longitude as longitude, Sal_adresse adresse, Sal_jauge as jauge
        FROM kdi_salle WHERE Sal_id = 9;") ),true,"test array");
    }


}