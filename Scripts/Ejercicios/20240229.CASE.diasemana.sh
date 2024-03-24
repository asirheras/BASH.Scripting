# Le pedimos al usuario que ingrese un día de la semana
read -p"Ingrese un día de la semana (en minúsculas):" dia

# Utilizamos la estructura case para realizar diferentes acciones según el día ingresado
case $dia in
    lunes)
        echo "Hoy es lunes. Es el primer día de la semana."
        ;;
    martes|miércoles|jueves|viernes)
        echo "Hoy es $dia. Es un día laborable."
        ;;
    sábado|domingo)
        echo "Hoy es $dia. Es fin de semana."
        ;;
    *) # Caso por defecto si no coincide con ninguno de los anteriores
        echo "Día no válido. Por favor, ingrese un día de la semana."
        ;;
esac
