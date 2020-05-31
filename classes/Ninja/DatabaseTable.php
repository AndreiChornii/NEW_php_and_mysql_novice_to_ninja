<?php

namespace Ninja;

class DatabaseTable {

    private $pdo;
    private $table;
    private $primaryKey;
    private $className;
    private $constructorArgs;

    public function __construct(\PDO $pdo, string $table, string $primaryKey, string $className = '\stdClass', array $constructorArgs = []) {
        $this->pdo = $pdo;
        $this->table = $table;
        $this->primaryKey = $primaryKey;
        $this->className = $className;
        $this->constructorArgs = $constructorArgs;
    }

    private function query($sql, $parameters = []) {
        $query = $this->pdo->prepare($sql);
        $query->execute($parameters);
        return $query;
    }

    public function total($field = null, $value = null) {
        $sql = 'SELECT COUNT(*) FROM `' . $this->table . '`';
        $parameters = [];
        
        if (!empty($field)) {
            $sql .= ' WHERE `' . $field . '` = :value';
            $parameters = ['value' => $value];
        }
        $query = $this->query($sql, $parameters);
        $row = $query->fetch();
        return $row[0];
    }

    public function findById($value) {
        $query = 'SELECT * FROM `' . $this->table . '` WHERE `' . $this->primaryKey . '` = :value';

        $parameters = [
            'value' => $value
        ];

        $query = $this->query($query, $parameters);

        return $query->fetchObject($this->className, $this->constructorArgs);
    }

    public function find($column, $value, $limit = null, $offset = null) {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE ' .
                $column . ' = :value';
        $parameters = [
            'value' => $value
        ];
        if ($limit != null) {
            $query .= ' LIMIT ' . $limit;
        }
        if ($offset != null) {
            $query .= ' OFFSET ' . $offset;
        }
        $result = $this->query($query, $parameters);
        return $result->fetchAll(\PDO::FETCH_CLASS, $this->className, $this->constructorArgs);
    }

    public function deleteWhere($column, $value) {
        $query = 'DELETE FROM ' . $this->table . '
    WHERE ' . $column . ' = :value';
        $parameters = [
            'value' => $value
        ];
        $query = $this->query($query, $parameters);
    }

    private function insert($fields) {
        $query = 'INSERT INTO `' . $this->table . '` (';

        foreach ($fields as $key => $value) {
            $query .= '`' . $key . '`,';
        }

        $query = rtrim($query, ',');

        $query .= ') VALUES (';


        foreach ($fields as $key => $value) {
            $query .= ':' . $key . ',';
        }

        $query = rtrim($query, ',');

        $query .= ')';

        $fields = $this->processDates($fields);

//                var_dump($fields);
//                echo $query;

        $this->query($query, $fields);
        return $this->pdo->lastInsertId();
    }

    private function update($fields) {
        $query = ' UPDATE `' . $this->table . '` SET ';

        foreach ($fields as $key => $value) {
            $query .= '`' . $key . '` = :' . $key . ',';
        }

        $query = rtrim($query, ',');

        $query .= ' WHERE `' . $this->primaryKey . '` = :primaryKey';

        //Set the :primaryKey variable
        $fields['primaryKey'] = $fields['id'];

        $fields = $this->processDates($fields);

//                var_dump($fields);
//                echo $query;

        $this->query($query, $fields);
    }

    public function delete($id) {
        $parameters = [':id' => $id];

        $this->query('DELETE FROM `' . $this->table . '` WHERE `' . $this->primaryKey . '` = :id', $parameters);
        
        return $result->fetchAll(\PDO::FETCH_CLASS, $this->className, $this->constructorArgs);
    }

    public function findAll($orderBy = null, $limit = null, $offset = null) {
        
        $query = 'SELECT * FROM ' . $this->table;
        if ($orderBy != null) {
            $query .= ' ORDER BY ' . $orderBy;
        }
        if ($limit != null) {
            $query .= ' LIMIT ' . $limit;
        }
        if ($offset != null) {
            $query .= ' OFFSET ' . $offset;
        }
        $result = $this->query($query);

        return $result->fetchAll(\PDO::FETCH_CLASS, $this->className, $this->constructorArgs);
    }

    private function processDates($fields) {
        foreach ($fields as $key => $value) {
            if ($value instanceof \DateTime) {
                $fields[$key] = $value->format('Y-m-d');
            }
        }

        return $fields;
    }

    public function save($record) {
        $entity = new $this->className(...$this->constructorArgs);
        try {
//			var_dump($record);
//                        var_dump(isset($record[id]));
            $primary = $this->primaryKey;
            if ($record[$primary] == '') {
                $record[$primary] = null;
//                                echo 'in_if';
            }
//            var_dump($record);
            $insertId = $this->insert($record);
            $entity->{$this->primaryKey} = $insertId;
        } catch (\PDOException $e) {
//            var_dump($record);
            $this->update($record);
        }

        foreach ($record as $key => $value) {
            if (!empty($value)) {
                $entity->$key = $value;
            }
        }
        return $entity;
    }

}
