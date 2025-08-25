<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1, user-scalable=no">

<style>
    /* Variables CSS */
    :root {
        --primary-color: #007bff;
        --primary-hover: #0056b3;
        --border-color: #e0e6ed;
        --text-muted: #6c757d;
        --border-radius: 12px;
        --shadow: 0 4px 20px rgba(0,0,0,0.08);
        --shadow-hover: 0 8px 30px rgba(0,0,0,0.12);
        --success-color: #28a745;
        --warning-color: #ffc107;
    }

    img, svg, video, canvas { max-width: 100%; height: auto; }
body { -webkit-text-size-adjust: 100%; touch-action: manipulation; }

    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    /* Container principal */
    .update-container {
        min-height: 100vh;
        display: grid;
        place-items: center;
        align-items: center;
        justify-content: center;
        padding: clamp(12px, 4vw, 24px);
        position: relative;
        width: 100%;
        box-sizing: border-box;
    }

    /* Carte de mise à jour */
    .update-card {
        background: #fff;
        border-radius: var(--border-radius);
        box-shadow: var(--shadow);
        padding: 40px;
        width: 100%;
        max-width: 450px;
        transition: all 0.3s ease;
        position: relative;
        z-index: 10;
    }

    .update-card:hover {
        box-shadow: var(--shadow-hover);
        transform: translateY(-5px);
    }

    /* Header */
    .update-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .brand-logo {
        max-width: 180px;
        height: auto;
        margin-bottom: 14px !important;
    }

    .update-title {
        font-size: 1.8rem;
        font-weight: 600;
        color: #2c3e50;
        margin: 0 0 6px 0 !important;
    }

    .update-subtitle {
        color: var(--text-muted);
        font-size: 0.95rem;
        margin: 0 !important;
        line-height: 1.4;
    }

    /* Bouton retour */
    .back-login {
        position: absolute;
        top: 20px;
        left: 20px;
        background: rgba(255,255,255,0.9);
        border: none;
        border-radius: 50px;
        padding: 10px 20px;
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--primary-color);
        text-decoration: none;
        transition: all 0.3s ease;
        backdrop-filter: blur(10px);
    }

    .back-login:hover {
        background: #fff;
        transform: translateX(-5px);
        color: var(--primary-hover);
    }

    /* Champs de saisie */
    .form-group {
        margin-bottom: 20px;
        position: relative;
    }

    .form-input {
        width: 100%;
        padding: 12px 16px 12px 45px;
        border: 2px solid var(--border-color);
        border-radius: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: #f8f9fa;
        box-sizing: border-box;
    }

    .form-input:focus {
        outline: none;
        border-color: var(--primary-color);
        background: #fff;
        box-shadow: 0 0 0 3px rgba(0,123,255,0.1);
    }

    .form-input::placeholder {
        color: var(--text-muted);
    }

    /* Icônes dans les champs */
    .input-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-muted);
        font-size: 1rem;
        z-index: 5;
    }

    /* Indicateur de force du mot de passe */
    .password-strength {
        margin-top: 8px;
        font-size: 0.85rem;
    }

    .strength-bar {
        height: 4px;
        border-radius: 2px;
        background: #e9ecef;
        margin-top: 5px;
        overflow: hidden;
    }

    .strength-fill {
        height: 100%;
        transition: all 0.3s ease;
        border-radius: 2px;
    }

    .strength-weak { background: #dc3545; width: 25%; }
    .strength-fair { background: var(--warning-color); width: 50%; }
    .strength-good { background: #17a2b8; width: 75%; }
    .strength-strong { background: var(--success-color); width: 100%; }

    /* Bouton de soumission */
    .submit-btn {
        width: 100%;
        padding: 14px;
        background: linear-gradient(45deg, #007bff, #0099ff);
        border: none;
        border-radius: 10px;
        color: #fff;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    .submit-btn:hover {
        background: linear-gradient(45deg, var(--primary-hover), #0077cc);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,123,255,0.3);
    }

    .submit-btn:active {
        transform: translateY(0);
    }

    .submit-btn:disabled {
        background: #6c757d;
        cursor: not-allowed;
        transform: none;
        box-shadow: none;
    }

    /* Lien de retour */
    .back-link {
        text-align: center;
        padding-top: 20px;
        border-top: 1px solid var(--border-color);
    }

    .link-btn {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 600;
        transition: color 0.3s ease;
        font-size: 0.95rem;
    }

    .link-btn:hover {
        color: var(--primary-hover);
    }

    /* Messages d'erreur/succès */
    .alert {
        margin-bottom: 20px;
        border-radius: var(--border-radius);
        border: none;
        padding: 12px 16px;
    }

    .alert-info {
        background-color: #d1ecf1;
        color: #0c5460;
    }

    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
    }

    /* Conteneurs flottants animés */
    .floating-features {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: 0;
    }

    .floating-pill {
        position: absolute;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.2);
        border-radius: 50px;
        padding: 12px 20px;
        color: white;
        font-size: 0.85rem;
        font-weight: 500;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        animation: float 6s ease-in-out infinite;
    }

    .floating-pill i {
        margin-right: 8px;
        font-size: 1rem;
    }

    .pill-1 {
        top: 15%;
        left: 10%;
        animation-delay: 0s;
    }

    .pill-2 {
        top: 25%;
        right: 15%;
        animation-delay: 2s;
    }

    .pill-3 {
        bottom: 20%;
        left: 8%;
        animation-delay: 4s;
    }

    .pill-4 {
        bottom: 35%;
        right: 12%;
        animation-delay: 1s;
    }

    @keyframes float {
        0%, 100% {
            transform: translateY(0px) rotate(0deg);
            opacity: 0.7;
        }
        25% {
            transform: translateY(-20px) rotate(1deg);
            opacity: 0.9;
        }
        50% {
            transform: translateY(-10px) rotate(-1deg);
            opacity: 1;
        }
        75% {
            transform: translateY(-15px) rotate(0.5deg);
            opacity: 0.8;
        }
    }

    /* Animation d'apparition */
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

    .update-card {
        animation: fadeInUp 0.6s ease-out;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        body {
            margin: 0;
            padding: 0;
        }

        .update-container {
            padding:
                max(20px, env(safe-area-inset-top))
                max(16px, env(safe-area-inset-right))
                max(24px, env(safe-area-inset-bottom))
                max(16px, env(safe-area-inset-left));
            min-height: 100vh;
            width: 100vw;
            margin: 0;
            position: relative;
            display: grid;
            place-items: center;
        }

        .update-card {
            padding: 20px 16px;
            margin: 0;
            max-width: 100%;
            width: 100vw;
            border-radius: 16px;
            min-height: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            box-shadow: none;
        }

        .update-header {
            margin-bottom: 25px;
        }

        .update-title {
            font-size: 1.5rem;
        }

        .update-subtitle {
            font-size: 0.9rem;
        }

        .brand-logo {
            max-width: 120px;
            margin-bottom: 10px;
            input, select, textarea { font-size: 16px; } /* pas de zoom iOS au focus */
        }


        .back-login {
            display: none; /* Caché sur mobile pour plus d'espace */
        }

        /* Éléments flottants mobiles */
        .floating-features {
            display: block;
        }

        .floating-pill {
            font-size: 0.75rem;
            padding: 8px 14px;
            border-radius: 25px;
        }

        .floating-pill i {
            margin-right: 6px;
            font-size: 0.8rem;
        }

        /* Repositionnement pour mobile */
        .pill-1 {
            top: 12%;
            left: 5%;
        }

        .pill-2 {
            top: 18%;
            right: 8%;
        }

        .pill-3 {
            bottom: 25%;
            left: 3%;
        }

        .pill-4 {
            bottom: 18%;
            right: 5%;
        }
    }

    @media (max-width: 480px) {
        .update-card {
            padding: 16px 14px;
            width: 100vw;
        }

        .update-title {
            font-size: 1.35rem;
        }

        .update-subtitle {
            font-size: 0.85rem;
        }

        .form-input {
            padding: 12px 16px 12px 45px;
            font-size: 1rem;
            border-radius: 8px;
        }

        .submit-btn {
            padding: 14px;
            font-size: 1rem;
            border-radius: 8px;
        }

        .floating-pill {
            font-size: 0.7rem;
            padding: 6px 12px;
        }

        .floating-pill i {
            font-size: 0.75rem;
        }
    }
</style>

<@layout.registrationLayout; section>
<#if section = "form">
    <!-- Conteneurs flottants animés -->
    <div class="floating-features">
        <div class="floating-pill pill-1">
            <i class="fas fa-shield-alt"></i>
            Mot de passe sécurisé
        </div>
        <div class="floating-pill pill-2">
            <i class="fas fa-lock"></i>
            Cryptage avancé
        </div>
        <div class="floating-pill pill-3">
            <i class="fas fa-check-circle"></i>
            Validation instantanée
        </div>
        <div class="floating-pill pill-4">
            <i class="fas fa-key"></i>
            Accès protégé
        </div>
    </div>

    <div class="update-container">
        <a href="${url.loginUrl}" class="back-login">
            <i class="fas fa-arrow-left me-2"></i>Retour à la connexion
        </a>

        <div class="update-card">
            <!-- Header -->
            <div class="update-header">
                <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="brand-logo" />
                <h1 class="update-title">Nouveau mot de passe</h1>
                <p class="update-subtitle">
                    Choisissez un mot de passe fort pour sécuriser votre compte. Il doit contenir au moins 8 caractères.
                </p>
            </div>

            <!-- Messages d'erreur/succès -->
            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <i class="fas fa-info-circle me-2"></i>
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <!-- Formulaire de mise à jour -->
            <form id="kc-update-password-form" action="${url.loginAction}" method="post">
                <div class="form-group">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" 
                           class="form-input" 
                           name="password-new" 
                           id="password-new"
                           placeholder="Nouveau mot de passe" 
                           required>
                    <div class="password-strength">
                        <span id="strength-text">Force du mot de passe</span>
                        <div class="strength-bar">
                            <div id="strength-fill" class="strength-fill"></div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <i class="fas fa-check-circle input-icon"></i>
                    <input type="password" 
                           class="form-input" 
                           name="password-confirm" 
                           id="password-confirm"
                           placeholder="Confirmer le nouveau mot de passe" 
                           required>
                </div>

                <button type="submit" class="submit-btn" id="submit-btn">
                    <i class="fas fa-save me-2"></i>Enregistrer le mot de passe
                </button>
            </form>

            <!-- Lien de retour -->
            <div class="back-link">
                <a href="${url.loginUrl}" class="link-btn">
                    <i class="fas fa-arrow-left me-1"></i>Retour à la connexion
                </a>
            </div>
        </div>
    </div>

    <!-- Scripts Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script de validation du mot de passe -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password-new');
            const confirmInput = document.getElementById('password-confirm');
            const strengthText = document.getElementById('strength-text');
            const strengthFill = document.getElementById('strength-fill');
            const submitBtn = document.getElementById('submit-btn');

            // Validation de la force du mot de passe
            function checkPasswordStrength(password) {
                let strength = 0;
                let feedback = '';

                if (password.length >= 8) strength++;
                if (/[a-z]/.test(password)) strength++;
                if (/[A-Z]/.test(password)) strength++;
                if (/[0-9]/.test(password)) strength++;
                if (/[^a-zA-Z0-9]/.test(password)) strength++;

                switch (strength) {
                    case 0:
                    case 1:
                        feedback = 'Très faible';
                        strengthFill.className = 'strength-fill strength-weak';
                        break;
                    case 2:
                        feedback = 'Faible';
                        strengthFill.className = 'strength-fill strength-weak';
                        break;
                    case 3:
                        feedback = 'Correct';
                        strengthFill.className = 'strength-fill strength-fair';
                        break;
                    case 4:
                        feedback = 'Bon';
                        strengthFill.className = 'strength-fill strength-good';
                        break;
                    case 5:
                        feedback = 'Très bon';
                        strengthFill.className = 'strength-fill strength-strong';
                        break;
                }

                strengthText.textContent = feedback;
                return strength >= 3;
            }

            // Validation des mots de passe correspondants
            function validatePasswords() {
                const password = passwordInput.value;
                const confirm = confirmInput.value;
                const isStrong = checkPasswordStrength(password);
                const isMatching = password === confirm && password.length > 0;

                // Style des champs selon validation
                if (confirm.length > 0) {
                    if (isMatching) {
                        confirmInput.style.borderColor = '#28a745';
                    } else {
                        confirmInput.style.borderColor = '#dc3545';
                    }
                } else {
                    confirmInput.style.borderColor = '#e0e6ed';
                }

                // Activation/désactivation du bouton
                submitBtn.disabled = !(isStrong && isMatching);
            }

            passwordInput.addEventListener('input', validatePasswords);
            confirmInput.addEventListener('input', validatePasswords);
        });
    </script>

</#if>
</@layout.registrationLayout>