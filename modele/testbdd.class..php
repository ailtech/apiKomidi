<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 26/05/17
 * Time: 15:01
 */

//classe que l'on va tester
require_once 'bdd.class.php';

/**
 * Class testbdd Classs de TestUnitaire sur la classe bdd
 */
class testbdd extends  PHPUnit_Framework_TestCase
{
    /**
     * Attribut pour objet sur lequel on va realiser des test
     * @var bdd $bdd Attribut qui va conteniir l'objet sur lequel on fait des test
     */
    public $bdd;

    /**
     * testbdd constructeur.
     */
    function testbdd()
    {
        //instanciation de l'objet a tester
        $this->bdd = new bdd();
    }

    /**
     * On teste si la connection est bien programmer
     */
    public function testDbConnectionNotNull(){

        $this->assertNotNull( $this->bdd->getCo(),"**retour non null**" );
    }
}