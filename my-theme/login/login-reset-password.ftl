<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<@layout.registrationLayout; section>
<#if section = "form">
<div class="auth-container">
    <div class="auth-card">
        <div class="auth-form-section flex-fill">
            <div class="form-header text-center">
                <h1 class="brand">
                    <img src="${url.resourcesPath}/img/logo1.png" alt="SOS MON GARAGE" class="brand-logo" />
                </h1>
                <h1 class="title">Réinitialiser le mot de passe</h1>
                <p class="text-muted">Entrez votre adresse e-mail pour recevoir un lien de réinitialisation</p>
            </div>

            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                <div class="input-group mb-3">
                    <input type="email" class="form-input form-control" name="username" placeholder="Votre adresse e-mail" required autofocus>
                </div>
                <button type="submit" class="submit-btn btn btn-primary-custom w-100 mb-3">
                    <i class="fas fa-envelope me-2"></i>Envoyer le lien
                </button>
            </form>

            <div class="switch-form text-center">
                <a href="${url.loginUrl}" class="link-btn">Retour à la connexion</a>
            </div>
        </div>
    </div>
</div>
</#if>
</@layout.registrationLayout>
