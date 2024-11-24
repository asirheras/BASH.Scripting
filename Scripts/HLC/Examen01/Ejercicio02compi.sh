# Fecha: 2024-03-07
# Descripción: Ping a ipa y recogida de resultados enseparados
#!/bin/bash
direcciones_IP=("192.168.112.248" "192.168.112.142" "192.168.112.3")

verificar_ip() { 
    direccion_IP="$1"
    ping -c 1 -W 1 "$direccion_IP" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$direccion_IP" >> "JLT_ip_on"
    else
        echo "$direccion_IP" >> "JLT_ip_off"
    fi
}

fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")
echo "Fecha y hora de verificación: $fecha_hora" >> "aan_ip_on"
echo "Fecha y hora de verificación: $fecha_hora" >> "aan_ip_off"

for direccion in "${direcciones_IP[@]}"; do
    verificar_ip "$direccion"
done

echo "Proceso de verificación concluido."
