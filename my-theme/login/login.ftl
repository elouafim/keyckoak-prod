<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <a href="/" class="back-home btn btn-primary-custom">
        <i class="fas fa-arrow-left me-2"></i>${msg("backToHome")}
    </a>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-content d-flex flex-row">
                <!-- Left: Forms -->
                <div class="auth-form-section flex-fill">
                    <!-- Login Form -->
                    <div id="loginForm" class="auth-form active">
                        <div class="form-header">
                            <h1 class="brand">
                                <img src="${url.resourcesPath}/img/logo_sos.png" alt="SOS MON GARAGE" class="brand-logo" />
                            </h1>
                            <h1 class="title">${msg("doLogIn")}</h1>
                        </div>
                        <#if social.providers??>
                        <div class="social-login">
                            <#list social.providers as p>
                                <a href="${p.loginUrl}" class="social-btn ${p.alias}-btn">
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
                        <div class="divider"><span>ou</span></div>
                        </#if>
                        <form id="kc-form-login" action="${url.loginAction}" method="post">
                            <div class="input-group mb-3">
                                <input type="text" class="form-input form-control" name="username" placeholder="${msg("usernameOrEmail")}" value="${(login.username!'')}" required autofocus>
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" class="form-input form-control" name="password" placeholder="${msg("password")}" required>
                            </div>
                            <div class="form-options d-flex justify-content-between align-items-center mb-3">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
                                    <label class="form-check-label" for="rememberMe">
                                        ${msg("rememberMe")}
                                    </label>
                                </div>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>
                            <button type="submit" class="submit-btn btn btn-primary-custom w-100 mb-3" name="login">
                                <i class="fas fa-sign-in-alt me-2"></i>${msg("doLogIn")}
                            </button>
                        </form>
                        <div class="switch-form">
                            <span>${msg("noAccount")}</span>
                            <a href="${url.registrationUrl}" class="link-btn">${msg("doRegister")}</a>
                        </div>
                    </div>
                    <!-- Register Form (visuel seulement, soumission réelle via Keycloak) -->
                    <div id="registerForm" class="auth-form" style="display:none;">
                        <div class="form-header">
                            <h1 class="brand">SOS MON GARAGE</h1>
                            <h2 class="title">${msg("doRegister")}</h2>
                        </div>
                        <#if social.providers??>
                        <div class="social-login">
                            <#list social.providers as p>
                                <a href="${p.loginUrl}" class="social-btn ${p.alias}-btn">
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
                        <div class="divider"><span>ou</span></div>
                        </#if>
                        <form id="kc-form-register" action="${url.registrationUrl}" method="get">
                            <button type="submit" class="submit-btn btn btn-primary-custom w-100 mb-3">
                                <i class="fas fa-user-plus me-2"></i>${msg("doRegister")}
                            </button>
                        </form>
                        <div class="switch-form">
                            <span>${msg("alreadyAccount")}</span>
                            <button class="link-btn" type="button" onclick="switchToLogin()">${msg("doLogIn")}</button>
                        </div>
                    </div>
                </div>
                <!-- Right: Visual/Features -->
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
    <!-- Success Modal (optionnel, à activer côté JS si besoin) -->
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
                    <button type="button" class="btn btn-primary-custom" data-bs-dismiss="modal" onclick="switchToLogin()">
                        Se connecter maintenant
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form switching visuel (pas la logique Keycloak)
        function switchToRegister() {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('registerForm').style.display = 'block';
        }
        function switchToLogin() {
            document.getElementById('registerForm').style.display = 'none';
            document.getElementById('loginForm').style.display = 'block';
        }
    </script>
</#if>
</@layout.registrationLayout>