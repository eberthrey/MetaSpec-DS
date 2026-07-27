# language: es

Característica: Métodos de Pago
  Como owner de Waup
  Quiero gestionar mis métodos de pago
  Para poder realizar el pago de los paseos de forma rápida y segura

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_pet_owner"
    Y que la vista inicial es "waup_owner_home"
    Y que el owner ya completo onboarding
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El owner accede a métodos de pago desde el home
    Cuando el owner acciona el componente "waup-button-home-payment-methods"
    Entonces el componente "waup-screen-payment-methods-list" entra en estado "visible"
    Y el componente "waup-payment-methods-list" pasa a estado "visible"
    Y el componente "waup-button-add-payment-method" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payment-methods"

  Escenario: El owner visualiza el detalle de una tarjeta
    Dado que la vista actual esta en "waup_payment_methods_list"
    Cuando el owner acciona un item del componente "waup-payment-methods-list"
    Entonces el componente "waup-screen-payment-method-detail" entra en estado "visible"
    Y el componente "waup-card-brand-logo" pasa a estado "visible"
    Y el componente "waup-card-masked-number" pasa a estado "visible"
    Y el componente "waup-card-expiration-date" pasa a estado "visible"
    Y el componente "waup-card-holder-name" pasa a estado "visible"
    Y el componente "waup-button-remove-payment-method" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payment-method-detail"

  Escenario: El owner elimina un método de pago
    Dado que la vista actual esta en "waup_payment_method_detail"
    Cuando el owner acciona el componente "waup-button-remove-payment-method"
    Y confirma la eliminacion
    Entonces el componente "waup-payment-methods-list" pasa a estado "updated"
    Y el componente "waup-screen-payment-methods-list" entra en estado "visible"
    Y el resultado de negocio es "metodo de pago eliminado correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payment-methods"
