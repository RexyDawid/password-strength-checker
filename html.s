<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passwort Generator und Stärkeprüfer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            margin-bottom: 20px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
        }
        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        #strength {
            font-weight: bold;
            margin-top: 20px;
            padding: 10px;
            border-radius: 4px;
            width: fit-content;
            margin: 0 auto;
        }
        .weak {
            color: #ff0000;
            background-color: #ffcccc;
        }
        .medium {
            color: #ff8000;
            background-color: #ffe0cc;
        }
        .strong {
            color: #008000;
            background-color: #ccffcc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Passwort Generator und Stärkeprüfer</h1>
        <label for="password">Passwort:</label>
        <input type="text" id="password" oninput="checkStrength()">
        <p id="strength">Stärke: </p>
        <button onclick="generatePassword()">Passwort generieren</button>
    </div>

    <script>
        function generatePassword() {
            const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+";
            let password = "";
            for (let i = 0; i < 12; i++) {
                const randomIndex = Math.floor(Math.random() * chars.length);
                password += chars[randomIndex];
            }
            document.getElementById('password').value = password;
            checkStrength();
        }

        function checkStrength() {
            const password = document.getElementById('password').value;
            let strength = "Schwach";
            let strengthClass = "weak";
            
            const lengthCriteria = password.length >= 8;
            const upperCaseCriteria = /[A-Z]/.test(password);
            const lowerCaseCriteria = /[a-z]/.test(password);
            const numberCriteria = /[0-9]/.test(password);
            const specialCharCriteria = /[!@#$%^&*()_+]/.test(password);

            if (lengthCriteria && upperCaseCriteria && lowerCaseCriteria && numberCriteria && specialCharCriteria) {
                strength = "Stark";
                strengthClass = "strong";
            } else if (lengthCriteria && (upperCaseCriteria || lowerCaseCriteria) && (numberCriteria || specialCharCriteria)) {
                strength = "Mittel";
                strengthClass = "medium";
            }

            const strengthElement = document.getElementById('strength');
            strengthElement.textContent = "Stärke: " + strength;
            strengthElement.className = strengthClass;
        }
    </script>
</body>
</html>
