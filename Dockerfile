FROM quay.io/keycloak/keycloak:26.2.4

# Création de l’utilisateur admin
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# ⚠️ Requis pour forcer Keycloak à générer des URLs en HTTPS
ENV KC_PROXY=edge

# Expose le port sur lequel Railway écoutera
EXPOSE 8080

# Démarre le serveur
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
