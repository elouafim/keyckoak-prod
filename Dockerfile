FROM quay.io/keycloak/keycloak:26.2.4

# Configuration de l'administrateur initial
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin1
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin1

# Configuration du proxy et de l'hôte
ENV KC_PROXY=edge
ENV KC_PROXY_HEADERS=xforwarded
ENV PROXY_ADDRESS_FORWARDING=true
ENV KC_HOSTNAME=keyckoak-prod-production-551c.up.railway.app
ENV KC_HOSTNAME_STRICT=true
ENV KC_HOSTNAME_STRICT_HTTPS=true
ENV KC_HTTP_ENABLED=true
ENV QUARKUS_HTTP_PROXY_ADDRESS_FORWARDING=true

# Configuration de la base de données PostgreSQL hébergée sur Railway
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://switchback.proxy.rlwy.net:58642/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=iFNynNNQMiaCKdnEVYeLhVEEMBHFXulW


# Copie de ton thème personnalisé
COPY my-theme /opt/keycloak/themes/my-theme

# Port exposé
EXPOSE 8080

# Commande de lancement
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
