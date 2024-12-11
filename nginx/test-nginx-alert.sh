#!/bin/sh

# Configuración del script
URL="http://localhost:8080/nonexistentpage"  # URL que generará errores 404
REQUEST_COUNT=20                        # Número de solicitudes que generarán errores
DELAY_BETWEEN_REQUESTS=1                # Tiempo en segundos entre cada solicitud

echo "Generando $REQUEST_COUNT solicitudes con errores 404 a $URL..."

# Enviar las solicitudes
i=1
while [ "$i" -le "$REQUEST_COUNT" ]; do
 RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
 echo "Solicitud $i: Código de respuesta HTTP $RESPONSE"
 sleep $DELAY_BETWEEN_REQUESTS
 i=$((i + 1))
done

echo "Prueba finalizada. Verifica las alertas en Kibana."
