# language: es

Característica: Onboarding de Walker
  Como usuario walker de Waup ya autenticado
  Quiero completar mi perfil operativo
  Para tener mi perfil walker creado

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_walker"
    Y que el usuario ya esta logueado
    Y que el usuario ya esta registrado
    Y que la vista inicial es "waup_walker_onboarding_start"
    Y que el perfil walker aun no esta completo
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El walker entra al onboarding operativo
    Cuando el walker entra por primera vez a la configuracion de su perfil
    Entonces el componente "waup-screen-walker-onboarding-start" entra en estado "visible"
    Y el componente "waup-button-start-walker-profile" pasa a estado "enabled"
    Y el componente "waup-walker-onboarding-progress" pasa a estado "visible"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-onboarding"

  Escenario: El walker completa su informacion personal
    Dado que la vista actual esta en "waup_walker_onboarding_start"
    Cuando el walker acciona el componente "waup-button-start-walker-profile"
    Entonces el componente "waup-screen-walker-profile-form" entra en estado "visible"
    Y el componente "waup-input-walker-first-name" pasa a estado "enabled"
    Y el componente "waup-input-walker-last-name" pasa a estado "enabled"
    Y el componente "waup-select-walker-identity-document-type" pasa a estado "enabled"
    Y el componente "waup-input-walker-identity-document-number" pasa a estado "enabled"
    Y el componente "waup-input-walker-phone" pasa a estado "enabled"
    Y el componente "waup-input-walker-current-address" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-profile-form"

  Escenario: El walker configura disponibilidad y precios
    Dado que la vista actual esta en "waup_walker_profile_form"
    Cuando el walker completa su informacion personal
    Y acciona el componente "waup-button-continue-to-walker-operations"
    Entonces el componente "waup-screen-walker-operations-form" entra en estado "visible"
    Y el componente "waup-walker-availability-calendar" pasa a estado "enabled"
    Y el componente "waup-walker-district-selector" pasa a estado "enabled"
    Y el componente "waup-walker-pricing-editor" pasa a estado "enabled"
    Y el componente "waup-button-submit-walker-profile" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-operations-form"

  Escenario: El walker inicia el paso 2 de identificacion (DNI anverso)
    Dado que la vista actual esta en "waup_walker_operations_form"
    Cuando el walker define al menos una disponibilidad
    Y selecciona exactamente 3 distritos en el componente "waup-walker-district-selector"
    Y define su precio de paseo
    Y acciona el componente "waup-button-submit-walker-profile"
    Entonces el componente "waup-screen-walker-onboarding-dni-front" entra en estado "visible"
    Y el componente "waup-photo-uploader-dni-front" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-dni-front"

  Escenario: El walker toma foto del reverso del DNI
    Dado que la vista actual esta en "waup_walker_onboarding_dni_front"
    Cuando el walker sube la foto del anverso del DNI
    Y acciona el componente "waup-button-continue-to-dni-back"
    Entonces el componente "waup-screen-walker-onboarding-dni-back" entra en estado "visible"
    Y el componente "waup-photo-uploader-dni-back" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-dni-back"

  Escenario: El walker pasa al reconocimiento facial
    Dado que la vista actual esta en "waup_walker_onboarding_dni_back"
    Cuando el walker sube la foto del reverso del DNI
    Y acciona el componente "waup-button-continue-to-facial"
    Entonces el componente "waup-screen-walker-onboarding-facial" entra en estado "visible"
    Y el componente "waup-facial-recognition-camera" pasa a estado "active"
    Y el foco de accesibilidad se mueve al componente "waup-heading-facial"

  Escenario: El walker completa el reconocimiento facial y finaliza su onboarding
    Dado que la vista actual esta en "waup_walker_onboarding_facial"
    Cuando la camara detecta el rostro del walker con exito
    Y el walker acciona el componente "waup-button-complete-onboarding"
    Entonces el componente "waup-walker-profile-status" pasa a estado "created"
    Y el componente "waup-screen-walker-onboarding-success" entra en estado "visible"
    Y el componente "waup-walker-home-entrypoint" pasa a estado "enabled"
    Y el resultado de negocio es "perfil walker creado con verificacion de identidad completa"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-onboarding-success"
