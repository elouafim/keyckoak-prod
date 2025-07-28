<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <a href="/" class="back-home btn btn-primary-custom">
        <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
    </a>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-content d-flex flex-row">
                <!-- Section Formulaire -->
                <div class="auth-form-section flex-fill">
                    <div id="loginForm" class="auth-form active">
                        <div class="form-header text-center">
                            <img src="${url.resourcesPath}/img/logo_sos.png" alt="SOS MON GARAGE" class="brand-logo mb-3" />
                            <h1 class="title">Connexion</h1>
                        </div>

                        <#if social.providers??>
                        <div class="social-login text-center mb-3">
                            <#list social.providers as p>
                                <a href="${p.loginUrl}" class="social-btn ${p.alias}-btn me-2">
                                    <#if p.alias == "google">
                                        <i class="fab fa-google"></i>
                                    <#elseif p.alias == "facebook">
                                        <i class="fab fa-facebook-f"></i>
                                    <#else>
                                        <i class="fas fa-user"></i>
                                    </#if>
                                </a>
                            </#list>
                        </div>
                        <div class="divider text-center"><span>ou</span></div>
                        </#if>

                        <form id="kc-form-login" action="${url.loginAction}" method="post" class="mt-3">
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
                                    <label class="form-check-label" for="rememberMe">
                                        Se souvenir de moi
                                    </label>
                                </div>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="forgot-password">Mot de passe oublié ?</a>
                                </#if>
                            </div>
                            <button type="submit" class="submit-btn btn btn-primary-custom w-100 mb-3">
                                <i class="fas fa-sign-in-alt me-2"></i>Se connecter
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Section visuelle droite -->
                <div class="auth-visual-section flex-fill" style="background-image: url('${url.resourcesPath}/img/img2.jpg'); background-size: cover; background-position: center;">
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

    <!-- Modal de succès (optionnel) -->
    <div class="modal fade" id="successModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <div class="mb-3">
                        <i class="fas fa-check-circle fa-4x text-success"></i>
                    </div>
                    <h4 class="text-success mb-3">Inscription réussie !</h4>
                    <p class="text-muted mb-4">
                        Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter.
                    </p>
                    <button type="button" class="btn btn-primary-custom" data-bs-dismiss="modal" onclick="switchToLogin()">
                        Se connecter maintenant
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</#if>
</@layout.registrationLayout>