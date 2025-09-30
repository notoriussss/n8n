# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Configura el directorio de trabajo
WORKDIR /data

# Copia los archivos necesarios (opcional, si tienes configuraciones locales)
COPY . /data

# Expone el puerto 5678
EXPOSE 5678

# Comando para iniciar n8n
CMD ["npx", "n8n"]
