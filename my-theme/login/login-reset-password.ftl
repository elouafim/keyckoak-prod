<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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
    }

    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    /* Container principal */
    .reset-container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        position: relative;
        width: 100%;
        box-sizing: border-box;
    }

    /* Carte de réinitialisation */
    .reset-card {
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

    .reset-card:hover {
        box-shadow: var(--shadow-hover);
        transform: translateY(-5px);
    }

    /* Header */
    .reset-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .brand-logo {
        max-width: 180px;
        height: auto;
        margin-bottom: 20px;
    }

    .reset-title {
        font-size: 1.8rem;
        font-weight: 600;
        color: #2c3e50;
        margin: 0 0 10px 0;
    }

    .reset-subtitle {
        color: var(--text-muted);
        font-size: 0.95rem;
        margin: 0;
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
        margin-bottom: 25px;
    }

    .form-input {
        width: 100%;
        padding: 12px 16px;
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

    .reset-card {
        animation: fadeInUp 0.6s ease-out;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        body {
            margin: 0;
            padding: 0;
        }

        .reset-container {
            padding: 0;
            min-height: 100vh;
            width: 100vw;
            margin: 0;
            position: relative;
        }

        .reset-card {
            padding: 20px;
            margin: 0;
            max-width: 100%;
            width: 100vw;
            border-radius: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            box-shadow: none;
        }

        .reset-header {
            margin-bottom: 25px;
        }

        .reset-title {
            font-size: 1.5rem;
        }

        .reset-subtitle {
            font-size: 0.9rem;
        }

        .brand-logo {
            max-width: 150px;
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
        .reset-card {
            padding: 15px;
            width: 100vw;
        }

        .reset-title {
            font-size: 1.3rem;
        }

        .reset-subtitle {
            font-size: 0.85rem;
        }

        .form-input {
            padding: 12px 16px;
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
            Réinitialisation sécurisée
        </div>
        <div class="floating-pill pill-2">
            <i class="fas fa-envelope"></i>
            Lien par email
        </div>
        <div class="floating-pill pill-3">
            <i class="fas fa-clock"></i>
            Processus rapide
        </div>
        <div class="floating-pill pill-4">
            <i class="fas fa-key"></i>
            Nouveau mot de passe
        </div>
    </div>

    <div class="reset-container">
        <a href="${url.loginUrl}" class="back-login">
            <i class="fas fa-arrow-left me-2"></i>Retour à la connexion
        </a>

        <div class="reset-card">
            <!-- Header -->
            <div class="reset-header">
                <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="brand-logo" />
                <h1 class="reset-title">Mot de passe oublié ?</h1>
                <p class="reset-subtitle">
                    Pas de problème ! Entrez votre adresse e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.
                </p>
            </div>

            <!-- Messages d'erreur/succès -->
            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <i class="fas fa-info-circle me-2"></i>
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <!-- Formulaire de réinitialisation -->
            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                <div class="form-group">
                    <input type="email" 
                           class="form-input" 
                           name="username" 
                           placeholder="Votre adresse e-mail" 
                           required 
                           autofocus>
                </div>

                <button type="submit" class="submit-btn">
                    <i class="fas fa-envelope me-2"></i>Envoyer le lien de réinitialisation
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

</#if>
</@layout.registrationLayout>