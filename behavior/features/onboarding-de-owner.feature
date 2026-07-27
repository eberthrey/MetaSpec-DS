# language: es

Característica: Onboarding de Owner
  Como usuario owner de Waup ya autenticado
  Quiero completar mi perfil y registrar mi primera mascota
  Para tener mi perfil creado y poder operar dentro de la app

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_pet_owner"
    Y que el usuario ya esta logueado
    Y que el usuario ya esta registrado
    Y que la vista inicial es "waup_owner_onboarding_start"
    Y que el owner aun no tiene perfil completo
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El owner inicia el onboarding
    Cuando el owner entra por primera vez a la configuracion de su perfil
    Entonces el componente "waup-screen-owner-onboarding-start" entra en estado "visible"
    Y el componente "waup-button-start-owner-profile" pasa a estado "enabled"
    Y el componente "waup-owner-onboarding-progress" pasa a estado "visible"
    Y el foco de accesibilidad se mueve al componente "waup-heading-owner-onboarding"

  Escenario: El owner completa su informacion de perfil
    Dado que la vista actual esta en "waup_owner_onboarding_start"
    Cuando el owner acciona el componente "waup-button-start-owner-profile"
    Entonces el componente "waup-screen-owner-onboarding-form" entra en estado "visible"
    Y el componente "waup-input-owner-first-name" pasa a estado "enabled"
    Y el componente "waup-input-owner-last-name" pasa a estado "enabled"
    Y el componente "waup-select-identity-document-type" pasa a estado "enabled"
    Y el componente "waup-input-identity-document-number" pasa a estado "enabled"
    Y el componente "waup-input-current-address" pasa a estado "enabled"
    Y el componente "waup-owner-preferences-form" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-owner-profile-form"

  Escenario: El owner cierra onboarding al culminar la creacion de su primera mascota
    Dado que la vista actual esta en "waup_owner_onboarding_form"
    Cuando el owner completa nombres completos
    Y completa apellidos completos
    Y selecciona tipo de documento de identidad
    Y completa numero de documento de identidad
    Y completa direccion actual
    Y completa preferencias
    Y acciona el componente "waup-button-submit-owner-onboarding"
    Entonces el componente "waup-screen-first-pet-creation" entra en estado "visible"
    Y el componente "waup-owner-profile-status" pasa a estado "pending_first_pet"
    Y el foco de accesibilidad se mueve al componente "waup-heading-first-pet-creation"
    Cuando el owner crea su primera mascota
    Entonces el componente "waup-owner-profile-status" pasa a estado "created"
    Y el componente "waup-pet-profile-list" pasa a estado "has_items"
    Y el componente "waup-screen-owner-onboarding-success" entra en estado "visible"
    Y el componente "waup-owner-home-entrypoint" pasa a estado "enabled"
    Y el resultado de negocio es "perfil owner creado"
    Y el foco de accesibilidad se mueve al componente "waup-heading-owner-onboarding-success"
