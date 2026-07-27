# language: es

Característica: Mis Mascotas
  Como owner de Waup
  Quiero gestionar las mascotas de mi perfil
  Para mantener su informacion actualizada y lista para los paseos

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_pet_owner"
    Y que la vista inicial es "waup_pet_profiles"
    Y que el owner ya completo onboarding
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El owner visualiza el listado de mascotas
    Cuando el owner entra a la vista de mascotas
    Entonces el componente "waup-screen-pet-profiles" entra en estado "visible"
    Y el componente "waup-pet-profile-list" pasa a estado "visible"
    Y el componente "waup-button-add-pet" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-pet-profiles"

  Escenario: El owner visualiza el detalle de una mascota
    Dado que la vista actual esta en "waup_pet_profiles"
    Cuando el owner acciona un item del componente "waup-pet-profile-list"
    Entonces el componente "waup-screen-pet-detail" entra en estado "visible"
    Y el componente "waup-pet-name" pasa a estado "visible"
    Y el componente "waup-pet-breed" pasa a estado "visible"
    Y el componente "waup-pet-photo" pasa a estado "visible"
    Y el componente "waup-pet-age" pasa a estado "visible"
    Y el componente "waup-pet-weight" pasa a estado "visible"
    Y el componente "waup-pet-sex" pasa a estado "visible"
    Y el componente "waup-pet-size" pasa a estado "visible"
    Y el componente "waup-pet-temperament" pasa a estado "visible"
    Y el componente "waup-pet-medical-notes" pasa a estado "visible"
    Y el componente "waup-pet-allergies-health" pasa a estado "visible"
    Y el componente "waup-pet-walk-observations" pasa a estado "visible"
    Y el resultado de negocio es "perfil de mascota gestionado correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-pet-detail"

  Escenario: El owner agrega una nueva mascota
    Dado que la vista actual esta en "waup_pet_profiles"
    Cuando el owner acciona el componente "waup-button-add-pet"
    Y completa nombre
    Y completa raza
    Y carga foto
    Y completa edad
    Y completa peso
    Y completa sexo
    Y completa tamano
    Y completa temperamento
    Y completa notas medicas
    Y agrega comentarios sobre alergias o problemas de salud
    Y completa observaciones para los paseos
    Y acciona el componente "waup-button-save-pet-profile"
    Entonces el componente "waup-pet-profile-list" pasa a estado "has_items"
    Y el componente "waup-screen-pet-create-success" entra en estado "visible"
    Y el resultado de negocio es "perfil de mascota gestionado correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-pet-create-success"

  Escenario: El owner edita una mascota existente
    Dado que la vista actual esta en "waup_pet_detail"
    Cuando el owner acciona el componente "waup-button-edit-pet"
    Y actualiza uno o mas campos del perfil de mascota
    Y acciona el componente "waup-button-save-pet-profile"
    Entonces el componente "waup-screen-pet-edit-success" entra en estado "visible"
    Y el componente "waup-pet-detail-summary" pasa a estado "updated"
    Y el resultado de negocio es "perfil de mascota gestionado correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-pet-edit-success"

  Escenario: El owner elimina una mascota
    Dado que la vista actual esta en "waup_pet_detail"
    Cuando el owner acciona el componente "waup-button-delete-pet"
    Y confirma la eliminacion
    Entonces el componente "waup-pet-profile-list" pasa a estado "updated"
    Y el componente "waup-screen-pet-delete-success" entra en estado "visible"
    Y el resultado de negocio es "perfil de mascota gestionado correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-pet-delete-success"
