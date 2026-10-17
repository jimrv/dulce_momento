# Dulce Momento 🍰
### Pastelería artesanal · Catálogo digital y pedidos por WhatsApp

Dulce Momento es una tienda web de pastelería artesanal desarrollada con **React y Vite**. Su diseño utiliza una paleta cálida, fotografías de productos, tipografía editorial y mensajes orientados a comunicar una marca cercana, artesanal y enfocada en los momentos especiales.

El proyecto reúne una experiencia de catálogo y carrito con una base inicial para incorporar autenticación, administración de pedidos, CRM y email marketing.

> **Estado del proyecto:** versión inicial funcional para desarrollo y demostración. Las integraciones externas y algunos procesos de administración necesitan configuración de backend antes de usarse en producción.

---

## Contenido

- [Características](#-características)
- [Tecnologías](#-tecnologías)
- [Estructura del proyecto](#-estructura-del-proyecto)
- [Requisitos](#-requisitos)
- [Instalación y ejecución](#-instalación-y-ejecución-local)
- [Variables de entorno](#-variables-de-entorno)
- [Configuración de Supabase](#-configuración-de-supabase)
- [Pedidos por WhatsApp](#-flujo-de-pedido-por-whatsapp)
- [HubSpot CRM](#-hubspot-crm)
- [Email marketing](#-email-marketing)
- [Publicación](#-publicación)
- [Seguridad y pendientes para producción](#-seguridad-y-pendientes-para-producción)

## ✨ Características

### Experiencia de compra
- Página de inicio con propuesta de valor y llamada a la acción.
- Catálogo de productos con nombre, categoría, precio, etiqueta e imagen.
- Búsqueda de productos por nombre o categoría.
- Carrito con aumento y reducción de cantidades, eliminación de unidades y cálculo del subtotal.
- Mensaje de compra con el detalle de productos, cantidades, importe y datos del cliente.
- Continuación de la compra por WhatsApp.
- Diseño adaptable a escritorio, tablet y móvil.

### Identidad y contenido de marca
El contenido comunica conceptos clave para el negocio:

- **Pastelería artesanal**
- **Tortas personalizadas**
- **Kekes artesanales**
- **Postres caseros**
- **Ingredientes seleccionados**
- **Regalos dulces**
- **Pedidos por WhatsApp**
- **Entrega coordinada en San Isidro**
- **Momentos especiales y productos hechos con amor**

Las imágenes del proyecto son referencias visuales cargadas desde Unsplash. Para una publicación comercial, se recomienda reemplazarlas por fotografías autorizadas de los productos reales de Dulce Momento.

### Cuenta de cliente
- Interfaz para iniciar sesión y crear una cuenta.
- Formulario de acceso previo a continuar con la compra.
- Integración inicial con Supabase Auth cuando se configuran las credenciales.
- Sin credenciales de Supabase, los formularios operan en modo de demostración; no representan autenticación real ni deben usarse para proteger información.

### Chatbot
- Ventana de chat integrada en la página.
- Respuestas básicas sobre precios, entregas y consultas generales.
- Acceso directo a WhatsApp para continuar una conversación.

El chatbot implementado utiliza reglas sencillas; **no es todavía un asistente de IA conectado a un modelo externo**.

### Administración y pedidos
- Interfaz inicial de administración.
- Tabla de demostración para consultar pedidos creados durante la sesión.
- Estados previstos para el flujo: `nuevo`, `leido`, `preparacion`, `listo`, `cerrado` y `cancelado`.
- Formulario de email marketing con destinatario, asunto y mensaje.

La vista administrativa incluida en esta versión no constituye todavía un panel de producción conectado de extremo a extremo. La persistencia, consulta de pedidos y actualización segura de estados deben completarse mediante backend y políticas de autorización.

## 🧰 Tecnologías

| Tecnología | Uso |
|---|---|
| React | Componentes e interfaz de usuario |
| Vite | Servidor de desarrollo y compilación |
| JavaScript | Lógica de la aplicación |
| CSS | Estilos, diseño adaptable y componentes visuales |
| Lucide React | Iconos |
| Supabase JS | Cliente para autenticación y base de datos |
| Supabase (previsto) | Autenticación, perfiles y persistencia de pedidos |
| WhatsApp Click to Chat | Continuación de pedidos y consultas |
| HubSpot (pendiente de conexión backend) | CRM para contactos y oportunidades |
| Resend (pendiente de conexión backend) | Servicio previsto para envío de correo |

## 📁 Estructura del proyecto

```text
Dulce_Momento_GitHub/
├── index.html
├── package.json
├── .env.example
├── README.md
├── src/
│   ├── main.jsx
│   └── styles.css
└── supabase/
    └── schema.sql
```

## ⚙️ Requisitos

- Node.js LTS (se recomienda una versión compatible con Vite 6).
- npm.
- Git, si se desea trabajar con GitHub.
- Un navegador actualizado.

Comprueba que Node.js y npm estén instalados:

```bash
node --version
npm --version
```

## 🚀 Instalación y ejecución local

1. Clona el repositorio o descarga el ZIP:

   ```bash
   git clone https://github.com/jimrv/dulce_momento.git
   cd dulce_momento
   ```

2. Instala las dependencias:

   ```bash
   npm install
   ```

3. Copia `.env.example` a un archivo `.env` y configura las variables necesarias.

4. Inicia el servidor de desarrollo:

   ```bash
   npm run dev
   ```

5. Abre en el navegador la dirección local que muestre Vite, normalmente `http://localhost:5173`.

Para comprobar la compilación de producción:

```bash
npm run build
```

La salida de producción se genera en `dist/`. Para previsualizarla localmente:

```bash
npm run preview
```

## 🔐 Variables de entorno

Crea un archivo `.env` en la raíz del proyecto usando `.env.example` como referencia:

```dotenv
VITE_SUPABASE_URL=https://TU-PROYECTO.supabase.co
VITE_SUPABASE_ANON_KEY=TU_CLAVE_PUBLICA_ANON
VITE_HUBSPOT_FUNCTION_URL=
VITE_EMAIL_FUNCTION_URL=
VITE_WHATSAPP_NUMBER=51999952861
```

- `VITE_SUPABASE_URL`: URL del proyecto de Supabase.
- `VITE_SUPABASE_ANON_KEY`: clave pública anon/publishable de Supabase. Debe estar acompañada de políticas RLS bien configuradas.
- `VITE_HUBSPOT_FUNCTION_URL`: URL de una función backend propia que gestione la integración con HubSpot.
- `VITE_EMAIL_FUNCTION_URL`: URL de una función backend propia para enviar correo.
- `VITE_WHATSAPP_NUMBER`: número de WhatsApp en formato internacional, solo números y sin `+` ni espacios.

**No publiques `.env` ni claves privadas en GitHub.** Las variables que comienzan con `VITE_` se incorporan al código accesible desde el navegador; por eso nunca deben contener tokens privados, contraseñas ni claves `service_role`.

## 🗄️ Configuración de Supabase

1. Crea un proyecto en Supabase.
2. Abre **SQL Editor**.
3. Ejecuta el contenido de `supabase/schema.sql`.
4. Copia la URL y la clave pública del proyecto a tu `.env`.
5. Configura y prueba el flujo de autenticación.
6. Implementa políticas RLS y lógica de backend para autorizar cada operación.

El esquema inicial define las tablas `profiles` y `orders`, con campos para cliente, correo, artículos, total, estado y referencia de HubSpot. El SQL es una base de partida, no una configuración de seguridad completa para producción.

Antes de activar pedidos reales, la aplicación debe enviar el identificador del usuario autenticado junto al pedido y comprobarlo en el servidor. También se deben implementar las políticas que permitan a administradores autorizados consultar todos los pedidos y cambiar sus estados sin dar ese permiso a clientes normales.

## 🛒 Flujo de pedido por WhatsApp

El flujo previsto es:

1. El cliente selecciona productos y cantidades.
2. Revisa el subtotal en el carrito.
3. Inicia sesión o crea una cuenta.
4. La aplicación registra el pedido en la base de datos.
5. Se abre WhatsApp con un mensaje preparado que contiene el código del pedido, los productos, las cantidades y el total.
6. El cliente y el negocio coordinan la confirmación y la entrega por WhatsApp.
7. El administrador actualiza el estado del pedido desde el panel.

En la versión inicial, el guardado persistente depende de la configuración de Supabase. Sin esa configuración, la aplicación utiliza datos de demostración y no conserva los pedidos como una tienda real.

## 🔗 HubSpot CRM

La integración con HubSpot está prevista para registrar la información comercial del pedido. Para implementarla de forma segura:

1. Crea una aplicación privada en HubSpot y define los permisos mínimos necesarios.
2. Implementa una función backend (por ejemplo, una Supabase Edge Function) que reciba el pedido.
3. Desde el backend, crea o actualiza el contacto y crea un negocio (*deal*) asociado al pedido.
4. Guarda el identificador devuelto por HubSpot en `orders.hubspot_deal_id`.
5. Gestiona errores, reintentos y duplicados para evitar crear varias oportunidades por un mismo pedido.

El token privado de HubSpot debe guardarse en los secretos del backend. **No se debe colocar en React, en `.env` con prefijo `VITE_` ni en el repositorio.**

La sincronización real no se activa solamente por definir `VITE_HUBSPOT_FUNCTION_URL`; es necesario desarrollar y desplegar esa función.

## ✉️ Email marketing

El panel incluye campos para destinatario, asunto y contenido del mensaje. La aplicación puede llamar a un endpoint backend mediante `VITE_EMAIL_FUNCTION_URL`.

Para activar el envío:

1. Crea una cuenta en Resend u otro proveedor compatible.
2. Verifica el dominio remitente y configura los registros DNS que solicite el proveedor.
3. Implementa un endpoint backend que valide la solicitud y envíe el correo.
4. Guarda la API key como secreto del backend.
5. Configura `VITE_EMAIL_FUNCTION_URL` con la URL del endpoint desplegado.
6. Prueba los envíos y revisa la respuesta del proveedor.

El correo `rjimena@gmail.com` figura como destinatario inicial del formulario, no como remitente verificado. No se envía ningún correo si el endpoint no está configurado. Para campañas de marketing, solicita consentimiento y ofrece una forma de darse de baja.

## 🌐 Publicación

Puedes desplegar el frontend en Vercel, Netlify u otro hosting compatible con Vite.

Configuración general:
- Comando de instalación: `npm install`
- Comando de compilación: `npm run build`
- Directorio de publicación: `dist`
- Variables de entorno: configura en el panel del hosting las mismas variables públicas necesarias para el frontend.

Después del despliegue, configura el dominio, verifica los enlaces y prueba la experiencia en móvil. Las funciones backend de Supabase, HubSpot y correo deben desplegarse y configurarse por separado.

## 🛡️ Seguridad y pendientes para producción

Antes de recibir pedidos reales, completa y verifica:

- [ ] Configurar Supabase Auth y recuperación de contraseña.
- [ ] Implementar y validar roles de cliente y administrador en el servidor.
- [ ] Aplicar políticas RLS completas para perfiles y pedidos.
- [ ] Persistir pedidos y permitir que el administrador consulte y actualice los estados desde la base de datos.
- [ ] Implementar una función backend para la sincronización con HubSpot.
- [ ] Implementar una función backend para el envío de correo.
- [ ] Validar datos y precios en el servidor; no confiar en importes calculados por el navegador.
- [ ] Gestionar errores de red, reintentos y pedidos duplicados.
- [ ] Añadir política de privacidad, condiciones de compra y consentimiento para comunicaciones comerciales.
- [ ] Sustituir las fotografías de referencia por imágenes autorizadas de los productos.
- [ ] Probar el sitio en distintos dispositivos y navegadores.

## 📄 Licencia

No se ha definido una licencia de distribución. Añade una licencia explícita si deseas autorizar la reutilización o modificación del código por terceros.
