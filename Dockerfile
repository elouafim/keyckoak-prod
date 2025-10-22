FROM quay.io/keycloak/keycloak:26.2.4

# --- Création de l'administrateur initial ---
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin1
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin1


# --- Configuration du proxy et du host ---
ENV KC_PROXY=edge
ENV KC_PROXY_HEADERS=xforwarded
ENV PROXY_ADDRESS_FORWARDING=true
ENV KC_HOSTNAME=keyckoak-prod-production-551c.up.railway.app
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true
ENV QUARKUS_HTTP_PROXY_ADDRESS_FORWARDING=true

# --- Autoriser le bootstrap admin à distance ---
ENV KC_HTTP_RELATIVE_PATH=/
ENV KC_FEATURES=admin-fine-grained-authz
ENV KC_LOG_LEVEL=info

# --- Configuration base de données ---
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://switchback.proxy.rlwy.net:58642/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=iFNynNNQMiaCKdnEVYeLhVEEMBHFXulW

# --- Thème personnalisé ---
COPY my-theme /opt/keycloak/themes/my-theme

# --- Port exposé ---
EXPOSE 8080

# --- Lancement en mode DEV (autorise la création admin à distance) ---
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
