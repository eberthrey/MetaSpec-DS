# language: es

Característica: Historial de Paseos
  Como usuario de Waup
  Quiero consultar el historial de paseos realizados
  Para revisar informacion operativa, evidencia y resultados de servicios anteriores

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que existe al menos un paseo finalizado
    Y que la vista inicial es "waup_ride_history_list"
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El owner visualiza la lista de historial de paseos
    Dado que el rol activo es "waup_pet_owner"
    Cuando el owner entra a la vista de historial
    Entonces el componente "waup-screen-ride-history-list" entra en estado "visible"
    Y el componente "waup-ride-history-filters" pasa a estado "enabled"
    Y cada item del componente "waup-ride-history-list" muestra fecha
    Y cada item del componente "waup-ride-history-list" muestra nombre de la mascota
    Y cada item del componente "waup-ride-history-list" muestra walker
    Y cada item del componente "waup-ride-history-list" muestra estado
    Y cada item del componente "waup-ride-history-list" muestra duracion del paseo
    Y cada item del componente "waup-ride-history-list" muestra precio
    Y el foco de accesibilidad se mueve al componente "waup-heading-ride-history"

  Escenario: El walker visualiza la lista de historial de paseos
    Dado que el rol activo es "waup_walker"
    Cuando el walker entra a la vista de historial
    Entonces el componente "waup-screen-ride-history-list" entra en estado "visible"
    Y el componente "waup-ride-history-filters" pasa a estado "enabled"
    Y cada item del componente "waup-ride-history-list" muestra fecha
    Y cada item del componente "waup-ride-history-list" muestra nombre de la mascota
    Y cada item del componente "waup-ride-history-list" muestra owner
    Y cada item del componente "waup-ride-history-list" muestra estado
    Y cada item del componente "waup-ride-history-list" muestra duracion del paseo
    Y cada item del componente "waup-ride-history-list" muestra precio
    Y el foco de accesibilidad se mueve al componente "waup-heading-ride-history"

  Escenario: El usuario filtra el historial de paseos
    Dado que la vista actual esta en "waup_ride_history_list"
    Cuando el usuario acciona el componente "waup-filter-date"
    Y acciona el componente "waup-filter-status"
    Y acciona el componente "waup-filter-pet"
    Entonces el componente "waup-ride-history-list" pasa a estado "filtered"
    Y el componente "waup-active-filter-chips" pasa a estado "visible"
    Y el foco de accesibilidad se mueve al componente "waup-ride-history-results"

  Escenario: El owner visualiza el detalle de un paseo finalizado
    Dado que el rol activo es "waup_pet_owner"
    Y que la vista actual esta en "waup_ride_history_list"
    Cuando el owner acciona un item del componente "waup-ride-history-list"
    Entonces el componente "waup-screen-ride-history-detail" entra en estado "visible"
    Y el componente "waup-ride-route-map" pasa a estado "visible"
    Y el componente "waup-walker-rating-summary" pasa a estado "visible"
    Y el componente "waup-post-walk-evidence-gallery" pasa a estado "visible"
    Y el componente "waup-ride-summary" pasa a estado "visible"
    Y el componente "waup-walker-detail-card" pasa a estado "visible"
    Y el componente "waup-incident-log" pasa a estado "visible_if_exists"
    Y el foco de accesibilidad se mueve al componente "waup-heading-ride-history-detail"

  Escenario: El walker visualiza el detalle de un paseo finalizado
    Dado que el rol activo es "waup_walker"
    Y que la vista actual esta en "waup_ride_history_list"
    Cuando el walker acciona un item del componente "waup-ride-history-list"
    Entonces el componente "waup-screen-ride-history-detail" entra en estado "visible"
    Y el componente "waup-ride-route-map" pasa a estado "visible"
    Y el componente "waup-post-walk-evidence-gallery" pasa a estado "visible"
    Y el componente "waup-ride-summary" pasa a estado "visible"
    Y el componente "waup-dog-rating-summary" pasa a estado "visible"
    Y el componente "waup-owner-notes-history" pasa a estado "visible"
    Y el componente "waup-dog-detail-card" pasa a estado "visible"
    Y el componente "waup-incident-log" pasa a estado "visible_if_exists"
    Y el foco de accesibilidad se mueve al componente "waup-heading-ride-history-detail"
