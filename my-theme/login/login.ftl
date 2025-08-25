<#import "template.ftl" as layout>
<#assign styles = ["login.css"]>
<#assign scripts = []>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">
    <a href="https://sosgarage-production-967f.up.railway.app" class="back-home">
        <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
    </a>

    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-content">
                <!-- Formulaire -->
                <div class="auth-form-section">
                    <div id="loginForm" class="auth-form active">
                        <div class="form-header text-center">
                            <h1 class="brand">
                                <img src="${url.resourcesPath}/img/logo.png" alt="SOS MON GARAGE" class="brand-logo">
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
                                <button type="button" class="password-toggle">
                                    <i class="fas fa-eye"></i>
                                </button>
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
                <div class="auth-visual-section" 
                     style="background-image: url('${url.resourcesPath}/img/img2.jpg');">
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

    <script>
        // Fonction pour basculer la visibilité du mot de passe
        document.querySelector('.password-toggle').addEventListener('click', function() {
            const passwordInput = document.querySelector('input[name="password"]');
            const icon = this.querySelector('i');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    </script>
</#if>
</@layout.registrationLayout>