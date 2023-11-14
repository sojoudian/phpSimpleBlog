<?php
$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['SCRIPT_NAME']);
?>
<?php
// Database configuration
$host = 'localhost';
$dbname = 'blog';
$username = 'root'; // Replace with your database username
$password = ''; // Replace with your database password

$searchResults = [];
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $searchField = $_POST['search_field'];
        $searchQuery = $_POST['search_query'];

        $sql = "SELECT * FROM posts WHERE $searchField LIKE :searchQuery";
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':searchQuery', '%' . $searchQuery . '%', PDO::PARAM_STR);
        $stmt->execute();

        $searchResults = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        die("ERROR: Could not connect. " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Search Blog Posts</title>
    <style>
        body {
            font-family: 'Avenir', sans-serif;
        }
        h1 {
            color: #336699;
            font-family: 'Avenir';
        }
        form {
            font-family: 'Avenir';
        }
    </style>
</head>
<body>
    <?php echo '<br>'; ?>
        <a href="<?php echo $baseURL; ?>/list_edit_posts.php">Edit a posts</a>
        <a href="<?php echo $baseURL; ?>/view_posts.php">View all posts</a>
        <a href="<?php echo $baseURL; ?>/index.php">Add a new posts</a>
    <h1>Search Blog Posts</h1>
    <form method="post">
        <label for="search_field">Search By:</label>
        <select id="search_field" name="search_field">
            <option value="id">ID</option>
            <option value="title">Title</option>
            <option value="content">Content</option>
            <option value="author">Author</option>
        </select>

        <label for="search_query">Query:</label>
        <input type="text" id="search_query" name="search_query">

        <input type="submit" value="Search">
    </form>

    <?php if ($searchResults): ?>
        <h2>Search Results</h2>
        <ul>
            <?php foreach ($searchResults as $post): ?>
                <li>
                    <?php echo "ID: " . htmlspecialchars($post['id']) . ", Title: " . htmlspecialchars($post['title']) . ", Author: " . htmlspecialchars($post['author']); ?>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php elseif ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
        <p>No results found.</p>
    <?php endif; ?>
</body>
</html>
