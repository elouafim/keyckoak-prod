<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="login.css?v=6">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css?v=6">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <a href="https://sosgarage-production-967f.up.railway.app" class="sg-back-home btn btn-primary-custom">
        <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
    </a>

    <div class="sg-auth">
        <div class="sg-auth__card">
            <div class="row g-0">
                
                <!-- Formulaire -->
                <div class="sg-auth__form col-12 col-md-6">
                    <div id="loginForm" class="sg-auth__form-pane active">
                        <div class="sg-auth__header text-center">
                            <h1 class="sg-auth__brand">
                                <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="sg-logo" />
                            </h1>
                            <h1 class="sg-auth__title">Connectez-vous</h1>
                        </div>

                        <!-- Bouton Google -->
                        <#if social.providers??>
                        <div class="sg-social text-center">
                            <div class="d-flex justify-content-center gap-3 mb-3">
                                <#list social.providers as p>
                                  <#if p.alias == "google">
                                    <a href="${p.loginUrl}" class="sg-social-btn sg-social-btn--google" aria-label="Continuer avec Google">
                                      <i class="fab fa-google"></i>
                                    </a>
                                  </#if>
                                </#list>
                            </div>
                        </div>
                        <div class="sg-divider"><span>ou</span></div>
                        </#if>

                        <!-- Formulaire classique -->
                        <form id="kc-form-login" action="${url.loginAction}" method="post">
                            <div class="input-group mb-3">
                                <input type="text" class="sg-input form-control" name="username" placeholder="Nom d'utilisateur ou e-mail" value="${(login.username!'')}" required autofocus>
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" class="sg-input form-control" name="password" placeholder="Mot de passe" required>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
                                    <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                                </div>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="sg-forgot">Mot de passe oublié ?</a>
                                </#if>
                            </div>

                            <button type="submit" class="submit-btn btn btn-primary-custom w-100 mb-3" name="login">
                                <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                            </button>
                        </form>

                        <div class="sg-switch text-center">
                            <span>Pas encore de compte ? </span>
                            <a href="https://sosgarage-production-967f.up.railway.app/register" class="sg-link">Créer un compte</a>
                        </div>
                    </div>
                </div>

                <!-- Image / visuel -->
                <div class="sg-auth__visual col-12 col-md-6" 
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

    <!-- Modal d'inscription réussie (inchangé) -->
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</#if>
</@layout.registrationLayout>
