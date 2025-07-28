<#import "template.ftl" as layout>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${url.resourcesPath}/css/custom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    .form-input {
        border: 2px solid #ced4da !important;
        border-radius: 8px !important;
        padding: 10px;
    }

    .social-icons {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-bottom: 20px;
    }

    .social-icons a {
        color: white;
        border-radius: 50%;
        padding: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 45px;
        height: 45px;
        text-decoration: none;
    }

    .google-icon {
        background-color: #db4437;
    }

    .facebook-icon {
        background-color: #3b5998;
    }

    .back-home {
        margin-bottom: 20px;
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

    .submit-btn {
        border-radius: 8px !important;
    }
</style>

<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "form">

<a href="https://sosgarage-production-967f.up.railway.app/" class="btn btn-outline-primary back-home">
    <i class="fas fa-arrow-left me-2"></i>Retour à l'accueil
</a>

<div class="card p-4 shadow-sm">
    <div class="text-center mb-3">
        <img src="${url.resourcesPath}/img/logo_sos.png" alt="SOS MON GARAGE" height="60" class="mb-3"/>
        <h3>Connexion</h3>
    </div>

    <#if social.providers??>
    <div class="social-icons">
        <#list social.providers as p>
            <#if p.alias == "google">
                <a href="${p.loginUrl}" class="google-icon"><i class="fab fa-google"></i></a>
            <#elseif p.alias == "facebook">
                <a href="${p.loginUrl}" class="facebook-icon"><i class="fab fa-facebook-f"></i></a>
            </#if>
        </#list>
    </div>
    <div class="divider"><span>ou</span></div>
    </#if>

    <form id="kc-form-login" action="${url.loginAction}" method="post">
        <div class="mb-3">
            <input type="text" class="form-input form-control" name="username" placeholder="Nom d'utilisateur ou e-mail" value="${(login.username!'')}" required autofocus>
        </div>
        <div class="mb-3">
            <input type="password" class="form-input form-control" name="password" placeholder="Mot de passe" required>
        </div>

        <#if realm.rememberMe && !usernameEditDisabled??>
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
            <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
        </div>
        </#if>

        <button type="submit" class="btn btn-primary w-100 submit-btn" name="login">
            <i class="fas fa-sign-in-alt me-2"></i>Se connecter
        </button>

        <#if realm.resetPasswordAllowed>
        <div class="text-end mt-2">
            <a href="${url.loginResetCredentialsUrl}" class="link-secondary">Mot de passe oublié ?</a>
        </div>
        </#if>
    </form>

    <div class="text-center mt-4">
        <span>Pas encore de compte ? </span>
        <a href="https://sosgarage-production-967f.up.railway.app/register">Créer un compte</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</#if>
</@layout.registrationLayout>
