<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- IMPORTANT : charge d'abord tes styles globaux, puis login.css pour qu'il prenne le dessus -->
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css?v=9">
<link rel="stylesheet" href="login.css?v=9">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">

  <!-- Bouton retour en haut -->
  <div class="container sg-topbar">
    <a href="https://sosgarage-production-967f.up.railway.app" class="btn btn-primary sg-back">
      <i class="fas fa-arrow-left me-2"></i> Retour à l'accueil
    </a>
  </div>

  <!-- Carte centrée -->
  <div class="sg-auth">
    <div class="sg-card">
      <div class="row g-0 align-items-stretch">

        <!-- Formulaire -->
        <div class="col-12 col-md-6 order-1 order-md-1">
          <section class="sg-form">

            <header class="sg-header text-center">
              <h1 class="sg-brand m-0">
                <img src="${url.resourcesPath}/img/logo.png"
                     alt="SOS MON GARAGE"
                     class="sg-logo">
              </h1>
              <h2 class="sg-title">Connectez-vous</h2>
            </header>

            <#if social.providers??>
              <div class="sg-social text-center">
                <div class="d-flex justify-content-center gap-3">
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

            <form id="kc-form-login" action="${url.loginAction}" method="post" novalidate>
              <div class="mb-3">
                <input type="text"
                       class="form-control sg-input"
                       name="username"
                       placeholder="Nom d'utilisateur ou e-mail"
                       value="${(login.username!'')}"
                       required autofocus>
              </div>

              <div class="mb-3">
                <input type="password"
                       class="form-control sg-input"
                       name="password"
                       placeholder="Mot de passe"
                       required>
              </div>

              <div class="d-flex justify-content-between align-items-center mb-3">
                <#if realm.rememberMe && !usernameEditDisabled??>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
                    <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                  </div>
                </#if>
                <#if realm.resetPasswordAllowed>
                  <a href="${url.loginResetCredentialsUrl}" class="sg-link sg-link--muted">Mot de passe oublié ?</a>
                </#if>
              </div>

              <button type="submit" name="login" class="btn btn-primary w-100 sg-submit">
                <i class="fas fa-sign-in-alt me-2"></i> Se connecter
              </button>
            </form>

            <div class="sg-switch text-center">
              <span>Pas encore de compte ? </span>
              <a href="https://sosgarage-production-967f.up.railway.app/register" class="sg-link">Créer un compte</a>
            </div>

          </section>
        </div>

        <!-- Visuel (caché en mobile) -->
        <div class="col-12 col-md-6 order-2 order-md-2">
          <aside class="sg-visual"
                 style="background-image:url('${url.resourcesPath}/img/img2.jpg');">
            <!-- tu peux ajouter des éléments décoratifs ici si besoin -->
          </aside>
        </div>

      </div>
    </div>
  </div>

  <!-- Optionnel : modal de succès (inchangé) -->
  <div class="modal fade" id="successModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body text-center p-4">
          <div class="mb-3"><i class="fas fa-check-circle fa-4x text-success"></i></div>
          <h4 class="text-success mb-3">Inscription réussie !</h4>
          <p class="text-muted mb-4">
            Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter et commencer à utiliser nos services.
          </p>
          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Se connecter maintenant</button>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</#if>
</@layout.registrationLayout>
