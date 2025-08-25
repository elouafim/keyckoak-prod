<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="login.css">
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
    }

    /* Container principal */
    .login-container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
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
    }

    .login-card:hover {
        box-shadow: var(--shadow-hover);
        transform: translateY(-5px);
    }

    /* Header */
    .login-header {
        text-align: center;
        margin-bottom: 30px;
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
    }

    .login-subtitle {
        color: var(--text-muted);
        font-size: 0.95rem;
        margin-top: 8px;
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
        margin-bottom: 25px;
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
        margin: 25px 0;
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
        border-radius: var(--border-radius);
        font-size: 1rem;
        transition: all 0.3s ease;
        background: #f8f9fa;
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
        background: linear-gradient(45deg, var(--primary-color), #0099ff);
        border: none;
        border-radius: var(--border-radius);
        color: #fff;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-bottom: 20px;
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
        .login-container {
            padding: 10px;
            min-height: 100vh;
        }

        .login-card {
            padding: 30px 20px;
            margin: 10px;
            max-width: 100%;
        }

        .login-title {
            font-size: 1.5rem;
        }

        .brand-logo {
            max-width: 150px;
        }

        .back-home {
            position: relative;
            top: auto;
            left: auto;
            margin-bottom: 20px;
            display: inline-block;
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
    }

    @media (max-width: 480px) {
        .login-card {
            padding: 25px 15px;
        }

        .login-title {
            font-size: 1.3rem;
        }

        .form-input {
            padding: 10px 14px;
            font-size: 0.95rem;
        }

        .submit-btn {
            padding: 12px;
            font-size: 0.95rem;
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
</style>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <div class="login-container">
        <a href="https://sosgarage-production-967f.up.railway.app" class="back-home">
            <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
        </a>

        <div class="login-card">
            <!-- Header -->
            <div class="login-header">
                <img src="${url.resourcesPath}/img/logo_sos.png" alt="SOS MON GARAGE" class="brand-logo" />
                <h1 class="login-title">Bienvenue</h1>
                <p class="login-subtitle">Connectez-vous à votre compte</p>
            </div>

            <!-- Messages d'erreur -->
            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    ${kcSanitize(message.summary)?no_esc}
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
                      <#if p.alias == "facebook">
                        <a href="${p.loginUrl}" class="social-btn facebook-btn" title="Se connecter avec Facebook">
                          <i class="fab fa-facebook-f"></i>
                        </a>
                      </#if>
                    </#list>
                </div>
            </div>
            <div class="divider"><span>ou continuer avec votre email</span></div>
            </#if>

            <!-- Formulaire de connexion -->
            <form id="kc-form-login" action="${url.loginAction}" method="post">
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