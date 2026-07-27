# language: es

Característica: Registro y Seleccion de Rol
  Como nuevo usuario de Waup
  Quiero crear mi cuenta y elegir mi rol inicial
  Para ser derivado al onboarding correcto dentro de la app

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el usuario aun no esta registrado
    Y que la vista inicial es "waup_auth_start"
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El usuario entra al flujo de registro/login
    Cuando el usuario abre la app por primera vez
    Entonces el componente "waup-screen-auth-start" entra en estado "visible"
    Y el componente "waup-button-go-to-register" pasa a estado "enabled"
    Y el componente "waup-button-go-to-login" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-auth-start"

  Escenario: El usuario va a la pantalla de registro
    Dado que la vista actual esta en "waup_auth_start"
    Cuando el usuario acciona el componente "waup-button-go-to-register"
    Entonces el componente "waup-screen-register" entra en estado "visible"
    Y el componente "waup-button-signup-phone" pasa a estado "enabled"
    Y el componente "waup-button-signup-google" pasa a estado "enabled"
    Y el componente "waup-checkbox-terms-and-conditions" pasa a estado "unchecked"
    Y el foco de accesibilidad se mueve al componente "waup-heading-register"

  Escenario: El usuario va a la pantalla de login
    Dado que la vista actual esta en "waup_auth_start"
    Cuando el usuario acciona el componente "waup-button-go-to-login"
    Entonces el componente "waup-screen-login" entra en estado "visible"
    Y el componente "waup-input-login-identifier" pasa a estado "enabled"
    Y el componente "waup-button-submit-login" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-login"

  Escenario: El usuario crea cuenta con celular
    Dado que la vista actual esta en "waup_register"
    Cuando el usuario acciona el componente "waup-button-signup-phone"
    Y acepta el componente "waup-checkbox-terms-and-conditions"
    Entonces el componente "waup-screen-phone-signup" entra en estado "visible"
    Y el componente "waup-input-phone-number" pasa a estado "enabled"
    Y el componente "waup-button-request-verification-code" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-phone-signup"

  Escenario: El usuario crea cuenta con Google
    Dado que la vista actual esta en "waup_register"
    Cuando el usuario acciona el componente "waup-button-signup-google"
    Y acepta el componente "waup-checkbox-terms-and-conditions"
    Entonces el componente "waup-social-auth-status" pasa a estado "success"
    Y el componente "waup-account-status" pasa a estado "created"
    Y el componente "waup-auth-session-status" pasa a estado "active"
    Y el componente "waup-screen-role-selection" entra en estado "visible"
    Y el foco de accesibilidad se mueve al componente "waup-heading-role-selection"

  Escenario: El usuario verifica celular y llega a seleccion de rol
    Dado que la vista actual esta en "waup_phone_signup"
    Cuando el usuario completa la verificacion de celular
    Entonces el componente "waup-account-status" pasa a estado "created"
    Y el componente "waup-auth-session-status" pasa a estado "active"
    Y el componente "waup-screen-role-selection" entra en estado "visible"
    Y el foco de accesibilidad se mueve al componente "waup-heading-role-selection"

  Escenario: El usuario elige owner y es derivado a su onboarding
    Dado que la vista actual esta en "waup_role_selection"
    Cuando el usuario acciona el componente "waup-role-card-owner"
    Entonces el componente "waup-account-role" pasa a estado "waup_pet_owner"
    Y el componente "waup-screen-owner-onboarding-start" entra en estado "visible"
    Y el resultado de negocio es "cuenta creada con rol owner"
    Y el foco de accesibilidad se mueve al componente "waup-heading-owner-onboarding"

  Escenario: El usuario elige walker y es derivado a su onboarding
    Dado que la vista actual esta en "waup_role_selection"
    Cuando el usuario acciona el componente "waup-role-card-walker"
    Entonces el componente "waup-account-role" pasa a estado "waup_walker"
    Y el componente "waup-screen-walker-onboarding-start" entra en estado "visible"
    Y el resultado de negocio es "cuenta creada con rol walker"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-onboarding"
