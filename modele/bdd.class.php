<?php
/**
 * Created by PhpStorm.
 * User: alexandre
 * Date: 15/03/17
 * Time: 20:01
 */

/**
 * Class bdd Objet qui permet la connection à la base de donnee.
 */
Class bdd
{
    /**
     * Propriété qui contient le sgbdr a utiliser
     * @var string $SGBDR Contient le sgbdr à utiliser
     */
    protected $SGBDR = "mysql";
    /**
     * Propriétée qui contient l'adresse à utiliser pour la connection
     * @var string $HOTE Contient l'adresse de la base de donnee
     */
    protected $HOTE = "localhost";
    /**
     * Propriétée qui contient le port à utiliser
     * @var string $PORT Contient port a utiliser
     */
    protected $PORT ="3306";
    /**
     * Propriétéé qui contient la base de donne à utiliser
     * @var string $BDD Contient la base de donne à utiliser
     */
    protected $BDD = "db_komidi";
    /**
     * Propriéte qui contient l'utilisateur à utiliser
     * @var string $USER Contient l'utilisateur à utiliser
     */
    protected $USER = "root";
    /**
     * Propriéte le mot de passe de connexion à la base de donnee
     * @var string $MDP Contient le mot de passe de connexion à la base de donnee
     */
    protected $MDP = "root";
    /**
     * Proprietée qui contient les dsn
     * @var string $DSN dsn
     */
    protected $DSN;
    /**
     * Propriété contenant les option de la bdd
     * @var array $dboptions préparation options
     */
    protected $dboptions = array(
        PDO::ATTR_PERSISTENT => FALSE,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",);
    /**
     * Propriéteé connection à la base de donnee
     * @var PDO $db Connection à la base de donnee
     */
    protected $db;

    /**
     * Constructeur de l'objet
     * bdd constructeur.
     */
    function __construct()
    {
        //on concaténe les informmation pour le dsn
        $this->DSN = $this->SGBDR.":host=".$this->HOTE.";dbname=".$this->BDD;

        try
        {
            //initialisation de la connexion à la base de donnee
            $this->db = new PDO($this->DSN, $this->USER, $this->MDP, $this->dboptions);
        }
        catch(PDOException $e)
        {
            //on affiche le message d'erreur si il y en a un
            echo $e->getMessage();
        }
    }

    /**
     * Méthode qui retourne la connexion de la base de donnee
     * @return PDO Connexion de la base de donnee
     */
    public function getCo()
    {
        //retourne connexion à la base de donnee
        return $this->db;
    }

}
?>