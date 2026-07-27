# Flujo de importación de tokens

## Objetivo
Convertir una entrada JSON de tokens libre en la estructura canónica de tokens del repositorio.

## Leer primero
- /AGENTS.md
- /metaspec/token/token-taxonomy.yaml
- /metaspec/token/token-schema.yaml
- /metaspec/token/token-classification-rules.yaml

## Entrada
Un payload JSON de tokens libre proporcionado por el usuario.

## Comportamiento requerido
1. Inspeccionar el JSON de entrada.
2. Detectar si la entrada es:
   - DTCG/W3C-like
   - parcialmente estructurada
   - libre
3. Normalizar todos los tokens al schema canónico de tokens.
4. Clasificar todos los tokens en canonical layers:
   - base
   - semantic
   - component
5. Validar:
   - required fields
   - validez de canonical layer
   - references válidas
   - component scope cuando sea requerido
   - consistencia de naming
6. Persistir los tokens normalizados en:
   - /tokens/base
   - /tokens/semantic
   - /tokens/component
7. Si un token no puede clasificarse con confianza:
   - no inventar certeza
   - colocarlo en una salida de review
   - explicar la ambigüedad

## Auditoría de tokens

Cuando la tarea sea revisar o auditar tokens sin persistir cambios:
1. Lee este workflow y los archivos canónicos de `/metaspec/token/`.
2. Inspecciona el input JSON o los archivos del repo.
3. Evalúa clasificación, naming, referencias y layer assignment.
4. No persistas cambios salvo pedido explícito de la persona usuaria.
5. Si detectas ambigüedad, repórtala en la salida de review en lugar de inventar certeza.

## Reglas canónicas
- base es la única layer requerida
- semantic es opcional
- component es opcional
- semantic debería referenciar base
- component debería referenciar semantic por defecto
- component puede referenciar base solo con justificación explícita
- los semantic tokens no deberían incluir nombres de componente
- los component tokens deben incluir component scope
- usar `disabled`, no `disable`

## Salida
Producir:
1. Un resumen corto de importación:
   - total de tokens procesados
   - cantidad clasificada como base
   - cantidad clasificada como semantic
   - cantidad clasificada como component
   - cantidad enviada a review
2. Archivos de tokens actualizados en el repo
3. Un archivo de review para tokens ambiguos si hace falta

## Ubicación de la salida de review
- /reports/token-import/latest-review.json

## Notas
- No persistir la entrada cruda como verdad canónica.
- Normalizar antes de escribir.
- Preservar provenance y normalization metadata.
- Preferir cambios estructurales mínimos antes que renombres innecesarios.
