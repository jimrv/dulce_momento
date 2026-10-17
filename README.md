# Dulce Momento — tienda de pastelería artesanal

Proyecto React + Vite para catálogo, carrito, login/registro, checkout por WhatsApp, chatbot de preguntas frecuentes y panel administrativo de demostración. La interfaz usa una estética crema/rosa, tipografía editorial y fotografía relacionada con pastelería.

## Ejecutar localmente
1. Instala Node.js LTS.
2. Copia `.env.example` a `.env` y completa las variables que correspondan.
3. Ejecuta `npm install`.
4. Ejecuta `npm run dev` y abre la URL que indique Vite.

## Publicar en GitHub
Crea un repositorio vacío en GitHub y, desde esta carpeta:
```bash
git init
git add .
git commit -m "Primera versión de Dulce Momento"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/TU-REPOSITORIO.git
git push -u origin main
```

## Diseño e identidad
Palabras clave reflejadas en el contenido y las imágenes: **pastelería artesanal, hecho con amor, tortas personalizadas, kekes, postres caseros, ingredientes seleccionados, regalos dulces, momentos especiales, pedidos por WhatsApp y entrega en San Isidro**. Las imágenes usan URLs de Unsplash como referencia visual; reemplázalas por las fotos oficiales de tus productos para representar fielmente la marca.

## Integraciones que requieren configuración
- **Supabase:** ejecuta `supabase/schema.sql`, configura autenticación, políticas RLS y una función segura para comprobar el rol de administrador. El modo sin credenciales es una demostración local, no una autenticación real.
- **WhatsApp:** número predeterminado +51 999 952 861. Cambia `VITE_WHATSAPP_NUMBER` si corresponde. El flujo guarda el pedido en Supabase antes de abrir WhatsApp cuando Supabase está configurado.
- **HubSpot CRM:** crea una función backend (por ejemplo, Supabase Edge Function) que reciba los pedidos, cree/actualice el contacto y cree un negocio/deal en HubSpot. Guarda el token privado en secretos del backend; no incluyas tokens en el frontend. `VITE_HUBSPOT_FUNCTION_URL` queda reservado para esa función.
- **Email marketing:** configura `VITE_EMAIL_FUNCTION_URL` con una función backend que envíe a través de Resend. Verifica el dominio remitente y la autorización para enviar a los destinatarios. La interfaz permite editar destinatario, asunto y cuerpo, pero no simula un envío exitoso si falta el servicio.
- **Chatbot:** el asistente incluido responde preguntas frecuentes con reglas básicas. Para IA, CRM o almacenamiento de leads real, conecta un servicio backend y su política de privacidad.

## Antes de producción
La vista de administración de esta base inicial solo demuestra los pedidos guardados durante la sesión. Implementa consultas y cambios de estado conectados a Supabase, políticas RLS y control de acceso por rol antes de publicar. No uses la clave `service_role` en variables `VITE_*`. Revisa privacidad, consentimiento para marketing y protección de datos personales.
