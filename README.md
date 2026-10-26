# Rol Operativo

Aplicación web estática para publicar con GitHub Pages.

## Funciones
- Personal y patrullas
- Nuevo rol
- Chofer, acompañante y apoyo
- Alimentación en orden: **Desayuno → Almuerzo → Café**
- Sector y labores
- Copiar último rol
- Historial
- Informe visual
- Imprimir / guardar como PDF

## Cédula del personal
Antes de usar el campo de cédula, ejecuta una vez en **Supabase → SQL Editor** el script `supabase/migrations/20261026_add_personal_cedula.sql`. Agrega `cedula` como texto opcional en `public.personal`, conserva los registros existentes y permite guardar ceros iniciales.

La cédula se administra desde la pestaña **Personal** y no se agrega a los informes ni al texto copiado para WhatsApp.

## Acciones RAP
Para usar la sección RAP, ejecuta una vez `supabase/migrations/20261026_create_rap_actions.sql` en **Supabase → SQL Editor**. Cada acción se guarda ligada al rol, a una patrulla, moto o pareja en recorrido y a uno o varios integrantes de esa unidad. La pestaña RAP muestra un reporte independiente y permite copiarlo a WhatsApp; el informe del rol también incluye sus acciones. Si ya ejecutaste una versión anterior del script, vuelve a ejecutarlo: agrega las columnas `unidad` y `personal_ids` de forma segura y conserva las acciones existentes.

## GitHub Pages
1. Crea un repositorio nuevo.
2. Sube `index.html` y `manifest.json`.
3. Ve a **Settings → Pages**.
4. En **Build and deployment**, selecciona **Deploy from a branch**.
5. Branch: `main`; carpeta: `/ (root)`.
6. Guarda y espera a que GitHub publique la página.

Los datos se guardan localmente en el navegador. Para la primera prueba usa datos ficticios.
