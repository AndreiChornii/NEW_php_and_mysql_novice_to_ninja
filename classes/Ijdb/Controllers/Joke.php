<?php

namespace Ijdb\Controllers;

use \Ninja\DatabaseTable;
use \Ninja\Authentication;

class Joke {

    private $authorsTable;
    private $jokesTable;
    private $categoriesTable;
    private $jokeCategoriesTable;
    private $authentication;

    public function __construct(DatabaseTable $jokesTable, DatabaseTable $authorsTable, DatabaseTable $categoriesTable, DatabaseTable $jokeCategoriesTable, Authentication $authentication) {
        $this->authorsTable = $authorsTable;
        $this->jokesTable = $jokesTable;
        $this->categoriesTable = $categoriesTable;
        $this->jokeCategoriesTable = $jokeCategoriesTable;
        $this->authentication = $authentication;
        }

        public function list() {
//        if (isset($_GET['category'])) {
//            $jokeCategories = $this->jokeCategoriesTable->find('categoryId', $_GET['category']);
//            $jokes = [];
//            foreach ($jokeCategories as $jokeCategory) {
//                $jokes[] = $this->jokesTable->findById($jokeCategory->jokeId);
//            }
//        } else {
//            $jokes = $this->jokesTable->findAll();
//        }

        if (isset($_GET['category'])) {
            $category = $this->categoriesTable->findById($_GET['category']);
            $jokes = $category->getJokes();
        } else {
            $jokes = $this->jokesTable->findAll('jokedate DESC', 10);
        }

//        $category = $this->categoriesTable->findById($_GET['category']);
//        $jokes = $category->getJokes();

        $title = 'Joke list';

        $totalJokes = $this->jokesTable->total();

        $author = $this->authentication->getUser();

        return ['template' => 'jokes.html.php',
            'title' => $title,
            'variables' => [
                'totalJokes' => $totalJokes,
                'jokes' => $jokes,
                'user' => $author,
                'categories' => $this->categoriesTable->findAll()
            ]
        ];
    }

    public function home() {
        $title = 'Internet Joke Database';

        return ['template' => 'home.html.php', 'title' => $title];
    }

    public function delete() {
        $author = $this->authentication->getUser();
        $joke = $this->jokesTable->findById($_POST['id']);
        if ($joke->authorid != $author->id && !$author->hasPermission(\Ijdb\Entity\Author::DELETE_JOKES)) {
            return;
        }
        $this->jokesTable->delete($_POST['id']);
        header('location: /joke/list');
    }

    public function saveEdit() {
        $author = $this->authentication->getUser();

//        $authorObject = new \Ijdb\Entity\Author($this->jokesTable);
//        
//        $authorObject->id = $author['id'];
//        $authorObject->name = $author['name'];
//        $authorObject->email = $author['email'];
//        $authorObject->password = $author['password'];
//        if (isset($_GET['id'])) {
//            $joke = $this->jokesTable->findById($_GET['id']);
//
//            if ($joke['authorid'] != $author['id']) {
//                return;
//            }
//        }

        $joke = $_POST['joke'];
        $joke['jokedate'] = new \DateTime();
//        $joke['authorid'] = $author['id'];
//        $this->jokesTable->save($joke);
//        $author->addJoke($joke);
        $jokeEntity = $author->addJoke($joke);
        $jokeEntity->clearCategories();
//        var_dump($_POST);
        foreach ($_POST['category'] as $categoryId) {
            $jokeEntity->addCategory($categoryId);
        }

        header('location: /joke/list');
    }

    public function edit() {
        $author = $this->authentication->getUser();
        $categories = $this->categoriesTable->findAll();

        if (isset($_GET['id'])) {
            $joke = $this->jokesTable->findById($_GET['id']);
        }

        $title = 'Edit joke';

        return ['template' => 'editjoke.html.php',
            'title' => $title,
            'variables' => [
                'joke' => $joke ?? null,
//                'userId' => $author['id'] ?? null
                'user' => $author,
                'categories' => $categories
            ]
        ];
    }

    public function rate() {
        if (isset($_GET['id'])) {
            $joke = $this->jokesTable->findById($_GET['id']);
        }

        $joke->rate ++;
//        for ($i = 0; $i <= 4; $i++) {
//            unset($joke[$i]);
//        }
        $author = $this->authentication->getUser();

        $joke_arr = [];
        $joke_arr['id'] = $joke->id;
        $joke_arr['authorid'] = $joke->authorid;
        $joke_arr['jokedate'] = $joke->jokedate;
        $joke_arr['joketext'] = $joke->joketext;
        $joke_arr['rate'] = $joke->rate;

        $author->addJoke($joke_arr);
//        var_dump((array)$joke);
//        $this->jokesTable->save((array)$joke);

        header('location: /joke/list');
    }

}
