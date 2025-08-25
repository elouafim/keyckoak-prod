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
            --primary-color: #007bff;
            --primary-hover: #0056b3;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --dark-color: #343a40;
            --light-bg: #f8f9fa;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        .form-input {
            border-radius: 10px !important;
            border: 2px solid #e0e0e0 !important;
            padding: 12px 16px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: var(--primary-color) !important;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25) !important;
        }

        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            font-size: 18px;
            color: #fff;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .social-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            color: #fff;
        }

        .google-btn {
            background-color: #db4437;
        }

        .facebook-btn {
            background-color: #3b5998;
        }

        .divider {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }

        .divider::before {
            content: "";
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            border-top: 1px solid #e0e0e0;
            z-index: 0;
        }

        .divider span {
            background: #fff;
            padding: 0 15px;
            position: relative;
            z-index: 1;
            color: #6c757d;
            font-size: 14px;
        }

        .back-home {
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 1000;
            border-radius: 25px;
            padding: 8px 20px;
        }

        .btn-primary-custom {
            background: linear-gradient(45deg, var(--primary-color), #4e73df);
            border: none;
            border-radius: 25px;
            padding: 12px 24px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary-custom:hover {
            background: linear-gradient(45deg, var(--primary-hover), #2e59d9);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* Container + Card */
        .auth-container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .auth-card {
            background: #fff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            backdrop-filter: blur(10px);
            width: 100%;
        }

        .auth-form-section {
            padding: 40px;
        }

        .auth-visual-section {
            min-height: 500px;
            color: #fff;
            position: relative;
            background-image: url('${url.resourcesPath}/img/img2.jpg');
            background-size: cover;
            background-position: center;
        }

        .auth-visual-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(0,123,255,0.8) 0%, rgba(102,126,234,0.8) 100%);
        }

        .visual-content {
            position: relative;
            z-index: 2;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .features-overlay {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .feature-pin {
            position: absolute;
            background: rgba(255,255,255,0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.3);
            border-radius: 15px;
            padding: 15px;
            text-align: center;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .feature-pin.top-left {
            top: 30px;
            left: 30px;
            animation-delay: 0s;
        }

        .feature-pin.top-right {
            top: 30px;
            right: 30px;
            animation-delay: 1s;
        }

        .feature-pin.bottom-center {
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            animation-delay: 2s;
        }

        .feature-info {
            display: flex;
            flex-direction: column;
            margin-left: 10px;
        }

        .feature-name {
            font-weight: 600;
            font-size: 14px;
        }

        .feature-desc {
            font-size: 12px;
            opacity: 0.8;
        }

        .feature-highlight {
            font-size: 20px;
            font-weight: 700;
            color: #ffd700;
        }

        .feature-text {
            font-size: 12px;
            margin-top: 5px;
        }

        .site-logo {
            max-width: 60px;
            height: auto;
            margin-bottom: 10px;
        }

        .form-header {
            margin-bottom: 30px;
        }

        .form-header .title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--dark-color);
            margin-top: 15px;
        }

        .forgot-password {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password:hover {
            color: var(--primary-hover);
        }

        .link-btn {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .link-btn:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        .submit-btn {
            font-size: 16px;
            font-weight: 600;
            padding: 14px;
        }

        /* Responsive Design */
        @media (max-width: 991px) {
            .auth-container {
                padding: 15px;
            }
            
            .auth-form-section {
                padding: 30px;
            }

            .auth-visual-section {
                min-height: 300px;
            }
        }

        @media (max-width: 767px) {
            .auth-container {
                padding: 0;
            }

            .auth-card {
                border-radius: 0;
                box-shadow: none;
                min-height: 100vh;
            }

            .auth-form-section {
                padding: 30px 20px;
                order: 1; /* Formulaire en haut sur mobile */
            }

            .auth-visual-section {
                height: 250px;
                order: 2; /* Image en bas sur mobile */
            }

            .form-header .title {
                font-size: 1.5rem;
            }

            .site-logo {
                max-width: 50px;
            }

            .back-home {
                position: fixed;
                top: 10px;
                left: 10px;
                padding: 6px 15px;
                font-size: 14px;
            }

            .feature-pin {
                padding: 10px;
                font-size: 12px;
            }

            .feature-pin.top-left,
            .feature-pin.top-right {
                top: 15px;
            }

            .feature-pin.top-left {
                left: 15px;
            }

            .feature-pin.top-right {
                right: 15px;
            }

            .feature-pin.bottom-center {
                bottom: 15px;
            }
        }

        @media (max-width: 480px) {
            .auth-form-section {
                padding: 20px 15px;
            }

            .form-header .title {
                font-size: 1.3rem;
            }

            .social-btn {
                width: 40px;
                height: 40px;
                font-size: 16px;
            }

            .feature-pin {
                padding: 8px;
                font-size: 11px;
            }
        }

        /* Animation d'entrée */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .auth-form-section {
            animation: fadeInUp 0.6s ease-out;
        }

        /* Styles pour les alertes */
        .alert {
            border-radius: 10px;
            margin-bottom: 20px;
        }

        /* Loading state */
        .btn-loading {
            position: relative;
            pointer-events: none;
        }

        .btn-loading::after {
            content: '';
            position: absolute;
            width: 16px;
            height: 16px;
            margin: auto;
            border: 2px solid transparent;
            border-top-color: #fff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <a href="#" class="back-home btn btn-primary-custom">
        <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
    </a>

    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-content row g-0">
                
                <!-- Section Formulaire (à gauche sur desktop, en haut sur mobile) -->
                <div class="auth-form-section col-12 col-lg-6 order-1 order-lg-1">
                    <div id="loginForm" class="auth-form">
                        <div class="form-header text-center">
                            <h1 class="brand">
                                <img src="${url.resourcesPath}/img/logo.png"
                                     alt="SOS MON GARAGE"
                                     class="site-logo">
                            </h1>
                            <h1 class="title">Connectez-vous</h1>
                        </div>

                        <!-- Connexion sociale -->
                        <div class="social-login text-center">
                            <div class="d-flex justify-content-center gap-3 mb-3">
                                <a href="#" class="social-btn google-btn" title="Se connecter avec Google">
                                    <i class="fab fa-google"></i>
                                </a>
                            </div>
                        </div>
                        
                        <div class="divider"><span>ou</span></div>

                        <!-- Messages d'erreur/succès -->
                        <div id="alertContainer"></div>

                        <!-- Formulaire de connexion -->
                        <form id="loginForm" onsubmit="handleLogin(event)">
                            <div class="mb-3">
                                <input type="email" 
                                       class="form-input form-control" 
                                       name="username" 
                                       placeholder="Adresse e-mail" 
                                       required 
                                       autofocus>
                            </div>
                            
                            <div class="mb-3">
                                <input type="password" 
                                       class="form-input form-control" 
                                       name="password" 
                                       placeholder="Mot de passe" 
                                       required>
                            </div>

                            <div class="form-options d-flex justify-content-between align-items-center mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" 
                                           type="checkbox" 
                                           id="rememberMe" 
                                           name="rememberMe">
                                    <label class="form-check-label" for="rememberMe">
                                        Se souvenir de moi
                                    </label>
                                </div>
                                <a href="#" class="forgot-password" onclick="showForgotPassword()">
                                    Mot de passe oublié ?
                                </a>
                            </div>

                            <button type="submit" 
                                    class="submit-btn btn btn-primary-custom w-100 mb-3" 
                                    id="loginBtn">
                                <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                            </button>
                        </form>

                        <div class="switch-form text-center">
                            <span>Pas encore de compte ? </span>
                            <a href="#" class="link-btn" onclick="showRegisterForm()">
                                Créer un compte
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Section visuelle (à droite sur desktop, en bas sur mobile) -->
                <div class="auth-visual-section col-12 col-lg-6 order-2 order-lg-2">
                    <div class="visual-content">
                        <div class="features-overlay">
                            <div class="feature-pin top-left">
                                <i class="fas fa-clock text-warning"></i>
                                <div class="feature-info">
                                    <span class="feature-name">Déclaration rapide</span>
                                    <span class="feature-desc">en 5 minutes</span>
                                </div>
                            </div>
                            <div class="feature-pin top-right">
                                <span class="feature-highlight">24h/24</span>
                                <span class="feature-text">Assistance<br>7j/7</span>
                            </div>
                            <div class="feature-pin bottom-center">
                                <i class="fas fa-chart-line text-success mb-1"></i><br>
                                <span class="feature-name">Suivi en temps réel</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal de mot de passe oublié -->
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Réinitialiser le mot de passe</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Entrez votre adresse e-mail pour recevoir un lien de réinitialisation :</p>
                    <form id="forgotPasswordForm" onsubmit="handleForgotPassword(event)">
                        <div class="mb-3">
                            <input type="email" 
                                   class="form-control form-input" 
                                   placeholder="Votre adresse e-mail" 
                                   required>
                        </div>
                        <button type="submit" class="btn btn-primary-custom w-100">
                            Envoyer le lien
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Gestion de la soumission du formulaire
        function handleLogin(event) {
            event.preventDefault();
            
            const btn = document.getElementById('loginBtn');
            const originalContent = btn.innerHTML;
            
            // Animation de chargement
            btn.classList.add('btn-loading');
            btn.innerHTML = '<span class="me-2">Connexion en cours...</span>';
            btn.disabled = true;
            
            // Simulation de la connexion
            setTimeout(() => {
                // Réinitialiser le bouton
                btn.classList.remove('btn-loading');
                btn.innerHTML = originalContent;
                btn.disabled = false;
                
                // Afficher un message de succès
                showAlert('Connexion réussie ! Redirection en cours...', 'success');
                
                // Redirection simulée
                setTimeout(() => {
                    window.location.href = '#dashboard';
                }, 1500);
            }, 2000);
        }

        // Gestion du mot de passe oublié
        function showForgotPassword() {
            const modal = new bootstrap.Modal(document.getElementById('forgotPasswordModal'));
            modal.show();
        }

        function handleForgotPassword(event) {
            event.preventDefault();
            showAlert('Un e-mail de réinitialisation a été envoyé à votre adresse.', 'info');
            bootstrap.Modal.getInstance(document.getElementById('forgotPasswordModal')).hide();
        }

        // Affichage des alertes
        function showAlert(message, type) {
            const alertContainer = document.getElementById('alertContainer');
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
            alertDiv.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;
            
            alertContainer.innerHTML = '';
            alertContainer.appendChild(alertDiv);
            
            // Supprimer l'alerte après 5 secondes
            setTimeout(() => {
                if (alertDiv.parentNode) {
                    alertDiv.remove();
                }
            }, 5000);
        }

        // Navigation vers l'inscription
        function showRegisterForm() {
            showAlert('Redirection vers la page d\'inscription...', 'info');
            // Ici vous pouvez rediriger vers votre page d'inscription
            setTimeout(() => {
                window.location.href = '#register';
            }, 1000);
        }

        // Amélioration UX - Focus automatique
        document.addEventListener('DOMContentLoaded', function() {
            const firstInput = document.querySelector('input[name="username"]');
            if (firstInput) {
                firstInput.focus();
            }
        });

        // Validation en temps réel
        document.querySelectorAll('.form-input').forEach(input => {
            input.addEventListener('blur', function() {
                if (this.hasAttribute('required') && !this.value.trim()) {
                    this.classList.add('is-invalid');
                } else {
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }
            });

            input.addEventListener('input', function() {
                if (this.classList.contains('is-invalid')) {
                    this.classList.remove('is-invalid');
                }
            });
        });
    </script>
</body>
</html>