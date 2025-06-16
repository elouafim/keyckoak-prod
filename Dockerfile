FROM quay.io/keycloak/keycloak:26.2.4

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Pour les URLs en HTTPS correctes
ENV KC_PROXY=edge
ENV KC_HOSTNAME=keyckoak-prod-production.up.railway.app
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_URL=https://keyckoak-prod-production.up.railway.app
ENV KC_HOSTNAME_ADMIN_URL=https://keyckoak-prod-production.up.railway.app
ENV KC_HTTP_ENABLED=true

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
