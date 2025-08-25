<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    /* Styles de base */
    .login-container {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        background-color: #f8f9fa;
    }
    
    .login-card {
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        max-width: 1000px;
        width: 100%;
    }
    
    .form-section {
        padding: 2.5rem;
    }
    
    .visual-section {
        background: linear-gradient(135deg, #004aad 0%, #6c63ff 100%);
        color: white;
        padding: 2.5rem;
        display: flex;
        flex-direction: column;
        justify-content: center;
        position: relative;
        overflow: hidden;
    }
    
    .visual-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-image: url('${url.resourcesPath}/img/img2.jpg');
        background-size: cover;
        background-position: center;
        opacity: 0.7;
        z-index: 0;
    }
    
    .visual-section > * {
        position: relative;
        z-index: 1;
    }
    
    /* Logo */
    .site-logo {
        max-width: 200px;
        height: auto;
        margin: 0 auto 1.5rem;
        display: block;
    }
    
    /* Titres */
    .page-title {
        font-size: 1.8rem;
        margin-bottom: 2rem;
        text-align: center;
        color: #333;
        font-weight: 600;
    }
    
    /* Formulaires */
    .form-input {
        border-radius: 10px;
        border: 2px solid #e9ecef;
        padding: 12px 15px;
        font-size: 16px;
        transition: all 0.3s ease;
    }
    
    .form-input:focus {
        border-color: #004aad;
        box-shadow: 0 0 0 0.2rem rgba(0, 74, 173, 0.25);
    }
    
    /* Boutons */
    .btn-primary-custom {
        background: linear-gradient(135deg, #004aad 0%, #6c63ff 100%);
        border: none;
        color: white;
        padding: 12px 30px;
        border-radius: 10px;
        font-weight: 600;
        transition: all 0.3s ease;
        font-size: 16px;
    }
    
    .btn-primary-custom:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(0, 74, 173, 0.3);
        color: white;
    }
    
    .back-home-btn {
        background: transparent;
        border: 2px solid #004aad;
        color: #004aad;
        padding: 10px 20px;
        border-radius: 10px;
        font-weight: 600;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        margin-bottom: 20px;
    }
    
    .back-home-btn:hover {
        background: #004aad;
        color: white;
    }
    
    /* Séparateur */
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
    
    /* Boutons sociaux */
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
    
    /* Options du formulaire */
    .form-options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 1.5rem 0;
    }
    
    .forgot-password {
        color: #6c63ff;
        text-decoration: none;
        font-size: 14px;
        transition: all 0.3s ease;
    }
    
    .forgot-password:hover {
        color: #004aad;
        text-decoration: underline;
    }
    
    /* Section visuelle */
    .feature-pin {
        position: absolute;
        display: flex;
        align-items: center;
        color: white;
    }
    
    .top-left {
        top: 20px;
        left: 20px;
    }
    
    .top-right {
        top: 20px;
        right: 20px;
        text-align: right;
    }
    
    .bottom-center {
        bottom: 20px;
        left: 0;
        right: 0;
        text-align: center;
    }
    
    .feature-highlight {
        display: block;
        font-size: 1.2rem;
        font-weight: bold;
        margin-bottom: 5px;
    }
    
    .feature-text {
        font-size: 0.9rem;
    }
    
    .feature-name {
        font-weight: 600;
        margin-bottom: 5px;
        display: block;
    }
    
    .feature-desc {
        font-size: 0.9rem;
        opacity: 0.9;
    }
    
    /* Responsive */
    @media (max-width: 992px) {
        .form-section, .visual-section {
            padding: 2rem;
        }
        
        .site-logo {
            max-width: 180px;
        }
        
        .page-title {
            font-size: 1.6rem;
        }
    }
    
    @media (max-width: 768px) {
        .login-container {
            padding: 0;
            align-items: stretch;
        }
        
        .login-card {
            border-radius: 0;
            box-shadow: none;
        }
        
        .form-section {
            padding: 2rem 1.5rem;
        }
        
        .visual-section {
            min-height: 250px;
            order: -1;
        }
        
        .site-logo {
            max-width: 150px;
        }
        
        .page-title {
            font-size: 1.5rem;
        }
        
        .form-options {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
        }
        
        .back-home-btn {
            align-self: center;
            margin-top: 1rem;
        }
    }
    
    @media (max-width: 576px) {
        .form-section {
            padding: 1.5rem;
        }
        
        .site-logo {
            max-width: 130px;
        }
        
        .page-title {
            font-size: 1.4rem;
            margin-bottom: 1.5rem;
        }
        
        .form-input {
            padding: 10px 12px;
            font-size: 15px;
        }
        
        .btn-primary-custom {
            padding: 10px 20px;
            font-size: 15px;
        }
    }
    
    @media (max-width: 380px) {
        .form-section {
            padding: 1.2rem;
        }
        
        .site-logo {
            max-width: 110px;
        }
        
        .page-title {
            font-size: 1.3rem;
        }
    }
</style>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <div class="login-container">
        <div class="login-card">
            <div class="row g-0">
                <!-- Formulaire -->
                <div class="col-12 col-lg-6 form-section">
                    <a href="https://sosgarage-production-967f.up.railway.app" class="back-home-btn">
                        <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
                    </a>

                    <div id="loginForm" class="auth-form active">
                        <div class="text-center mb-4">
                            <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="site-logo">
                            <h1 class="page-title">Connectez-vous</h1>
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
                            <div class="mb-3">
                                <input type="text" class="form-control form-input" name="username" placeholder="Nom d'utilisateur ou e-mail" value="${(login.username!'')}" required autofocus>
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control form-input" name="password" placeholder="Mot de passe" required>
                            </div>

                            <div class="form-options">
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

                            <button type="submit" class="btn btn-primary-custom w-100 mb-3" name="login">
                                <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                            </button>
                        </form>

                        <div class="text-center pt-3 border-top">
                            <span>Pas encore de compte ? </span>
                            <a href="https://sosgarage-production-967f.up.railway.app/register" class="forgot-password">Créer un compte</a>
                        </div>
                    </div>
                </div>

                <!-- Section visuelle -->
                <div class="col-12 col-lg-6 visual-section">
                    <div class="feature-pin top-left">
                        <i class="fas fa-clock me-2"></i>
                        <div>
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