# language: es

Característica: Métodos de Cobro
  Como walker de Waup
  Quiero gestionar mis métodos de cobro
  Para poder recibir los ingresos generados por los paseos completados

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_walker"
    Y que la vista inicial es "waup_walker_home"
    Y que el walker ya completo onboarding
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El walker accede a métodos de cobro desde el home
    Cuando el walker acciona el componente "waup-button-home-payout-methods"
    Entonces el componente "waup-screen-payout-methods-list" entra en estado "visible"
    Y el componente "waup-payout-methods-list" pasa a estado "visible"
    Y el componente "waup-button-add-payout-method" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payout-methods"

  Escenario: El walker visualiza el detalle de una cuenta de cobro
    Dado que la vista actual esta en "waup_payout_methods_list"
    Cuando el walker acciona un item del componente "waup-payout-methods-list"
    Entonces el componente "waup-screen-payout-method-detail" entra en estado "visible"
    Y el componente "waup-payout-bank-name" pasa a estado "visible"
    Y el componente "waup-payout-account-number" pasa a estado "visible"
    Y el componente "waup-payout-holder-document" pasa a estado "visible"
    Y el componente "waup-payout-holder-name" pasa a estado "visible"
    Y el componente "waup-button-remove-payout-method" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payout-method-detail"

  Escenario: El walker elimina un método de cobro
    Dado que la vista actual esta en "waup_payout_method_detail"
    Cuando el walker acciona el componente "waup-button-remove-payout-method"
    Y confirma la eliminacion
    Entonces el componente "waup-payout-methods-list" pasa a estado "updated"
    Y el componente "waup-screen-payout-methods-list" entra en estado "visible"
    Y el resultado de negocio es "metodo de cobro eliminado correctamente"
    Y el foco de accesibilidad se mueve al componente "waup-heading-payout-methods"
