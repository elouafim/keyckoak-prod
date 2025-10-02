<#import "template.ftl" as layout>
<#-- place ceci tout en haut du fichier, après l'import, pour qu'il aille dans le <head> -->
<#macro scripts>
  <script>
    // Force FR pour 1 an, sans recharger la page
    document.cookie = "KEYCLOAK_LOCALE=fr; path=/; max-age=31536000; SameSite=Lax";
    document.cookie = "KC_LOCALE=fr; path=/; max-age=31536000; SameSite=Lax";
  </script>
</#macro>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url.resourcesPath}/login.css">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


<meta name="viewport"
      content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1, user-scalable=no">
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


/* Anti débordement & anti zoom iOS */
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
    .login-container {
        min-height: 100dvh;
        display: grid;
        align-items: center;
        justify-content: center;
        padding: 20px;
        place-items: center;
        position: relative;
        width: 100%;
        box-sizing: border-box;
    }

    /* Carte de connexion */
    .login-card {
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

    .login-card:hover {
        box-shadow: var(--shadow-hover);
        transform: translateY(-5px);
    }

    /* Header */
    .login-header {
        text-align: center;
        margin-bottom: 12px !important;
    }

    .brand-logo {
        max-width: 180px;
        height: auto;
        margin-bottom: 20px;
    }

    .login-title {
        font-size: 1.8rem;
        font-weight: 600;
        color: #2c3e50;
        margin: 0;
        margin-bottom: 4px !important;
    }

    .login-subtitle {
        color: var(--text-muted);
        font-size: 0.95rem;
        margin-top: 2px !important;
    }

    /* Bouton retour */
    .back-home {
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

    .back-home:hover {
        background: #fff;
        transform: translateX(-5px);
        color: var(--primary-hover);
    }

    /* Connexion sociale */
    .social-login {
        margin: 8px 0 10px !important;
    }

    .social-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 50px;
        height: 50px;
        border-radius: 12px;
        font-size: 20px;
        color: #fff;
        text-decoration: none;
        transition: all 0.3s ease;
        margin: 0 8px;
    }

    .google-btn {
        background: linear-gradient(45deg, #db4437, #ff6b6b);
    }

    .facebook-btn {
        background: linear-gradient(45deg, #3b5998, #4267B2);
    }

    .social-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        color: #fff;
    }

    /* Diviseur */
    .divider {
        text-align: center;
        margin: 10px 0 !important;
        position: relative;
    }

    .divider::before {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        top: 50%;
        border-top: 1px solid var(--border-color);
        z-index: 0;
    }

    .divider span {
        background: #fff;
        padding: 0 15px;
        position: relative;
        z-index: 1;
        color: var(--text-muted);
        font-size: 0.9rem;
        font-weight: 500;
    }

    /* Champs de saisie */
    .form-group {
        margin-bottom: 20px;
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

    /* Options du formulaire */
    .form-options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
        flex-wrap: wrap;
        gap: 10px;
    }

    .form-check {
        display: flex;
        align-items: center;
    }

    .form-check-input {
        margin-right: 8px;
    }

    .form-check-label {
        font-size: 0.9rem;
        color: var(--text-muted);
    }

    .forgot-password {
        color: var(--primary-color);
        text-decoration: none;
        font-size: 0.9rem;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .forgot-password:hover {
        color: var(--primary-hover);
    }

    /* Bouton de connexion */
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

    /* Lien d'inscription */
    .switch-form {
        text-align: center;
        padding-top: 20px;
        border-top: 1px solid var(--border-color);
    }

    .switch-form span {
        color: var(--text-muted);
        font-size: 0.95rem;
    }

    .link-btn {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 600;
        transition: color 0.3s ease;
    }

    .link-btn:hover {
        color: var(--primary-hover);
    }

    /* Messages d'erreur */
    .alert {
        margin-bottom: 20px;
        border-radius: var(--border-radius);
        border: none;
    }

    /* Responsive Design */
    @media (max-width: 768px) {

        input, select, textarea { font-size: 16px; } /* pas de zoom iOS */
  .brand-logo { max-width: 120px; }            /* logo jamais géant */


        .body {
            margin: 0;
            padding: 0;
        }

        .login-container {
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

        .login-card {
            padding: 20px 16px;
            margin: 0;
            max-width: 520px;
            width: 100%;
            border-radius: 14px;
            min-height: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            box-shadow: none;
        }

        .login-header {
            margin-bottom: 8px !important;
        }

        .login-title {
            font-size: 1.5rem;
            margin-bottom: 2px !important;
        }


        .login-subtitle{ margin-top: 1px !important; }
        .social-login{ margin: 6px 0 8px !important; }
        .divider{ margin: 8px 0 !important; }

        .brand-logo {
            max-width: 150px;
            margin-bottom: 12px;
        }

        .back-home {
            display: none; /* Caché sur mobile pour plus d'espace */
        }

        .form-options {
            flex-direction: column;
            align-items: stretch;
            gap: 15px;
        }

        .form-check {
            justify-content: center;
        }

        .social-btn {
            width: 45px;
            height: 45px;
            font-size: 18px;
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

        .pill-5 {
            display: none; /* Caché pour éviter l'encombrement */
        }
    }

    @media (max-width: 480px) {
        .login-card {
            padding: 15px;
            width: 100vw;
        }

        .login-title {
            font-size: 1.3rem;
        }

        .login-subtitle {
            font-size: 0.9rem;
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

        .social-btn {
            width: 50px;
            height: 50px;
            font-size: 20px;
            border-radius: 10px;
        }

        .floating-pill {
            font-size: 0.7rem;
            padding: 6px 12px;
        }

        .floating-pill i {
            font-size: 0.75rem;
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

    .login-card {
        animation: fadeInUp 0.6s ease-out;
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

    .pill-5 {
        top: 45%;
        left: 5%;
        animation-delay: 3s;
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

    /* Masquer les pills sur mobile */
    @media (max-width: 768px) {
        .floating-features {
            display: block; /* Maintenant visible sur mobile */
        }
    }
</style>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <!-- Conteneurs flottants animés -->
    <div class="floating-features">
        <div class="floating-pill pill-1">
            <i class="fas fa-clock"></i>
            Déclaration en 5 minutes
        </div>
        <div class="floating-pill pill-2">
            <i class="fas fa-shield-alt"></i>
            100% sécurisé
        </div>
        <div class="floating-pill pill-3">
            <i class="fas fa-chart-line"></i>
            Suivi en temps réel
        </div>
        <div class="floating-pill pill-4">
            <i class="fas fa-headset"></i>
            Support 24h/24
        </div>

    </div>

    <div class="login-container">
        <a href="https://sosgarage-production-967f.up.railway.app" class="back-home">
            <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
        </a>

        <div class="login-card">
            <!-- Header -->
            <div class="login-header">
                <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="brand-logo" />
                <h1 class="login-title">Bienvenue</h1>
                <p class="login-subtitle">Connectez-vous à votre compte</p>
            </div>

<#if message?has_content>
    <div class="alert alert-${message.type}">
        <i class="fas fa-exclamation-triangle me-2"></i>
        <#-- Mapping manuel des messages -->
        <#if message.summary == "Invalid username or password.">
            Identifiant ou mot de passe incorrect.
        <#elseif message.summary == "Account is disabled, contact admin.">
            Votre compte est désactivé, contactez l’administrateur.
        <#elseif message.summary == "Account is temporarily disabled, contact admin.">
            Votre compte est temporairement bloqué, contactez l’administrateur.
        <#else>
            ${kcSanitize(message.summary)?no_esc}
        </#if>
    </div>
</#if>


            <!-- Connexion sociale -->
            <#if social.providers??>
            <div class="social-login text-center">
                <div class="d-flex justify-content-center">
                    <#list social.providers as p>
                      <#if p.alias == "google">
                        <a href="${p.loginUrl}" class="social-btn google-btn" title="Se connecter avec Google">
                          <i class="fab fa-google"></i>
                        </a>
                      </#if>
                    </#list>
                </div>
            </div>
            <div class="divider"><span>ou continuer avec votre email</span></div>
            </#if>

            <!-- Formulaire de connexion -->
            <form id="kc-form-login"
      action="${url.loginAction}${(url.loginAction?contains('?'))?then('&','?')}ui_locales=fr&kc_locale=fr"
      method="post">
                <div class="form-group">
                    <input type="text" 
                           class="form-input" 
                           name="username" 
                           placeholder="Nom d'utilisateur ou adresse e-mail" 
                           value="${(login.username!'')}" 
                           required 
                           autofocus>
                </div>

                <div class="form-group">
                    <input type="password" 
                           class="form-input" 
                           name="password" 
                           placeholder="Mot de passe" 
                           required>
                </div>

                <div class="form-options">
                    <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="form-check">
                        <input class="form-check-input" 
                               type="checkbox" 
                               id="rememberMe" 
                               name="rememberMe" 
                               <#if login.rememberMe??>checked</#if>>
                        <label class="form-check-label" for="rememberMe">
                            Se souvenir de moi
                        </label>
                    </div>
                    
                    </#if>
                    
                    <#if realm.resetPasswordAllowed>
                    <a href="${url.loginResetCredentialsUrl}" class="forgot-password">
                        Mot de passe oublié ?
                    </a>
                    </#if>
                </div>
                <input type="hidden" name="kc_locale" value="fr" />

                <button type="submit" class="submit-btn" name="login">
                    <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                </button>
            </form>

            <!-- Lien d'inscription -->
            <div class="switch-form">
                <span>Pas encore de compte ? </span>
                <a href="https://sosgarage-production-967f.up.railway.app/register" class="link-btn">
                    Créer un compte gratuitement
                </a>
            </div>
        </div>
    </div>

    <!-- Scripts Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    


</#if>
</@layout.registrationLayout>