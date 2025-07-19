<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div class="auth-container">
            <div class="auth-card">
                <div class="row g-0">
                    <!-- Left side - Branding -->
                    <div class="col-lg-5">
                        <div class="auth-left">
                            <div class="car-icon">
                                <i class="fas fa-car-side"></i>
                            </div>
                            <div class="brand-logo">SOS MON GARAGE</div>
                            <p class="lead mb-4">Votre partenaire de confiance pour la gestion de vos sinistres automobiles</p>
                            <div class="features">
                                <div class="mb-3">
                                    <i class="fas fa-check-circle me-2"></i>
                                    Déclaration rapide en 5 minutes
                                </div>
                                <div class="mb-3">
                                    <i class="fas fa-check-circle me-2"></i>
                                    Assistance 24h/24 et 7j/7
                                </div>
                                <div class="mb-3">
                                    <i class="fas fa-check-circle me-2"></i>
                                    Suivi en temps réel
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right side - Login Form -->
                    <div class="col-lg-7">
                        <div class="auth-right">
                            <div class="text-center mb-4">
                                <h2 class="text-primary-blue fw-bold">Connexion</h2>
                                <p class="text-muted">Connectez-vous à votre espace personnel</p>
                            </div>

                            <div id="kc-form">
                                <div id="kc-form-wrapper">
                                    <form id="kc-form-login" onsubmit="login.disabled=true;return true;" action="${url.loginAction}" method="post">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="fas fa-envelope"></i>
                                                </span>
                                                <input tabindex="1" 
                                                       class="form-control" 
                                                       id="username" 
                                                       name="username" 
                                                       value="${(login.username!'')}" 
                                                       type="text" 
                                                       autofocus 
                                                       autocomplete="off"
                                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                                       placeholder="${msg("usernameOrEmail")}"
                                                       required />
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="fas fa-lock"></i>
                                                </span>
                                                <input tabindex="2" 
                                                       class="form-control" 
                                                       id="password" 
                                                       name="password" 
                                                       type="password" 
                                                       autocomplete="off"
                                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                                       placeholder="${msg("password")}"
                                                       required />
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <#if realm.rememberMe && !usernameEditDisabled??>
                                                <div class="form-check">
                                                    <input tabindex="3" 
                                                           class="form-check-input" 
                                                           id="rememberMe" 
                                                           name="rememberMe" 
                                                           type="checkbox" 
                                                           <#if login.rememberMe??>checked</#if>>
                                                    <label class="form-check-label" for="rememberMe">
                                                        ${msg("rememberMe")}
                                                    </label>
                                                </div>
                                            </#if>
                                            <#if realm.resetPasswordAllowed>
                                                <a href="${url.loginResetCredentialsUrl}" class="forgot-password">
                                                    ${msg("doForgotPassword")}
                                                </a>
                                            </#if>
                                        </div>

                                        <div id="kc-form-buttons" class="form-group">
                                            <input tabindex="4" 
                                                   class="btn btn-primary-custom w-100 mb-3" 
                                                   name="login" 
                                                   id="kc-login" 
                                                   type="submit" 
                                                   value="${msg("doLogIn")}"/>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                <div class="divider">
                                    <span>ou continuer avec</span>
                                </div>

                                <div class="switch-form">
                                    <span class="text-muted">Pas encore de compte ? </span>
                                    <a href="${url.registrationUrl}" class="switch-btn">Créer un compte</a>
                                </div>
                            </#if>

                            <#if realm.password && social.providers??>
                                <div class="divider">
                                    <span>ou continuer avec</span>
                                </div>

                                <div class="social-login">
                                    <#list social.providers as p>
                                        <a href="${p.loginUrl}" class="social-btn">
                                            <#if p.alias == "google">
                                                <i class="fab fa-google"></i>
                                                Continuer avec Google
                                            <#elseif p.alias == "facebook">
                                                <i class="fab fa-facebook"></i>
                                                Continuer avec Facebook
                                            <#else>
                                                <i class="fas fa-user"></i>
                                                ${p.displayName}
                                            </#if>
                                        </a>
                                    </#list>
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>