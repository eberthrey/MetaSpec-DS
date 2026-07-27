# language: es

Característica: Mi Perfil
  Como usuario de Waup (owner o walker)
  Quiero acceder a la pantalla de edición de mi perfil
  Para mantener mis datos de perfil actualizados

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El owner accede a editar su perfil desde el home
    Dado que el rol activo es "waup_pet_owner"
    Y que la vista inicial es "waup_owner_home"
    Cuando el owner acciona el componente "waup-button-profile-avatar" en la parte superior
    Entonces el componente "waup-screen-profile-edit" entra en estado "visible"
    Y el componente "waup-input-profile-name" pasa a estado "visible"
    Y el componente "waup-input-profile-email" pasa a estado "visible"
    Y el componente "waup-input-profile-phone" pasa a estado "visible"
    Y el componente "waup-button-save-profile" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-profile-edit"

  Escenario: El owner actualiza sus datos de perfil
    Dado que el rol activo es "waup_pet_owner"
    Y que la vista actual esta en "waup_profile_edit"
    Cuando el owner edita el componente "waup-input-profile-name" con un nuevo valor
    Y acciona el componente "waup-button-save-profile"
    Entonces el componente "waup-screen-profile-edit" sale del estado "waup_profile_edit"
    Y el componente "waup-screen-profile-success" entra en estado "visible"
    Y el resultado de negocio es "datos de perfil actualizados correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-profile-success"

  Escenario: El walker accede a editar su perfil desde el home
    Dado que el rol activo es "waup_walker"
    Y que la vista inicial es "waup_walker_home"
    Cuando el walker acciona el componente "waup-button-profile-avatar" en la parte superior
    Entonces el componente "waup-screen-profile-edit" entra en estado "visible"
    Y el componente "waup-input-profile-name" pasa a estado "visible"
    Y el componente "waup-input-profile-email" pasa a estado "visible"
    Y el componente "waup-input-profile-phone" pasa a estado "visible"
    Y el componente "waup-button-save-profile" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-profile-edit"

  Escenario: El walker actualiza sus datos de perfil
    Dado que el rol activo es "waup_walker"
    Y que la vista actual esta en "waup_profile_edit"
    Cuando el walker edita el componente "waup-input-profile-name" con un nuevo valor
    Y acciona el componente "waup-button-save-profile"
    Entonces el componente "waup-screen-profile-edit" sale del estado "waup_profile_edit"
    Y el componente "waup-screen-profile-success" entra en estado "visible"
    Y el resultado de negocio es "datos de perfil actualizados correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-profile-success"
