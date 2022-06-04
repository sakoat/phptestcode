<?php
/**
 * Anonymous function is a function without any user defined name. 
 * Such a function is also called closure or lambda function. 
 * Sometimes, you may want a function for one time use.
 *  Closure is an anonymous function which closes over the environment in which it is defined.
 * You need to specify use keyword in it.
 * Most common use of anonymous function to create an inline callback function.
 * There is no function name between the function keyword and the opening parenthesis.
 * There is a semicolon after the function definition because anonymous function definitions are expressions
 * Function is assigned to a variable, and called later using the variable’s name.
 * When passed to another function that can then call it later, it is known as a callback.
 * Return it from within an outer function 
 * so that it can access the outer function’s variables. This is known as a closure.
 */

 $name = 'Hossen';
 $greent = function() use ($name) {
    echo "Hi $name Hello World! ";
 };
 $greent();

/**
 * Callbacks
 */

 function string($string, $callback) {
    $result = array(
         'upper' => strtoupper($string),
         'lower' => strtolower($string)
    );
    if (is_callable($callback)) {
        call_user_func($callback, $result);
    }
 }
 string('Alex', function($name){
     echo $name['lower'];
 })

/**
* Anonymous and Closure in laravel and cakephp
*/
$Product = Product::whereHas('sale', function(Builder $query) { 
    $query->where('provider_id', '=', 1);
})->get();

$books = Book::with(['author', 'publisher'])->get();

// Retrieve posts with at least one comment containing words like code%...
$posts = Post::whereHas('comments', function (Builder $query) {
    $query->where('content', 'like', 'code%');
})->get();

// Retrieve posts with at least ten comments containing words like code%...
$posts = Post::whereHas('comments', function (Builder $query) {
    $query->where('content', 'like', 'code%');
}, '>=', 10)->get();

$users = User::with(['posts' => function ($query) { 
    $query->where('title', 'like', '%code%');
}])->get();

$users = User::with(['posts' => function ($query) {
    $query->orderBy('created_at', 'desc');
}])->get();


$query = $articles->find()->matching('Comments.Users', function ($q) use ($username) {
    return $q->where(['username' => $username]);
});
  
?> 