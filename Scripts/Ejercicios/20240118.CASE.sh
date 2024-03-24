#Crea un script que muestre un menú simple y ejecute una acción en base a la selección del usuario. Las acciones disponibles #serán: Listar archivos, Mostrar fecha y hora actual, salir

while true; do
    # Bucle while true (bucle infinito) hasta que elegimos la opción 3.sarli
    clear
    echo "Ejecute una opción"
    echo "1. Listar archivos"
    echo "2. Mostrar fecha y hora actual"
    echo "3. Salir"

    read -p "Elige la opción de listar archivos" opcion
    case $opcion in 
    1)
            echo "Has elegido la opción de listar archivos"
            ls
            ;;


    2)
            echo"Has elegido la opción de fecha y hora"
            date
            ;;
    3)
            exit
            ;;

    *)
            echo "Opcion no válida"
            ;;
    esac
    read -n 1 -s -r -p "Pulsa una tecla para continuar"
done    