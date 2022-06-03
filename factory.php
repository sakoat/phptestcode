<?php
/**
 * Factory design patternin php
 * with example
 * help links: https://refactoring.guru/design-patterns/decorator
 * Factory is a creational design patterns example
 * Factory Method is a creational design pattern that provides an interface for creating objects in a superclass,
 * but allows subclasses to alter the type of objects that will be created.
 * Design Patterns can be used in various situations to solve similar or common problems
 * Three types of design patterns - Creational, Structural and Behavioral patterns.
 * Creational Patterns: Design patterns that are used in object creation mechanisms, to create objects that can be decoupled from the system that implemented them.
 * Structural Patterns: This eases the design by identifying simple ways to realize relationships between entities
 * Behavioral Patterns: They are used to manage relationships, responsibilities, and algorithms between objects
 */

class Automobile {
    private $bikeMake;
    private $bikeModel;
    
    public function __construct($make, $model) {
       $this->bikeMake = $make;
       $this->bikeModel = $model;
    }
    
    public function getMakeAndModel() {
       return $this->bikeMake . ' ' . $this->bikeModel;
    }
 }
 
 class AutomobileFactory {
    public static function create($make, $model) {
       return new Automobile($make, $model);
    }
 }
 
 $pulsar = AutomobileFactory::create('ktm', 'Pulsar');
 print_r($pulsar->getMakeAndModel());
 

?>