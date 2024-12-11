#!/bin/bash

# URL objetivo
URL="http://localhost:8080/"

# Número total de solicitudes
TOTAL_REQUESTS=1000

# Contador para solicitudes exitosas y fallidas
SUCCESS_COUNT=0
FAILURE_COUNT=0

# Tiempo inicial
START_TIME=$(date +%s)

for ((i=1; i<=TOTAL_REQUESTS; i++))
do
  RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

  if [ "$RESPONSE_CODE" -eq 200 ]; then
    SUCCESS_COUNT=$((SUCCESS_COUNT+1))
  else
    FAILURE_COUNT=$((FAILURE_COUNT+1))
  fi

done

# Tiempo final
END_TIME=$(date +%s)

# Calcula el tiempo total
TOTAL_TIME=$((END_TIME-START_TIME))

# Imprime estadísticas
echo "\nTotal de solicitudes enviadas: $TOTAL_REQUESTS"
echo "Exitosas: $SUCCESS_COUNT"
echo "Fallidas: $FAILURE_COUNT"
echo "Tiempo total: $TOTAL_TIME segundos"