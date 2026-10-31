#!/bin/sh
# Corrige a injecao no Customizer.onCreate (poe a chamada depois do invoke-super)
F=universal/smali/com/dsemu/drastic/ui/Customizer.smali
[ -f "$F" ] || { echo "ERRO: $F nao encontrado (rode dentro do repo AzuriDS)"; exit 1; }
# 1) remove qualquer injecao anterior (inclusive a errada)
sed -i '/AnalogStick;->scheduleEditor/d' "$F"
# 2) insere logo apos o invoke-super do onCreate
awk '
{ print }
!done && $0 ~ /invoke-super \{p0, p1\}, Landroid\/app\/Activity;->onCreate\(Landroid\/os\/Bundle;\)V/ {
  print ""
  print "    invoke-static {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->scheduleEditor(Landroid/app/Activity;)V"
  done=1
}' "$F" > "$F.tmp" && mv "$F.tmp" "$F"
if grep -q 'AnalogStick;->scheduleEditor' "$F"; then
  echo "OK: Customizer corrigido."
else
  echo "ERRO: nao achei o invoke-super do onCreate."; exit 1
fi
