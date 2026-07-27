# language: es

Característica: Solicitud de Paseo
  Como usuario owner de Waup
  Quiero completar el formulario y solicitar paseadores
  Para recibir una terna cerrada de candidatos disponibles

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_pet_owner"
    Y que la vista inicial es "waup_ride_request_idle"
    Y que el flujo operativo es "match_flow"
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"
    Y que no existe un estado critico activo

  Escenario: Envio exitoso de solicitud de paseo
    Cuando el usuario completa el formulario de solicitud
    Y acciona el componente "waup-button-request-walkers"
    Entonces el componente "waup-screen-ride-request" sale del estado "waup_ride_request_idle"
    Y el componente "waup-screen-offer-waiting" entra en estado "waup_waiting_for_offers"
    Y el componente "waup-form-ride-request" pasa a estado "disabled"
    Y el componente "waup-loading-offers" pasa a estado "active"
    Y el foco de accesibilidad se mueve al componente "waup-heading-waiting-for-offers"

  Escenario: Recepcion de la terna de candidatos
    Dado que la vista actual esta en estado "waup_waiting_for_offers"
    Cuando el sistema recibe exactamente 3 ofertas cerradas validas
    Entonces el componente "waup-screen-offer-waiting" sale del estado "waup_waiting_for_offers"
    Y el componente "waup-screen-candidate-selection" entra en estado "waup_candidate_selection"
    Y el componente "waup-candidate-list" muestra exactamente 3 items
    Y el componente "waup-candidate-list" pasa a estado "loaded"
    Y el componente "waup-anti-bypass-lock" pasa a estado "active"
    Y el foco de accesibilidad se mueve al componente "waup-heading-candidate-selection"
    Y el siguiente foco navegable es el componente "waup-candidate-card-1"

  Escenario: El owner selecciona un candidato para continuar al pago
    Dado que la vista actual esta en estado "waup_candidate_selection"
    Y que el componente "waup-candidate-list" muestra exactamente 3 items
    Cuando el owner acciona el componente "waup-candidate-card-1"
    Entonces el componente "waup-screen-candidate-selection" sale del estado "waup_candidate_selection"
    Y el componente "waup-screen-payment-processing" entra en estado "waup_payment_processing"
    Y el componente "waup-payment-summary" pasa a estado "visible"
    Y el componente "waup-service-fee-breakdown" pasa a estado "visible"
    Y el componente "waup-payment-method-selector" pasa a estado "enabled"
    Y el componente "waup-walker-contact-details" permanece en estado "hidden"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payment-processing"

  Escenario: El owner aprueba el pago del paseo
    Dado que la vista actual esta en estado "waup_payment_processing"
    Y que el componente "waup-payment-method-selector" esta en estado "enabled"
    Cuando el owner acciona el componente "waup-button-confirm-payment"
    Y la pasarela devuelve el evento "waup_payment_approved"
    Entonces el componente "waup-screen-payment-processing" sale del estado "waup_payment_processing"
    Y el componente "waup-screen-ride-confirmed" entra en estado "waup_ride_confirmed"
    Y el componente "waup-payment-status-badge" pasa a estado "success"
    Y el componente "waup-walker-contact-details" pasa a estado "visible"
    Y el componente "waup-ride-confirmation-summary" pasa a estado "visible"
    Y el foco de accesibilidad se mueve al componente "waup-heading-ride-confirmed"
