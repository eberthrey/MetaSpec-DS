# language: es

Característica: Créditos y Retiros de Dinero
  Como walker de Waup
  Quiero ver mi saldo de créditos acumulados y poder retirar mi dinero
  Para transferir mis ganancias a mi cuenta bancaria o método de cobro

  Antecedentes:
    Dado que el namespace activo es "waup"
    Y que el rol activo es "waup_walker"
    Y que la vista inicial es "waup_walker_home"
    Y que el walker ya completo onboarding
    Y que la densidad activa es "comfortable"
    Y que el modo de color puede ser "light" o "dark"

  Escenario: El walker accede a la sección de créditos desde el home
    Cuando el walker acciona el componente "waup-button-home-credits"
    Entonces el componente "waup-screen-walker-credits" entra en estado "visible"
    Y el componente "waup-credits-balance-display" pasa a estado "visible"
    Y el componente "waup-button-initiate-withdrawal" pasa a estado "enabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-credits"

  Escenario: El walker inicia el proceso de retiro de dinero
    Dado que la vista actual esta en "waup_walker_credits"
    Y que el saldo en el componente "waup-credits-balance-display" es mayor a cero
    Cuando el walker acciona el componente "waup-button-initiate-withdrawal"
    Entonces el componente "waup-screen-walker-withdrawal-request" entra en estado "visible"
    Y el componente "waup-input-withdrawal-amount" pasa a estado "enabled"
    Y el componente "waup-select-withdrawal-payout-method" pasa a estado "enabled"
    Y el componente "waup-button-confirm-withdrawal" pasa a estado "disabled"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-withdrawal-request"

  Escenario: El walker completa los datos de retiro y confirma la solicitud exitosamente
    Dado que la vista actual esta en "waup_walker_withdrawal_request"
    Cuando el walker ingresa un monto válido menor o igual al saldo en el componente "waup-input-withdrawal-amount"
    Y selecciona un método de cobro en el componente "waup-select-withdrawal-payout-method"
    Entonces el componente "waup-button-confirm-withdrawal" pasa a estado "enabled"
    Cuando el walker acciona el componente "waup-button-confirm-withdrawal"
    Entonces el componente "waup-screen-walker-credits" entra en estado "visible"
    Y el componente "waup-credits-balance-display" pasa a estado "updated"
    Y el resultado de negocio es "retiro solicitado y saldo debitado"
    Y el foco de accesibilidad se mueve al componente "waup-heading-walker-credits"

  Escenario: El walker intenta retirar un monto mayor al saldo disponible
    Dado que la vista actual esta en "waup_walker_withdrawal_request"
    Cuando el walker ingresa un monto mayor al saldo en el componente "waup-input-withdrawal-amount"
    Entonces el componente "waup-withdrawal-error-message" pasa a estado "visible"
    Y el componente "waup-button-confirm-withdrawal" pasa a estado "disabled"
    Y el resultado de negocio es "error por saldo insuficiente"
