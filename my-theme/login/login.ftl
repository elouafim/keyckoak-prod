<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">

<!-- Navigation de retour -->
<nav class="top-nav">
    <a href="https://sosgarage-production-967f.up.railway.app" class="back-link">
        <i class="fas fa-arrow-left"></i>
        <span>Retour à l'accueil</span>
    </a>
</nav>

<!-- Container principal -->
<main class="auth-main">
    <div class="auth-container">
        <div class="auth-card">
            
            <!-- Section visuelle -->
            <aside class="auth-visual" aria-label="Présentation des services">
                <div class="visual-overlay"></div>
                <div class="visual-content">
                    <div class="brand-showcase">
                        <i class="fas fa-car-side brand-icon"></i>
                        <h2 class="brand-title">SOS MON GARAGE</h2>
                        <p class="brand-subtitle">Votre partenaire automobile de confiance</p>
                    </div>
                    
                    <div class="features-grid">
                        <div class="feature-card">
                            <i class="fas fa-clock feature-icon"></i>
                            <h3>Déclaration rapide</h3>
                            <p>En moins de 5 minutes</p>
                        </div>
                        <div class="feature-card">
                            <i class="fas fa-headset feature-icon"></i>
                            <h3>Assistance 24/7</h3>
                            <p>Support continu</p>
                        </div>
                        <div class="feature-card">
                            <i class="fas fa-chart-line feature-icon"></i>
                            <h3>Suivi en temps réel</h3>
                            <p>Transparence totale</p>
                        </div>
                    </div>
                </div>
            </aside>

            <!-- Section formulaire -->
            <section class="auth-form-wrapper">
                <div class="form-container">
                    
                    <!-- En-tête -->
                    <header class="form-header">
                        <div class="logo-container">
                            <img 
                                src="${url.resourcesPath}/img/logo.png"
                                alt="Logo SOS MON GARAGE"
                                class="site-logo"
                                loading="lazy"
                            />
                        </div>
                        <h1 class="form-title">Connexion</h1>
                        <p class="form-subtitle">Accédez à votre espace client</p>
                    </header>

                    <!-- Connexion sociale -->
                    <#if social.providers??>
                    <div class="social-login">
                        <#list social.providers as p>
                            <#if p.alias == "google">
                                <a href="${p.loginUrl}" class="social-btn google-btn">
                                    <i class="fab fa-google"></i>
                                    <span>Continuer avec Google</span>
                                </a>
                            </#if>
                        </#list>
                        
                        <div class="divider">
                            <span>ou</span>
                        </div>
                    </div>
                    </#if>

                    <!-- Formulaire principal -->
                    <form id="kc-form-login" action="${url.loginAction}" method="post" class="login-form" novalidate>
                        
                        <!-- Champ email/username -->
                        <div class="form-group">
                            <label for="username" class="form-label">
                                <i class="fas fa-user"></i>
                                Email ou nom d'utilisateur
                            </label>
                            <input 
                                type="text" 
                                id="username"
                                name="username" 
                                class="form-control"
                                value="${(login.username!'')}"
                                placeholder="Saisissez votre email"
                                required 
                                autofocus
                                autocomplete="username"
                            />
                            <div class="form-feedback"></div>
                        </div>

                        <!-- Champ mot de passe -->
                        <div class="form-group">
                            <label for="password" class="form-label">
                                <i class="fas fa-lock"></i>
                                Mot de passe
                            </label>
                            <div class="password-wrapper">
                                <input 
                                    type="password" 
                                    id="password"
                                    name="password" 
                                    class="form-control"
                                    placeholder="Saisissez votre mot de passe"
                                    required
                                    autocomplete="current-password"
                                />
                                <button type="button" class="password-toggle" aria-label="Afficher/masquer le mot de passe">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <div class="form-feedback"></div>
                        </div>

                        <!-- Options du formulaire -->
                        <div class="form-options">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox-wrapper">
                                <input 
                                    type="checkbox" 
                                    id="rememberMe" 
                                    name="rememberMe" 
                                    class="form-checkbox"
                                    <#if login.rememberMe??>checked</#if>
                                />
                                <label for="rememberMe" class="checkbox-label">
                                    Se souvenir de moi
                                </label>
                            </div>
                            </#if>
                            
                            <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}" class="forgot-link">
                                Mot de passe oublié ?
                            </a>
                            </#if>
                        </div>

                        <!-- Bouton de connexion -->
                        <button type="submit" class="submit-btn" name="login">
                            <span class="btn-content">
                                <i class="fas fa-sign-in-alt"></i>
                                Se connecter
                            </span>
                            <div class="btn-loader">
                                <i class="fas fa-spinner fa-spin"></i>
                            </div>
                        </button>

                    </form>

                    <!-- Lien d'inscription -->
                    <footer class="form-footer">
                        <p class="signup-prompt">
                            Pas encore de compte ? 
                            <a href="https://sosgarage-production-967f.up.railway.app/register" class="signup-link">
                                Créer un compte gratuitement
                            </a>
                        </p>
                    </footer>

                </div>
            </section>

        </div>
    </div>
</main>

<!-- Modal de succès -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body text-center">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h3 class="success-title">Inscription réussie !</h3>
                <p class="success-message">
                    Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter et accéder à tous nos services.
                </p>
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">
                    Commencer maintenant
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Toggle password visibility
    const passwordToggle = document.querySelector('.password-toggle');
    const passwordInput = document.querySelector('#password');
    
    if (passwordToggle && passwordInput) {
        passwordToggle.addEventListener('click', function() {
            const type = passwordInput.type === 'password' ? 'text' : 'password';
            passwordInput.type = type;
            const icon = this.querySelector('i');
            icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
        });
    }

    // Form validation and loading state
    const form = document.querySelector('#kc-form-login');
    const submitBtn = document.querySelector('.submit-btn');
    
    if (form && submitBtn) {
        form.addEventListener('submit', function() {
            submitBtn.classList.add('loading');
            submitBtn.disabled = true;
        });
    }

    // Auto-hide alerts
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.opacity = '0';
            setTimeout(() => alert.remove(), 300);
        }, 5000);
    });
});
</script>

</#if>
</@layout.registrationLayout>