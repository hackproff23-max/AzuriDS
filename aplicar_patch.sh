#!/bin/sh
# Injeta a chamada do editor do analogico no Customizer.onCreate
F=universal/smali/com/dsemu/drastic/ui/Customizer.smali
[ -f "$F" ] || { echo "ERRO: $F nao encontrado (rode dentro do repo AzuriDS)"; exit 1; }
if grep -q 'AnalogStick;->scheduleEditor' "$F"; then
  echo "Customizer ja esta modificado."; exit 0
fi
awk '
/^\.method .* onCreate\(Landroid\/os\/Bundle;\)V/ && !done {st=1}
{
  if (st==2 && $0 !~ /^[ \t]*$/ && $0 !~ /^[ \t]*\./ && $0 !~ /^[ \t]*#/) {
    print "    invoke-static {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->scheduleEditor(Landroid/app/Activity;)V"
    print ""
    st=0; done=1
  }
  print
  if (st==1 && $0 ~ /^[ \t]*\.locals/) st=2
}' "$F" > "$F.tmp" && mv "$F.tmp" "$F"
if grep -q 'AnalogStick;->scheduleEditor' "$F"; then
  echo "OK: Customizer modificado."
else
  echo "ERRO: nao achei onCreate no Customizer."; exit 1
fi
