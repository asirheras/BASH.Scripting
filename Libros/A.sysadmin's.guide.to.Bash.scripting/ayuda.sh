function mostrar_ayuda {
    echo "Uso: $0 [opciones]"
    echo
    echo "Opciones:"
    echo "  -h, --help       Muestra esta ayuda y sale"
    echo "  -f, --file FILE  Especifica el archivo a procesar"
    echo "  -v, --verbose    Modo verbose (muestra información adicional)"
    echo
}
archivo=""
verbose=0
while [[ "$1" != "" ]]; do
    case $1 in
        -h | --help )
            mostrar_ayuda
            exit
            ;;
        -f | --file )
            shift
            archivo=$1
            ;;
        -v | --verbose )
            verbose=1
            ;;
        * )
            echo "Opción no válida: $1"
            mostrar_ayuda
            exit 1
    esac
    shift
done

if [[ -z "$archivo" ]]; then
    echo "Debe especificar un archivo con -f o --file."
    mostrar_ayuda
    exit 1
fi

function procesar_archivo {
    local archivo=$1
    if [[ $verbose -eq 1 ]]; then
        echo "Procesando el archivo: $archivo en modo verbose"
    else
        echo "Procesando el archivo: $archivo"
    fi
    # Aquí iría el código para procesar el archivo
}

procesar_archivo "$archivo"


