<?php
// Database connection parameters
$servername = "localhost"; // Change this to your MySQL server address
$username = "root"; // Change this to your MySQL username
$password = ""; // Change this to your MySQL password
$dbname = "medical_store"; // Change this to the name of your MySQL database

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Fetching values from the form
    $username = $_POST['username'];
    $age = $_POST['age'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $password = $_POST['password'];
    $bloodgroup = $_POST['bloodgroup'];

    // SQL query to insert data into the database
    $sql = "INSERT INTO users (username, age, email, address, password, bloodgroup)
            VALUES ('$username', '$age', '$email', '$address', '$password', '$bloodgroup')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
     }
}

// Close connection
$conn->close();
?>