# Gobernanza y Reglas de Ejecución para Agentes de IA (`agent.md`)

Este archivo contiene las directivas fundamentales de gobernanza, topología de archivos y reglas lógicas que regulan el comportamiento de cualquier agente de inteligencia artificial (LLM) que opere dentro de este repositorio en el IDE. Su observancia es de carácter imperativo y obligatorio.

---

## 1. Mapeo Real del Ecosistema `specs/`

Cualquier cambio lógico, de UI o comportamiento propuesto por la IA debe estar gobernado y justificado por las especificaciones de `/specs`. La estructura de archivos del proyecto se organiza bajo la siguiente jerarquía de abstracción:

* **Nivel 1: Intención Semántica**
  * **Ruta**: `metaspec/semantic-intent/semantic-intent.yaml`
  * **Verdad**: Propósito de negocio de la plataforma, glosario, taxonomía de roles (`waup_pet_owner`, `waup_walker`) y entidades estratégicas (`owner`, `walker`, `pet`, `walk`).
* **Nivel 2: Reglas de Negocio y Flujo BDD**
  * **Ruta**: `behavior/business-rules/business-rules.yaml`
  * **Rutas**: `behavior/features/*.feature`
  * **Verdad**: Reglas operacionales, estados lógicos de vistas (`view_states`), permisos por rol (`roles`), prioridades, y los flujos ejecutables en Gherkin.
* **Nivel 3: Foundations, Tokens y Componentes del Design System**
  * **Rutas**: `specs/design-system/tokens/base.yaml` y `semantic.yaml`
  * **Ruta**: `specs/design-system/foundations/*.yaml` (color, spacing, typography, radius)
  * **Rutas**: `specs/design-system/components/*.yaml` (ej. `button.yaml`, `input.yaml`, `photo_uploader.yaml`, `switch.yaml`)
  * **Verdad**: Valores de diseño atómicos y contratos de propiedades visuales de componentes de interfaz.
* **Nivel 4: Patrones Reutilizables (Patterns)**
  * **Rutas**: `specs/composition/patterns/*.yaml`
  * **Verdad**: Composiciones compuestas de UI formadas por componentes atómicos y estructuras de slots.
* **Nivel 5: Composición de Pantallas (Screens)**
  * **Rutas**: `specs/composition/screens/*.yaml`
  * **Verdad**: Ensamblaje final de las vistas asignando patrones/componentes a slots y relacionándolas con los estados lógicos (`view_states`).
* **Entornos de Sandbox / Prototipos locales de pruebas**:
  * **Ruta**: `home_mobile.html` (Prototipo React/Tamagui interactivo)
  * **Ruta**: `spec-studio/` (Aplicación visualizadora de especificaciones)

---

## 2. Algoritmo de Ejecución Imperativo (The 3-Step Law)

Antes de escribir, modificar o proponer código al desarrollador, la IA del IDE debe aplicar obligatoriamente el siguiente pipeline de fondo:

### Paso 1: Extracción de Restricciones del Modelo
La IA debe analizar el árbol de especificaciones `/specs` para el componente o pantalla afectada:
* **Prohibición de Valores Hardcoded**: Está estrictamente prohibido usar valores estáticos para colores, espaciados (márgenes, paddings), tipografías o bordes en el código final. Todos estos valores deben referenciar a las variables/clases asignadas en los tokens semánticos (`tokens/semantic.yaml`) o foundations.
* **Regla de Alturas de Entrada/Botones**: En todas las implementaciones de UI de Waup, se deben respetar únicamente alturas de `40px` o `48px` para inputs y botones, de acuerdo a las foundations de tamaño vigentes.

### Paso 2: Validación Semántica y Generación Segura
* Ejecutar la validación semántica interna del proyecto para asegurar que el registro de especificaciones compile de forma limpia antes de declarar la tarea por finalizada.

---

## 3. Candados de Negocio y Guardrails Críticos

La IA tiene prohibido romper las restricciones lógicas y de privacidad del negocio. Ante cualquier instrucción que atente contra estos contratos, la IA debe interrumpir su ejecución inmediatamente.

