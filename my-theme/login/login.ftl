<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    .form-input {
        border-radius: 10px !important;
        border: 2px solid #ccc !important;
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
        border-top: 1px solid #ccc;
        z-index: 0;
    }

    .divider span {
        background: #fff;
        padding: 0 10px;
        position: relative;
        z-index: 1;
    }

    .back-home {
        margin-bottom: 15px;
    }

    /* ✅ Container + Card */
    .auth-container {
        max-width: 1200px;
        margin: auto;
        padding: 15px;
    }

    .auth-card {
        background: #fff;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    .auth-form-section {
        padding: 30px;
    }

    .auth-visual-section {
        min-height: 400px;
        color: #fff;
        position: relative;
    }

    /* ✅ Mobile fix */
    @media (max-width: 767px) {
        .auth-container {
            max-width: 100%;  /* pleine largeur */
            padding: 0;       /* supprime marges */
        }

        .auth-card {
            border-radius: 0;  /* coins droits */
            box-shadow: none;  /* supprime ombre */
        }

        .auth-form-section {
            padding: 20px;
        }

        .auth-visual-section {
            height: 250px; /* image plus grande */
            order: -1;     /* image au-dessus */
        }

        .brand-logo {
            max-width: 140px;
        }

        .form-header h1.title {
            font-size: 1.4rem;
        }
    }
</style>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <a href="https://sosgarage-production-967f.up.railway.app" class="back-home btn btn-primary-custom">
        <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
    </a>

    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-content row g-0">
                
                <!-- Formulaire -->
                <div class="auth-form-section col-12 col-md-6">
                    <div id="loginForm" class="auth-form active">
                        <div class="form-header text-center">
                            <h1 class="brand">
                                <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="brand-logo" />
                            </h1>
                            <h1 class="title">Connectez-vous</h1>
                        </div>

                        <!-- Boutons Google -->
                        <#if social.providers??>
                        <div class="social-login text-center">
                            <div class="d-flex justify-content-center gap-3 mb-3">
                                <#list social.providers as p>
                                  <#if p.alias == "google">
                                    <a href="${p.loginUrl}" class="social-btn google-btn">
                                      <i class="fab fa-google"></i>
                                    </a>
                                  </#if>
                                </#list>
                            </div>
                        </div>
                        <div class="divider"><span>ou</span></div>
                        </#if>

                        <!-- Formulaire classique -->
                        <form id="kc-form-login" action="${url.loginAction}" method="post">
                            <div class="input-group mb-3">
                                <input type="text" class="form-input form-control" name="username" placeholder="Nom d'utilisateur ou e-mail" value="${(login.username!'')}" required autofocus>
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" class="form-input form-control" name="password" placeholder="Mot de passe" required>
                            </div>

                            <div class="form-options d-flex justify-content-between align-items-center mb-3">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
                                    <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                                </div>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="forgot-password">Mot de passe oublié ?</a>
                                </#if>
                            </div>

                            <button type="submit" class="submit-btn btn btn-primary-custom w-100 mb-3" name="login">
                                <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                            </button>
                        </form>

                        <div class="switch-form text-center">
                            <span>Pas encore de compte ? </span>
                            <a href="https://sosgarage-production-967f.up.railway.app/register" class="link-btn">Créer un compte</a>
                        </div>
                    </div>
                </div>

                <!-- Image / visuel -->
                <div class="auth-visual-section col-12 col-md-6" 
                     style="background-image: url('${url.resourcesPath}/img/img2.jpg'); background-size: cover; background-position: center;">
                    <div class="visual-content">
                        <div class="features-overlay">
                            <div class="feature-pin top-left">
                                <i class="fas fa-clock"></i>
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
                                <span class="feature-name">Suivi en temps réel</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal d'inscription réussie -->
    <div class="modal fade" id="successModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <div class="mb-3">
                        <i class="fas fa-check-circle fa-4x text-success"></i>
                    </div>
                    <h4 class="text-success mb-3">Inscription réussie !</h4>
                    <p class="text-muted mb-4">
                        Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter et commencer à utiliser nos services.
                    </p>
                    <button type="button" class="btn btn-primary-custom" data-bs-dismiss="modal" onclick="switchToLogin()">Se connecter maintenant</button>
                </div>
            </div>
        </div>
    </div>

    <!-- JS Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</#if>
</@layout.registrationLayout>
