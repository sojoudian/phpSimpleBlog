<?php
$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['SCRIPT_NAME']);
?>

<?php
// Database configuration
$host = '127.0.0.1';
$dbname = 'blog';
$username = 'root';
$password = '';

try {
    // Establish database connection using PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Prepare and execute SELECT statement
    $sql = "SELECT * FROM posts ORDER BY created_at DESC";
    $stmt = $pdo->query($sql);

    // Fetch all posts
    $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>View Blog Posts</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <header>
        <h1>Blog Posts</h1>
    </header>

    <nav>
        <a href="<?php echo $baseURL; ?>/search.php">Search for a post</a>
        <a href="<?php echo $baseURL; ?>/list_edit_posts.php">Edit a post</a>
        <a href="<?php echo $baseURL; ?>/index.php">Add a new post</a>
    </nav>

    <main>
        <?php if ($posts): ?>
            <?php foreach ($posts as $post): ?>
                <article class="post">
                    <h2 ><?php echo htmlspecialchars($post['title']); ?></h2>
                    <h3><?php echo htmlspecialchars($post['title']); ?></h3>
                    <p class="author"><strong>Author:</strong> <?php echo htmlspecialchars($post['author']); ?></p>
                    <div class="content"><?php echo nl2br(htmlspecialchars($post['content'])); ?></div>
                    <footer><small>Posted on: <?php echo $post['created_at']; ?></small></footer>
                </article>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No posts found.</p>
        <?php endif; ?>
    </main>

</body>
</html>