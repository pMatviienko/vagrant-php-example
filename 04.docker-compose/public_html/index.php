<h1>Hello From Docker-compose</h1>
<pre>
<?php
echo "MYSQL:\n";
try{
    $connection = new PDO("mysql:host=db-server", 'root', 'root');
} catch( \Exception $e){
    echo $e->getMessage();
}
var_dump($connection->query('SHOW DATABASES;')->fetchAll());
echo "--------------------------------------------------------\n";
echo "SERVER:\n";
var_dump($_SERVER);
?>
</pre>
