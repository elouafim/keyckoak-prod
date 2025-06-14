FROM quay.io/keycloak/keycloak:26.2.4

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

CMD ["start-dev"]
