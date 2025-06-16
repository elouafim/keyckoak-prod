FROM quay.io/keycloak/keycloak:26.2.4

# 👇 admin
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# 👇 reverse proxy (Railway) + hostname strict HTTPS
ENV KC_PROXY=edge
ENV KC_HOSTNAME=keyckoak-prod-production.up.railway.app
ENV KC_HOSTNAME_STRICT=true
ENV KC_HOSTNAME_STRICT_HTTPS=true

# 👇 on désactive HTTPS interne (Railway fait le job) et on écoute en HTTP
ENV KC_HTTP_ENABLED=true

# 👇 on active la prise en compte du X-Forwarded-Proto
ENV QUARKUS_HTTP_PROXY_ADDRESS_FORWARDING=true

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
