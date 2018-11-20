<h1>Hello From Docker-compose</h1>
<table>
    <tr>
        <th>Mysql</th>
        <th>$_SERVER</th>
    </tr>
    <tr>
        <td valign="top">
            <pre>
                <?php
                try{
                    $connection = new PDO("mysql:host=db-server", 'root', 'root');
                } catch( \Exception $e){
                    echo $e->getMessage();
                }
                var_dump($connection->query('SHOW DATABASES;')->fetchAll());
                ?>
            </pre>
        </td>
        <td>
            <pre>
                <?php var_dump($_SERVER); ?>
            </pre>

        </td>
    </tr>
</table>
