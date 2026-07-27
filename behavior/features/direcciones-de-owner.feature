# language: es

Característica: Direcciones de Owner
  Como owner de Waup
  Quiero gestionar mis direcciones guardadas y agregar nuevas ubicaciones detalladas
  Para que los paseadores sepan exactamente dónde recoger a mi mascota de forma segura

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_pet_owner"
    Y que la vista inicial es "waup_owner_home"
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El owner accede al listado de direcciones desde su perfil o configuración de paseo
    Cuando el owner acciona el componente "waup-button-profile-addresses"
    Entonces el componente "waup-screen-addresses-list" entra en estado "visible"
    Y el componente "waup-addresses-saved-list" pasa a estado "visible"
    Y el componente "waup-button-add-address" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-addresses"

  Escenario: El owner selecciona una dirección guardada existente para su uso
    Dado que la vista actual esta en "waup_owner_addresses_list"
    Cuando el owner acciona un item del componente "waup-addresses-saved-list"
    Entonces el componente de la dirección seleccionada pasa a estado "active"
    Y el resultado de negocio es "direccion de entrega seleccionada correctamente"

  Escenario: El owner inicia la adición de una dirección y visualiza el buscador
    Dado que la vista actual esta en "waup_owner_addresses_list"
    Cuando el owner acciona el componente "waup-button-add-address"
    Entonces el componente "waup-screen-address-search" entra en estado "visible"
    Y el componente "waup-input-address-search" pasa a estado "focused"
    Y el componente "waup-item-select-on-map" pasa a estado "visible"

  Escenario: El owner escribe en el buscador predictivo y se muestran resultados
    Dado que la vista actual esta en "waup_owner_address_search"
    Cuando el owner escribe "Avenida Larco" en el componente "waup-input-address-search"
    Entonces el componente "waup-address-search-results" entra en estado "visible"
    Y muestra sugerencias de direcciones que coinciden con "Avenida Larco"
    Y el componente "waup-item-select-on-map" se despliega como última opción de la lista

  Escenario: El owner selecciona una ubicación y se abre el modal de tipo de propiedad
    Dado que la vista actual esta en "waup_owner_address_search"
    Cuando el owner selecciona una sugerencia del componente "waup-address-search-results"
    Entonces el componente "waup-modal-address-type" entra en estado "visible"
    Y el componente "waup-text-modal-title" muestra "Tipo de dirección"
    Y el componente "waup-text-modal-description" muestra "Indica al paseador el tipo de dirección donde debe recoger a tu mascota."
    Y los componentes de opción "Departamento", "Condominio", "Casa" y "Otro" pasan a estado "enabled"

  Escenario: El owner selecciona el tipo de propiedad y entra al formulario de detalle
    Dado que la vista actual esta en "waup_owner_address_type_modal"
    Cuando el owner selecciona la opción de tipo "Departamento"
    Entonces el componente "waup-screen-address-details-form" entra en estado "visible"
    Y el componente "waup-map-pickup-adjust" pasa a estado "visible"
    Y el componente "waup-text-selected-address" muestra la dirección seleccionada
    Y el componente "waup-button-change-address" pasa a estado "enabled"
    Y el formulario muestra la opción "Departamento" como tipo seleccionado
    Y los componentes "waup-input-type-name", "waup-input-additional-details", "waup-input-address-label" y "waup-textarea-pickup-instructions" pasan a estado "enabled"
    Y el componente "waup-button-save-address" se muestra fijado al pie de la pantalla en estado "disabled"

  Escenario: El owner edita/cambia la dirección desde el formulario de detalle
    Dado que la vista actual esta en "waup_owner_address_details_form"
    Cuando el owner acciona el componente "waup-button-change-address"
    Entonces el componente "waup-screen-address-search" entra en estado "visible"
    Y se limpia el valor de "waup-input-address-search"

  Escenario: El owner completa la información de dirección detallada y la guarda
    Dado que la vista actual esta en "waup_owner_address_details_form"
    Cuando el owner escribe "Torre B, Dpto 502" en el componente "waup-input-type-name"
    Y escribe "Ingreso por portería principal" en el componente "waup-input-additional-details"
    Y escribe "Trabajo" en el componente "waup-input-address-label"
    Y escribe "Dejar al perro con el conserje Carlos" en el componente "waup-textarea-pickup-instructions"
    Entonces el componente "waup-button-save-address" pasa a estado "enabled"
    Cuando el owner acciona el componente "waup-button-save-address"
    Entonces el componente "waup-screen-addresses-list" entra en estado "visible"
    Y la nueva dirección se añade al componente "waup-addresses-saved-list"
    Y el resultado de negocio es "direccion agregada correctamente"
