<?php

namespace Ijdb;

class IjdbRoutes implements \Ninja\Routes {

    private $jokesTable;
    private $authorsTable;
    private $categoriesTable;
    private $jokeCategoriesTable;
    private $authentication;

    public function __construct() {
        include __DIR__ . '/../../includes/DatabaseConnection.php';
        $this->jokesTable = new \Ninja\DatabaseTable($pdo, 'joke', 'id', '\Ijdb\Entity\Joke', [&$this->authorsTable, &$this->jokeCategoriesTable]);
        $this->authorsTable = new \Ninja\DatabaseTable($pdo, 'author', 'id', '\Ijdb\Entity\Author', [&$this->jokesTable]);
        $this->jokeCategoriesTable = new \Ninja\DatabaseTable($pdo, 'joke_category', 'categoryId');
        $this->categoriesTable = new \Ninja\DatabaseTable($pdo, 'category', 'id', '\Ijdb\Entity\Category', [&$this->jokesTable, &$this->jokeCategoriesTable]);
        $this->authentication = new \Ninja\Authentication($this->authorsTable, 'email', 'password');
    }

    public function getRoutes(): array {
        include __DIR__ . '/../../includes/DatabaseConnection.php';

//        $jokesTable = new \Ninja\DatabaseTable($pdo, 'joke', 'id');
//        $authorsTable = new \Ninja\DatabaseTable($pdo, 'author', 'id');

        $jokeController = new \Ijdb\Controllers\Joke($this->jokesTable, $this->authorsTable, $this->categoriesTable, $this->jokeCategoriesTable, $this->authentication);
        $authorController = new \Ijdb\Controllers\Register($this->authorsTable);
        $loginController = new \Ijdb\Controllers\Login($this->authentication);
        $categoryController = new \Ijdb\Controllers\Category($this->categoriesTable);

        $routes = [
            'author/register' => [
                'GET' => [
                    'controller' => $authorController,
                    'action' => 'registrationForm'
                ],
                'POST' => [
                    'controller' => $authorController,
                    'action' => 'registerUser'
                ]
            ],
            'author/success' => [
                'GET' => [
                    'controller' => $authorController,
                    'action' => 'success'
                ]
            ],
            'joke/edit' => [
                'POST' => [
                    'controller' => $jokeController,
                    'action' => 'saveEdit'
                ],
                'GET' => [
                    'controller' => $jokeController,
                    'action' => 'edit'
                ],
                'login' => true
            ],
            'joke/delete' => [
                'POST' => [
                    'controller' => $jokeController,
                    'action' => 'delete'
                ],
                'login' => true
            ],
            'joke/list' => [
                'GET' => [
                    'controller' => $jokeController,
                    'action' => 'list'
                ]
            ],
            '' => [
                'GET' => [
                    'controller' => $jokeController,
                    'action' => 'home'
                ]
            ],
            'login/error' => [
                'GET' => [
                    'controller' => $loginController,
                    'action' => 'error'
                ]
            ],
            'rate/error' => [
                'GET' => [
                    'controller' => $authorController,
                    'action' => 'rateError'
                ]
            ],
            'login' => [
                'GET' => [
                    'controller' => $loginController,
                    'action' => 'loginForm'
                ],
                'POST' => [
                    'controller' => $loginController,
                    'action' => 'processLogin'
                ]
            ],
            'login/success' => [
                'GET' => [
                    'controller' => $loginController,
                    'action' => 'success'
                ],
                'login' => true
            ],
            'logout' => [
                'GET' => [
                    'controller' => $loginController,
                    'action' => 'logout'
                ]
            ],
            'rate' => [
                'GET' => [
                    'controller' => $jokeController,
                    'action' => 'rate'
                ],
                'rate' => true,
            ],
            'permissions/error' => [
                'GET' => [
                    'controller' => $authorController,
                    'action' => 'error'
                ]
            ],
            'category/edit' => [
                'POST' => [
                    'controller' => $categoryController,
                    'action' => 'saveEdit'
                ],
                'GET' => [
                    'controller' => $categoryController,
                    'action' => 'edit'
                ],
                'login' => true,
                'permissions' => \Ijdb\Entity\Author::EDIT_CATEGORIES
            ],
            'category/list' => [
                'GET' => [
                    'controller' => $categoryController,
                    'action' => 'list'
                ],
                'login' => true,
                'permissions' => \Ijdb\Entity\Author::LIST_CATEGORIES
            ],
            'category/delete' => ['POST' => [
                    'controller' => $categoryController,
                    'action' => 'delete'
                ],
                'login' => true,
                'permissions' => \Ijdb\Entity\Author::REMOVE_CATEGORIES
            ],
            'author/permissions' => [
                'GET' => [
                    'controller' => $authorController,
                    'action' => 'permissions'
                ],
                'POST' => [
                    'controller' => $authorController,
                    'action' => 'savePermissions'
                ],
                'login' => true,
                'permissions' => \Ijdb\Entity\Author::EDIT_USER_ACCESS
            ],
            'author/list' => [
                'GET' => [
                    'controller' => $authorController,
                    'action' => 'list'
                ],
                'login' => true,
                'permissions' => \Ijdb\Entity\Author::EDIT_USER_ACCESS
            ],
        ];

        return $routes;
    }

    public function getAuthentication(): \Ninja\Authentication {
        return $this->authentication;
    }

    public function checkPermission($permission): bool {
        $user = $this->authentication->getUser();
        if ($user && $user->hasPermission($permission)) {
            return true;
        } else {
            return false;
        }
    }

}
