<?php
/**
 * How add abstract class
 */
abstract class AbstractClass {
    abstract protected function getValue();
    abstract protected function prefixValue($prefix);

    public function printOut() {
        print $this->getValue();
        echo "<br >"; 
    }

}

class ConcreteClass1 extends AbstractClass {

    protected function getValue() {
        return 'ConcreteClass1';
    }

    public function prefixValue($prefix) {
        return "{$prefix}ConcreteClass1";
    }
}

class ConcreteClass2 extends AbstractClass {

    protected function getValue() {
        return 'ConcreteClass2';
    }

    public function prefixValue($prefix) {
        return "{$prefix}ConcreteClass2";
    }
}

$class1 = new ConcreteClass1;
$class1->printOut();
echo $class1->prefixValue('FOO_');
echo "<br />"; 


$class2 = new ConcreteClass2;
$class2->printOut();
echo $class2->prefixValue('FOO_');
echo "<br />"; 

?>