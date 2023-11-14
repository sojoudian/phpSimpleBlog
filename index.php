<?php
$baseURL = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['SCRIPT_NAME']);
?>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $title = htmlspecialchars($_POST['title']);
    $content = htmlspecialchars($_POST['content']);
    $author = htmlspecialchars($_POST['author']);

    // Database configuration
    $host = '127.0.0.1';
    $dbname = 'blog';
    $username = 'root';
    $password = '';

    try {
        // Establish database connection using PDO
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Prepare and execute INSERT statement
        $sql = "INSERT INTO posts (title, content, author, created_at) VALUES (:title, :content, :author, :created_at)";
        $stmt = $pdo->prepare($sql);

        $stmt->bindParam(':title', $title, PDO::PARAM_STR);
        $stmt->bindParam(':content', $content, PDO::PARAM_STR);
        $stmt->bindParam(':author', $author, PDO::PARAM_STR);
        
        $currentDateTime = date('Y-m-d H:i:s');
        $stmt->bindParam(':created_at', $currentDateTime, PDO::PARAM_STR);

        $stmt->execute();

        echo "Post created successfully.";
        echo '<br>';
        echo '<a href="' . $baseURL . '/view_posts.php">View all posts</a><br>';
        echo '<a href="' . $baseURL . '/index.php">Add a new posts</a><br>';
        
    } catch(PDOException $e) {
        die("ERROR: Could not able to execute $sql. " . $e->getMessage());
    }

    // Close connection
    unset($pdo);
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Create Blog Post</title>
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
        .post {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            font-family: 'Avenir';
        }
        .title-size {
            width: 200px;
            height: 15px;
        }
        .text-size {
            width: 500px;
            height: 100px;
        }
        .auth-size {
            width: 200px;
            height: 15px;
        }
    </style>
</head>
<body>
    <?php echo '<br>'; ?>
    <a href="<?php echo $baseURL; ?>/list_edit_posts.php">Edit a posts</a><br>
    <a href="<?php echo $baseURL; ?>/view_posts.php">View all posts</a><br>
    <a href="<?php echo $baseURL; ?>/search.php">Search for a posts</a><br>
    <H1>Add a new post</H1>
    <form method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" class="title-size"><br><br>

        <label for="content">Content:</label><br>
        <textarea id="content" name="content" class="text-size"></textarea><br><br>

        <label for="author">Author:</label>
        <input type="text" id="author" name="author" class="auth-size"><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
