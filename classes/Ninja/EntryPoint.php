<?php

namespace Ninja;

class EntryPoint {

    private $route;
    private $method;
    private $routes;

    public function __construct(string $route, string $method, \Ninja\Routes $routes) {
        $this->route = $route;
        $this->method = $method;
        $this->routes = $routes;
        $this->checkUrl();
    }

    private function checkUrl() {
        if ($this->route !== strtolower($this->route)) {
//                    echo $this->route;
//                    echo "<BR />";
//                    echo 'location: ' . strtolower($this->route);
            http_response_code(301);

            header('Location: ' . strtolower($this->route));
        }
    }

    private function loadTemplate($templateFileName, $variables = []) {
        extract($variables);

        ob_start();
        include __DIR__ . '/../../templates/' . $templateFileName;

        return ob_get_clean();
    }

    public function run() {

        $routes = $this->routes->getRoutes();

        $authentication = $this->routes->getAuthentication();

        if (isset($routes[$this->route]['login']) && !$authentication->isLoggedIn()) {
            header('location: /login/error');
        } else if (isset($routes[$this->route]['rate']) && !$authentication->isLoggedIn()) {
            header('location: /rate/error');
        } else if (isset($routes[$this->route]['permissions']) && !$this->routes->checkPermission($routes[$this->route]['permissions'])) {
            header('location: /permissions/error');
        } else {
            $controller = $routes[$this->route][$this->method]['controller'];
            $action = $routes[$this->route][$this->method]['action'];

            if (isset($controller)) {
                $page = $controller->$action();
                $title = $page['title'];

                if (isset($page['variables'])) {
                    $output = $this->loadTemplate($page['template'], $page['variables']);
                } else {
                    $output = $this->loadTemplate($page['template']);
                }
            } else {
                $output = $this->loadTemplate('404.html.php');
                $title = 'Page not found.';
            }

            echo $this->loadTemplate('layout.html.php', [
                'loggedIn' => $authentication->isLoggedIn(),
                'user' => $authentication->getUser(),
                'output' => $output,
                'title' => $title
            ]);
        }
    }

}
