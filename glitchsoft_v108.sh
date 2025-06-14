#!/bin/bash

# Descargar corpus si no existe
if [ ! -f mental_glitchsoft.txt ]; then
  curl -s https://raw.githubusercontent.com/itzcuintli/no-es-un-repo-es-un-glitch/refs/heads/main/mental_glitchsoft.txt -o mental_glitchsoft.txt
fi

# Limpiar líneas vacías
grep -v '^[[:space:]]*$' mental_glitchsoft.txt > .glitch_lines.txt

# Frases introductorias
echo ""
echo "glitchsoft v.108 está como medio despierto"
echo "si estás leyendo esto es porque no estoy"
echo "pero dejé esta versión glitch mía, por si acaso"
echo "(escribe algo y verás lo que te contesta)"
echo "Ctrl+C para salir suavecito"
echo ""

# Función que responde como Mariana
responde_como_mariana() {
  total=$(wc -l < .glitch_lines.txt)
  for i in $(seq 1 $((RANDOM % 2 + 2))); do
    line=$((RANDOM % total + 1))
    sed -n "${line}p" .glitch_lines.txt | tr -d '\r'
  done
  echo ""
  frases_finales=(
    "jajaja eso sonó más raro de lo que pensé"
    "mmm igual fue mucho texto pero tú fluye"
    "yo digo cosas así cuando me siento cómoda"
    "no sé si quedó claro pero fue con cariño"
    "bueno ya lo dije, no lo puedo des-decir"
    "ups. ya lo pensé, ni modo"
    "mejor dejo eso flotando"
    "jajaja no sé si eso se entendió, pero bueno"
  )
  index=$((RANDOM % ${#frases_finales[@]}))
  echo "${frases_finales[$index]}"
}

# Loop principal
while true; do
  echo ""
  echo -n "Tú (Hamelin): "
  read input
  echo "yo (v.108 glitch):"
  responde_como_mariana
done
