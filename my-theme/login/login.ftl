<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - SOS MON GARAGE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-blue: #004aad;
            --primary-purple: #6c63ff;
            --gradient: linear-gradient(135deg, var(--primary-blue) 0%, var(--primary-purple) 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .back-home {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .back-home:hover {
            background: rgba(0, 0, 0, 0.7);
            transform: translateX(-3px);
        }

        .main-container {
            display: flex;
            flex: 1;
            min-height: 100vh;
        }

        .visual-section {
            flex: 1;
            background: var(--gradient);
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .visual-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('https://images.unsplash.com/photo-1493238792000-8113da705763?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') center/cover no-repeat;
            opacity: 0.7;
        }

        .feature-top {
            position: absolute;
            top: 40px;
            left: 40px;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
            max-width: 200px;
        }

        .feature-middle {
            position: absolute;
            top: 50%;
            right: 40px;
            transform: translateY(-50%);
            color: white;
            text-align: right;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .feature-bottom {
            position: absolute;
            bottom: 40px;
            left: 0;
            right: 0;
            text-align: center;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .feature-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .feature-desc {
            font-size: 1rem;
            opacity: 0.9;
        }

        .feature-highlight {
            font-size: 1.8rem;
            font-weight: 800;
            display: block;
            margin-bottom: 5px;
        }

        .form-section {
            width: 50%;
            min-width: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            background: white;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
        }

        .logo {
            text-align: center;
            margin-bottom: 2rem;
        }

        .brand-name {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--primary-blue);
            line-height: 1;
            margin-bottom: 0.5rem;
        }

        .brand-tagline {
            font-size: 1.5rem;
            color: #6c757d;
            font-weight: 500;
        }

        .form-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: #333;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            padding: 15px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 0.2rem rgba(0, 74, 173, 0.25);
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .forgot-password {
            color: var(--primary-purple);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .forgot-password:hover {
            color: var(--primary-blue);
            text-decoration: underline;
        }

        .btn-login {
            background: var(--gradient);
            border: none;
            color: white;
            padding: 15px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 74, 173, 0.3);
        }

        .divider {
            text-align: center;
            margin: 1.5rem 0;
            position: relative;
        }

        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: #e9ecef;
        }

        .divider span {
            background: white;
            padding: 0 1rem;
            color: #6c757d;
            font-size: 14px;
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 1.5rem;
        }

        .social-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .google-btn {
            background-color: #db4437;
        }

        .social-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .switch-form {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e9ecef;
        }

        .switch-form a {
            color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .switch-form a:hover {
            color: var(--primary-blue);
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 1100px) {
            .main-container {
                flex-direction: column;
            }
            
            .visual-section {
                min-height: 300px;
                width: 100%;
            }
            
            .form-section {
                width: 100%;
                min-width: auto;
                padding: 2rem 1.5rem;
            }
            
            .feature-top, .feature-middle, .feature-bottom {
                text-align: center;
                left: 0;
                right: 0;
                padding: 0 20px;
            }
            
            .feature-middle {
                text-align: center;
                right: auto;
            }
        }

        @media (max-width: 576px) {
            .form-section {
                padding: 1.5rem;
            }
            
            .brand-name {
                font-size: 2rem;
            }
            
            .brand-tagline {
                font-size: 1.2rem;
            }
            
            .form-title {
                font-size: 1.5rem;
            }
            
            .feature-title {
                font-size: 1.3rem;
            }
            
            .feature-highlight {
                font-size: 1.5rem;
            }
            
            .feature-desc {
                font-size: 0.9rem;
            }
            
            .back-home {
                top: 10px;
                left: 10px;
                font-size: 0.9rem;
                padding: 8px 12px;
            }
        }

        @media (max-width: 380px) {
            .form-section {
                padding: 1.2rem;
            }
            
            .form-container {
                max-width: 100%;
            }
            
            .brand-name {
                font-size: 1.8rem;
            }
            
            .form-title {
                font-size: 1.4rem;
            }
            
            .form-control {
                padding: 12px;
            }
            
            .form-options {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }

        @media (max-height: 700px) {
            .visual-section {
                min-height: 250px;
            }
            
            .form-section {
                padding: 1.5rem;
            }
            
            .brand-name {
                font-size: 2rem;
            }
            
            .form-title {
                font-size: 1.5rem;
                margin-bottom: 1rem;
            }
            
            .form-group {
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <a href="https://sosgarage-production-967f.up.railway.app" class="back-home">
        <i class="fas fa-arrow-left"></i> Retour à l'accueil
    </a>

    <div class="main-container">
        <div class="visual-section">
            <div class="feature-top">
                <div class="feature-title">Déclaration rapide</div>
                <div class="feature-desc">en 5 minutes</div>
            </div>
            
            <div class="feature-middle">
                <span class="feature-highlight">24h/24</span>
                <div class="feature-text">Assistance<br>7j/7</div>
            </div>
            
            <div class="feature-bottom">
                <div class="feature-title">Suivi en temps réel</div>
            </div>
        </div>

        <div class="form-section">
            <div class="form-container">
                <div class="logo">
                    <div class="brand-name">SOS</div>
                    <div class="brand-tagline">mongarage</div>
                </div>

                <h2 class="form-title">Connectez-vous</h2>

                <form id="loginForm">
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" value="Sosmongarage2025@gmail.com" readonly>
                    </div>

                    <div class="form-group position-relative">
                        <input type="password" class="form-control" id="password" placeholder="Mot de passe" required>
                        <button type="button" class="password-toggle">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>

                    <div class="form-options">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                        </div>
                        <a href="#" class="forgot-password">Mot de passe oublié ?</a>
                    </div>

                    <button type="submit" class="btn-login">Se connecter</button>
                </form>

                <div class="divider">
                    <span>Ou</span>
                </div>

                <div class="social-login">
                    <a href="#" class="social-btn google-btn">
                        <i class="fab fa-google"></i>
                    </a>
                </div>

                <div class="switch-form">
                    Pas encore de compte ? <a href="#">Créer un compte</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Fonction pour basculer la visibilité du mot de passe
        document.querySelector('.password-toggle').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            const icon = this.querySelector('i');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });

        // Gestion de la soumission du formulaire
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const rememberMe = document.getElementById('rememberMe').checked;
            
            // Simulation de connexion
            if (password.length > 0) {
                alert('Connexion réussie! Redirection...');
                // Ici vous redirigeriez vers la page d'accueil
            } else {
                alert('Veuillez entrer votre mot de passe');
            }
        });

        // Empêcher le zoom sur les inputs sur mobile
        document.addEventListener('DOMContentLoaded', function() {
            let viewport = document.querySelector('meta[name="viewport"]');
            if (viewport) {
                viewport.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0');
            }
        });
    </script>
</body>
</html>