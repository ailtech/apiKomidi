<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:01
 */

Class bdd{
    //propriéte
    protected $SGBDR = "mysql";
    protected $HOTE = "localhost";
    protected $PORT ="3306";
    protected $BDD = "db_komidi";
    protected $USER = "root";
    protected $MDP = "root";
    protected $DSN;
    protected $dboptions = array(
        PDO::ATTR_PERSISTENT => FALSE,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",);
    protected $db;
    //constructeur
    function __construct(){
        $this->DSN = $this->SGBDR.":host=".$this->HOTE.";dbname=".$this->BDD;
        try{

            $this->db = new PDO($this->DSN, $this->USER, $this->MDP, $this->dboptions);
        }
        catch(PDOException $e){
            echo $e->getMessage();
        }
    }

    public function getCo(){
        return $this->db;
    }

}
?>