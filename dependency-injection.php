<?php
/*
* Dependency injection is a procedure where one object supplies the dependencies of another object.
* Dependency Injection is a software design approach that allows avoiding hard-coding dependencies and 
* makes it possible to change the dependencies both at runtime and compile time
*/
class User {
    private $database = NULL;

    public function __construct(){
        $this->database = new Database('host', 'user', 'pass', 'dbname');
    }
    public function getUsers(){
        return $this->database->getAll('users');
    }
}
/*
 * The class User has implicit dependency on the specific database.
 * All dependencies should always be explicit not implicit.
 * If we wanted to change database credentials, we need to edit the User class which is not good;
 * every class should be completely modular or black box. If we need to operate further on it,
 * we should actually use its public properties and methods instead of editing it again and again.
 * The User class does not necessarily need to know about database connection,
 * it should be confined to its own functionality only.
 */

/*
 * The Dependency Injection is nothing but injecting a dependency explicitly.
 *
 * There are three ways you can inject dependencies: Constructor Injection, Setter Injection and Interface Injection.
 *
 * Constructor Injection: Constructor injection is useful when:A dependency is required and class can't work without it.
 * By using constructor injection. we make sure all its required dependencies are passed.
 *
 * Since constructor is called only at the time of instantiating a class,
 * we can make sure that its dependencies can't be changed during the life time of the object.
 *
 * Constructor injection suffer from one problem though:
 * Since constructor has dependencies, it becomes rather difficult to extend/override it in child classes.
 */
class Users
{
    private $database = null;

    /*
     * Here we are taking advantage of type hinting by specifying type of object we are expecting which is Database.
     */
    public function __construct(Database $database) {
        $this->database = $database;
    }

    public function getUsers() {
        return $this->database->getAll('users');
    }
}

$database = new Database('host', 'user', 'pass', 'dbname');
$users = new Users($database);
$users->getUsers();

/*
 * Setter Injection: Unlike Constructor injection which makes it required to have its dependencies passed,
 * setter injection can be used to have optional dependencies.User class doesn't require Database instance
 * but uses optionally for certain tasks. In this case, you would use a setter method to inject the Database into the User class
 */
class User1
{
    private $database = null;

    public function setDatabase(Database $database) {
        $this->database = $database;
    }

    public function getUsers() {
        return $this->database->getAll('users');
    }
}

$database = new Database('host', 'user', 'pass', 'dbname');
$user = new User1();
$user->setDatabase($database);
$user->getUsers();

/*
 * Interface Injection: In this type of injection, an interface enforces the dependencies for any classes that implement it,
 * Any class that needs to implement someInterface must provide Database dependency in their getUsers() methods
 */
interface someInterface {
    public function getUsers(Database $database);
}
/*
 * setter injection but even with constructor injection
 * if there are many dependencies, it becomes harder to manage all of those manually and
 * you could easily and mistakenly create more than one instances of dependencies
 * throughout your code which would result in high memory usage.
 */
?>