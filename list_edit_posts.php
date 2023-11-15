<?php
$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['SCRIPT_NAME']);
?>

<?php
// Database configuration
$host = 'localhost';
$dbname = 'blog';
$username = 'root'; // Replace with your database username
$password = ''; // Replace with your database passwor

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}

// Handle POST request for updating a post
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id'])) {
    // Updating post logic
    // ... [Remains the same as previous code]
}

// Handle GET request for deleting a post
if (isset($_GET['delete'])) {
    $postId = $_GET['delete'];

    $sql = "DELETE FROM posts WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $postId, PDO::PARAM_INT);
    $stmt->execute();

    header("Location: list_edit_posts.php");
    exit;
}

// Fetch all posts logic
// Fetch all posts
$sql = "SELECT * FROM posts ORDER BY created_at DESC";
$stmt = $pdo->query($sql);
$posts = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch a specific post for editing
$editPost = null;
if (isset($_GET['edit'])) {
    $postId = $_GET['edit'];

    $sql = "SELECT * FROM posts WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $postId, PDO::PARAM_INT);
    $stmt->execute();

    $editPost = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>View, Edit, and Delete Blog Posts</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <header>
        <h1>Blog Posts</h1>
    </header>

    <nav>
        <a href="<?php echo $baseURL; ?>view_posts.php">View all posts</a>
        <a href="<?php echo $baseURL; ?>search.php">Search for a post</a>
        <a href="<?php echo $baseURL; ?>index.php">Add a new post</a>
    </nav>

    <section>
        <?php if ($posts): ?>
            <ul>
                <?php foreach ($posts as $post): ?>
                    <li>
                        <strong><?php echo htmlspecialchars($post['title']); ?></strong>
                        <p><?php echo htmlspecialchars(substr($post['content'], 0, 100)) . '...'; ?></p>
                        <a href="list_edit_posts.php?edit=<?php echo $post['id']; ?>">Edit</a>
                        |
                        <a href="list_edit_posts.php?delete=<?php echo $post['id']; ?>" onclick="return confirm('Are you sure you want to delete this post?');">Delete</a>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>No posts found.</p>
        <?php endif; ?>
    </section>

    <?php if ($editPost): ?>
        <!-- Edit post form -->
        <!-- ... [Remains the same as previous code] -->
    <?php endif; ?>

    <footer>
        <p>Blog &copy; 2023</p>
    </footer>
</body>
</html>