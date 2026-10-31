#!/bin/sh
# AzuriDS: oculta o dpad nativo quando o analogico esta ON + analogico da caneta (PenStick)
# Idempotente. Roda na raiz do repo (local no Termux ou no GitHub Actions).
set -e
NI=universal/smali/n0/i.smali
AS=universal/smali/com/dsemu/drastic/ui/AnalogStick.smali
[ -f "$NI" ] || { echo "ERRO: $NI nao encontrado"; exit 1; }
[ -f "$AS" ] || { echo "ERRO: $AS nao encontrado"; exit 1; }
[ -f universal/smali/com/dsemu/drastic/PenStick.smali ] || { echo "ERRO: PenStick.smali nao encontrado"; exit 1; }

# ---------- 1) n0/i.smali ----------
if ! grep -q 'syncAnalogDpad' "$NI"; then
  awk '
  { print }
  /^\.method public w\(IJ\)V/ { st=1; next }
  st==1 && /^[ \t]*\.locals/ {
    print ""
    print "    invoke-direct {p0}, Ln0/i;->syncAnalogDpad()V"
    st=0
  }' "$NI" > "$NI.tmp" && mv "$NI.tmp" "$NI"

  cat >> "$NI" <<'EOF'


# AzuriDS: esconde o dpad nativo (desenho + toque) quando o analogico estiver ON
.method private syncAnalogDpad()V
    .locals 5

    sget-boolean v0, Lcom/dsemu/drastic/ui/AnalogStick;->sHide:Z

    if-eqz v0, :cond_ret

    const/4 v0, 0x0

    iput-boolean v0, p0, Ln0/i;->o:Z

    iget-object v1, p0, Ln0/i;->b:[Ln0/i$b;

    iget-object v2, p0, Ln0/i;->c:[Ln0/i$b;

    const/16 v3, 0xc

    :goto_loop
    const/16 v4, 0x10

    if-ge v3, v4, :cond_ret

    aget-object v4, v1, v3

    iput-boolean v0, v4, Ln0/i$b;->e:Z

    aget-object v4, v2, v3

    iput-boolean v0, v4, Ln0/i$b;->e:Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_loop

    :cond_ret
    return-void
.end method

# AzuriDS: caneta touch (x,y em coordenadas do DS: 0..255 / 0..191)
.method public penDown(II)V
    .locals 4

    iget v0, p0, Ln0/i;->E:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Ln0/i;->E:I

    shl-int/lit8 v1, p1, 0x10

    or-int/2addr v1, p2

    iput v1, p0, Ln0/i;->H:I

    iget v2, p0, Ln0/i;->F:I

    or-int/2addr v2, v0

    iget-object v3, p0, Ln0/i;->a:Ln0/g;

    invoke-interface {v3, v2, v1}, Ln0/g;->d(II)V

    return-void
.end method

.method public penUp()V
    .locals 4

    iget v0, p0, Ln0/i;->E:I

    const v1, 0x7fffffff

    and-int/2addr v0, v1

    iput v0, p0, Ln0/i;->E:I

    const/4 v1, 0x0

    iput v1, p0, Ln0/i;->H:I

    iget v2, p0, Ln0/i;->F:I

    or-int/2addr v2, v0

    iget-object v3, p0, Ln0/i;->a:Ln0/g;

    invoke-interface {v3, v2, v1}, Ln0/g;->d(II)V

    return-void
.end method

.method public penOrient()I
    .locals 1

    iget v0, p0, Ln0/i;->n:I

    return v0
.end method
EOF
fi

# ---------- 2) AnalogStick.smali ----------
if ! grep -q 'sHide' "$AS"; then
  sed -i 's/^# instance fields/.field public static sHide:Z\n\n# instance fields/' "$AS"
  awk '
  { print }
  /^\.method private applyPrefs\(\)V/ { ap=1; next }
  ap==1 && /^[ \t]*\.locals/ {
    print ""
    print "    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->updateHide()V"
    ap=0
  }
  /^\.method public static attach\(/ { at=1; next }
  at==1 && /->applyPrefs\(\)V/ {
    print ""
    print "    invoke-static {p0, p1}, Lcom/dsemu/drastic/PenStick;->attach(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;)V"
    at=0
  }' "$AS" > "$AS.tmp" && mv "$AS.tmp" "$AS"
  cat >> "$AS" <<'EOF'


.method private updateHide()V
    .locals 1

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEdit:Z

    if-nez v0, :cond_ret

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->readEnabled()Z

    move-result v0

    sput-boolean v0, Lcom/dsemu/drastic/ui/AnalogStick;->sHide:Z

    :cond_ret
    return-void
.end method
EOF
fi

# ---------- verificacao ----------
grep -q 'invoke-direct {p0}, Ln0/i;->syncAnalogDpad()V' "$NI" || { echo "ERRO: chamada em w() nao injetada"; exit 1; }
grep -q 'invoke-static {p0, p1}, Lcom/dsemu/drastic/PenStick;->attach' "$AS" || { echo "ERRO: PenStick.attach nao injetado"; exit 1; }
grep -q 'AnalogStick;->updateHide()V' "$AS" || { echo "ERRO: updateHide nao injetado em applyPrefs"; exit 1; }
echo "OK: dpad oculto com analogico ON + caneta (PenStick) ativada."
