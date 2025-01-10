$fechaActual = Get-Date

$formatoFecha = "Hoy es {0:dddd} de {0:MMMM} de {0:yyyy}"

$formatoFechaHora = "Hoy es {0:dddd} de {0:MMMM} de {0:yyyy} y son las {0:HH} horas y {0:mm} minutos"

$respuesta = Read-Host "¿Quieres mostrar solo la fecha (F) o fecha y hora (FH)?"

if ($respuesta -eq 'F') {
    Write-Host ($fechaActual.ToString($formatoFecha))
} elseif ($respuesta -eq 'FH') {

    Write-Host ($fechaActual.ToString($formatoFechaHora))
} else 
    Write-Host "Respuesta no válida. Por favor, ingresa 'F' para solo fecha o 'FH' para fecha y hora"
}
