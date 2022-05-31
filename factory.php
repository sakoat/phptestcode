<?php
/**
 * Factory design patternin php
 * with example
 * help links: https://refactoring.guru/design-patterns/decorator
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

 $pulsar = AutomobileFactory::create('ktm', 'pulsar');
 
 print_r($pulsar->getMakeAndModel()); 

?>