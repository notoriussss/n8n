# Despliegue de n8n en Render

Este proyecto contiene la configuración necesaria para desplegar n8n en Render usando Docker.

## Archivos incluidos

- `Dockerfile`: Configuración de Docker para n8n
- `render.yaml`: Configuración de Render como código
- `.gitignore`: Archivos a ignorar en Git

## Pasos para desplegar

### 1. Configurar variables de entorno

Antes de desplegar, asegúrate de actualizar las siguientes variables en `render.yaml`:

- `N8N_BASIC_AUTH_USER`: Cambia "admin" por tu usuario preferido
- `N8N_BASIC_AUTH_PASSWORD`: Cambia "yourpassword" por una contraseña segura
- `WEBHOOK_URL`: Se actualizará automáticamente con la URL de Render

### 2. Subir a GitHub

```bash
# Inicializar repositorio Git
git init
git add .
git commit -m "Initial commit: n8n deployment for Render"
git branch -M main
git remote add origin https://github.com/tu-usuario/tu-repo.git
git push -u origin main
```

### 3. Crear servicio en Render

1. Ve a [Render](https://render.com) y crea una cuenta
2. Haz clic en "New" > "Web Service"
3. Conecta tu cuenta de GitHub
4. Selecciona el repositorio donde está este proyecto
5. Configura los siguientes parámetros:
   - **Environment**: Docker
   - **Dockerfile Path**: Dockerfile
   - **Port**: 5678
6. Agrega las variables de entorno necesarias
7. Haz clic en "Create Web Service"

### 4. Variables de entorno importantes

- `N8N_BASIC_AUTH_ACTIVE`: Activa la autenticación básica (true/false)
- `N8N_BASIC_AUTH_USER`: Usuario para autenticación
- `N8N_BASIC_AUTH_PASSWORD`: Contraseña para autenticación
- `WEBHOOK_URL`: URL pública de tu instancia (se configura automáticamente)
- `GENERIC_TIMEZONE`: Zona horaria (ej: UTC, America/Mexico_City)
- `N8N_HOST`: Host (0.0.0.0 para Render)
- `N8N_PORT`: Puerto (5678)
- `N8N_PROTOCOL`: Protocolo (https)

### 5. Acceder a n8n

Una vez desplegado, Render te proporcionará una URL pública. Accede a esa URL y usa las credenciales que configuraste.

## Notas importantes

- El plan gratuito de Render puede tener limitaciones de tiempo de inactividad
- Los datos se perderán si no configuras una base de datos persistente
- Para producción, considera usar un plan de pago y configurar una base de datos

## Solución de problemas

- Si el servicio no inicia, revisa los logs en el panel de Render
- Asegúrate de que todas las variables de entorno estén configuradas correctamente
- Verifica que el puerto 5678 esté expuesto en el Dockerfile
