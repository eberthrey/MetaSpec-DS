# Design System

- [Foundations](foundations/) - Fundaciones activas del bundle actual: color, spacing, radius, typography, iconography y layout.
- [Tokens](tokens/) - Tokens primitivos y semánticos normalizados bajo el schema vigente y consumidos por `@patapet/ui`.
- [Components](components/) - Contratos semánticos de componentes reutilizables, separados entre implementados desde Figma y pendientes.
- [Assets](assets/) - Iconos, avatares e ilustraciones de soporte para la experiencia.

## Current Coverage

- Componentes implementados y exportados hoy en `packages/patapet-ui`: `Avatar`, `Badge`, `ButtonIcon`, `Carousel`, `Checkbox`, `Chip`, `Header`, `Input`, `InputSearch`, `Map`, `PhotoUploader`, `ServiceTypeSwitch`, `StepIndicator`, `WalkCard`.
- Foundations exportadas hoy en `packages/patapet-ui`: `typography`, `iconography`, `layout` y contratos tipados de tokens.
- Contrato de trazabilidad Figma → React vigente:
  - `behavior/contracts/figma-to-react-map.yaml`
