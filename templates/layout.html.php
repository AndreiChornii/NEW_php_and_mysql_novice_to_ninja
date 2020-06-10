<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/jokes.css" type="text/css">
        <title><?= $title ?></title>
    </head>
    <body>
        <nav>
            <header>
                <h1>Internet_Jokes <?php if ($loggedIn) echo ' | Welcome: ' . $user->name; ?></h1>
            </header>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/joke/list">Jokes List</a></li>
                <li><a href="/joke/edit">Add a new Joke</a></li>
                <li><a href="/author/register">Register new author</a></li>
                <li><a href="/category/list">Categories list</a></li>
                <li><a href="/author/list">Users list</a></li>
                <?php if ($loggedIn): ?>
                    <li><a href="/logout">Log out</a>
                    </li>
                <?php else: ?>
                    <li><a href="/login">Log in</a></li>
                <?php endif; ?>
            </ul>
        </nav>

        <main>
            <?= $output ?>
        </main>

        <footer>
            &copy; IJDB 2017
        </footer>
    </body>
</html>