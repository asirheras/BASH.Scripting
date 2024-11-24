#!/bin/bash

# Función para hacer una pregunta con dos opciones
hacer_pregunta() {
    local pregunta="$1"
    local opcion1="$2"
    local opcion2="$3"

    echo "$pregunta"
    echo "a) $opcion1"
    echo "b) $opcion2"
    read -p "Tu respuesta (a/b): " respuesta_usuario

    # Convertir la respuesta a minúsculas para hacer la comparación
    respuesta_usuario=$(echo "$respuesta_usuario" | tr '[:upper:]' '[:lower:]')

    # Comparar la respuesta del usuario con la respuesta correcta
    if [ "$respuesta_usuario" == "$respuesta_correcta" ]; then
        echo "¡Correcto!"
    else
        echo "Incorrecto. La respuesta correcta es $respuesta_correcta."
    fi
}

# Pregunta 1
pregunta="¿Cuál es la capital de Francia?"
opcion1="París"
opcion2="Londres"
respuesta_correcta="a"
hacer_pregunta "$pregunta" "$opcion1" "$opcion2"

# Pregunta 2
pregunta="¿En qué año se fundó la ONU?"
opcion1="1945"
opcion2="1918"
respuesta_correcta="a"
hacer_pregunta "$pregunta" "$opcion1" "$opcion2"

# Pregunta 3
pregunta="¿Cuál es el símbolo químico del oro?"
opcion1="O"
opcion2="Au"
respuesta_correcta="b"
hacer_pregunta "$pregunta" "$opcion1" "$opcion2"
