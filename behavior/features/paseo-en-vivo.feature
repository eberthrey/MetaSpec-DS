# language: es

Característica: Paseo en Vivo
  Como walker activo de Waup
  Quiero confirmar llegada, iniciar el paseo y cerrarlo correctamente
  Para ejecutar el servicio con seguimiento claro, evidencia operativa y notificaciones al owner

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_walker"
    Y que la vista inicial es "waup_arrival_and_pickup"
    Y que el flujo operativo es "live_ride_flow"
    Y que el pago ya fue confirmado en backend
    Y que el trayecto ya fue activado para el walker asignado
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El walker confirma llegada a la ubicacion
    Cuando el walker acciona el componente "waup-button-arrived-at-location"
    Entonces el componente "waup-screen-arrival-and-pickup" permanece en estado "waup_arrival_and_pickup"
    Y el componente "waup-pickup-details-panel" pasa a estado "expanded"
    Y el componente "waup-pickup-owner-notes" pasa a estado "visible"
    Y el componente "waup-primary-cta-start-walk" pasa a estado "enabled"
    Y el sistema envia una notificacion al owner con el evento "waup_walker_arrived_at_location"
    Y el foco de accesibilidad se mueve al componente "waup-heading-pickup-details"

  Escenario: El walker inicia el paseo despues de revisar instrucciones
    Dado que el componente "waup-pickup-details-panel" esta en estado "expanded"
    Y que el walker ya reviso las observaciones del owner
    Cuando el walker acciona el componente "waup-primary-cta-start-walk"
    Entonces el componente "waup-screen-arrival-and-pickup" sale del estado "waup_arrival_and_pickup"
    Y el componente "waup-screen-live-ride" entra en estado "waup_ride_active_gps"
    Y el componente "waup-live-gps-map" pasa a estado "active"
    Y el componente "waup-walk-evidence-uploader" pasa a estado "enabled"
    Y el componente "waup-owner-walk-notes" pasa a estado "visible"
    Y el componente "waup-dog-context-panel" pasa a estado "visible"
    Y el componente "waup-walk-timer" pasa a estado "running"
    Y el sistema envia una notificacion al owner con el evento "waup_walk_started"
    Y el foco de accesibilidad se mueve al componente "waup-heading-live-ride"

  Escenario: El walker finaliza el paseo activo
    Dado que la vista actual esta en estado "waup_ride_active_gps"
    Y que el componente "waup-walk-timer" esta en estado "running"
    Y que el componente "waup-post-walk-evidence-uploader" acepta "photo" o "video"
    Cuando el walker acciona el componente "waup-button-finish-walk"
    Y carga al menos una evidencia valida
    Y acciona el componente "waup-button-confirm-finish-walk"
    Entonces el componente "waup-post-walk-evidence-uploader" pasa a estado "submitted"
    Y el componente "waup-button-confirm-finish-walk" pasa a estado "enabled"
    Y el componente "waup-screen-live-ride" sale del estado "waup_ride_active_gps"
    Y el componente "waup-screen-ride-completed" entra en estado "waup_ride_completed"
    Y el componente "waup-live-gps-map" pasa a estado "read_only"
    Y el componente "waup-walk-timer" pasa a estado "stopped"
    Y el componente "waup-dog-rating-controls" pasa a estado "visible"
    Y el componente "waup-walk-summary" pasa a estado "visible"
    Y el sistema envia una notificacion al owner con el evento "waup_walk_finished"
    Y el foco de accesibilidad se mueve al componente "waup-heading-ride-completed"

  Escenario: El owner recibe el cierre del paseo y califica al walker
    Dado que el evento "waup_walk_finished" ya fue enviado al owner
    Y que existe evidencia de cierre ya enviada por el walker
    Cuando el owner abre la aplicacion o enfoca la sesion activa del paseo
    Entonces el componente "waup-walk-finished-rating-modal" pasa a estado "visible"
    Y el componente "waup-walk-summary" pasa a estado "visible"
    Y el componente "waup-post-walk-evidence-gallery" pasa a estado "visible"
    Y el componente "waup-walker-rating-controls" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-rate-walker"
