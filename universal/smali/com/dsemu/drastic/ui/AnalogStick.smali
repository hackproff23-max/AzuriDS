.class public Lcom/dsemu/drastic/ui/AnalogStick;
.super Landroid/view/View;
.source "AnalogStick.java"


# instance fields
.field private mBase:Landroid/graphics/Paint;

.field private mDx:F

.field private mDy:F

.field private mEdit:Z

.field private mEnabled:Z

.field private mGl:Lcom/dsemu/drastic/DraSticGlView;

.field private mMode:I

.field private mPaintE:Landroid/graphics/Paint;

.field private mRing:Landroid/graphics/Paint;

.field private mSL:I

.field private mSS:I

.field private mST:I

.field private mSX:F

.field private mSY:F

.field private mState:[Z

.field private mThumb:Landroid/graphics/Paint;

.field private mZone:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 6

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mGl:Lcom/dsemu/drastic/DraSticGlView;

    const/4 v0, 0x4

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mState:[Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/4 v1, 0x1

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v4, 0x66000000

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mBase:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v4, -0x55000001

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v5, 0x40400000    # 3.0f

    mul-float/2addr v5, v0

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iput-object v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mRing:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v4, -0x33000001

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mThumb:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    const v3, -0x3ef9

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v3, v0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v3, 0x41800000    # 16.0f

    mul-float/2addr v3, v0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iput-object v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mPaintE:Landroid/graphics/Paint;

    const/high16 v3, 0x42200000    # 40.0f

    mul-float/2addr v3, v0

    float-to-int v3, v3

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mZone:I

    return-void
.end method

.method public static attach(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 3

    new-instance v0, Lcom/dsemu/drastic/ui/AnalogStick;

    invoke-direct {v0, p0, p1}, Lcom/dsemu/drastic/ui/AnalogStick;-><init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;)V

    const v1, 0x3f19999a    # 0.6f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-direct {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->makeLp()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->applyPrefs()V

    return-void
.end method

.method public static attachEditor(Landroid/app/Activity;)V
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_end

    new-instance v0, Lcom/dsemu/drastic/ui/AnalogStick;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/dsemu/drastic/ui/AnalogStick;-><init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/dsemu/drastic/ui/AnalogStick;->mEdit:Z

    invoke-direct {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->readEnabled()Z

    move-result v1

    iput-boolean v1, v0, Lcom/dsemu/drastic/ui/AnalogStick;->mEnabled:Z

    invoke-direct {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->refreshAlpha()V

    invoke-direct {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->makeLp()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_end
    return-void
.end method

.method public static scheduleEditor(Landroid/app/Activity;)V
    .locals 3

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/dsemu/drastic/ui/AnalogStick$Attach;

    invoke-direct {v1, p0}, Lcom/dsemu/drastic/ui/AnalogStick$Attach;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    const-string v0, "azuri_analog"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private static suf(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_p

    const-string v0, "_l"

    return-object v0

    :cond_p
    const-string v0, "_p"

    return-object v0
.end method

.method private ref(Z)I
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_dm

    check-cast v0, Landroid/view/View;

    if-eqz p1, :cond_h

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    goto :cond_chk

    :cond_h
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    :cond_chk
    if-lez v1, :cond_dm

    return v1

    :cond_dm
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    if-eqz p1, :cond_dh

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v1

    :cond_dh
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    return v1
.end method

.method private readEnabled()Z
    .locals 4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->suf(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "e"

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private makeLp()Landroid/widget/FrameLayout$LayoutParams;
    .locals 13

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->suf(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/high16 v4, -0x40800000    # -1.0f

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v5

    const-string v3, "y"

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v6

    const-string v3, "s"

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/high16 v4, 0x43160000    # 150.0f

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v7

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v8, v0, Landroid/util/DisplayMetrics;->density:F

    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/dsemu/drastic/ui/AnalogStick;->ref(Z)I

    move-result v9

    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/dsemu/drastic/ui/AnalogStick;->ref(Z)I

    move-result v10

    mul-float/2addr v7, v8

    float-to-int v7, v7

    const/4 v3, 0x0

    cmpg-float v4, v5, v3

    if-gez v4, :cond_saved

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float/2addr v4, v8

    float-to-int v11, v4

    sub-int v12, v10, v11

    sub-int/2addr v12, v7

    goto :cond_build

    :cond_saved
    int-to-float v4, v9

    mul-float/2addr v4, v5

    float-to-int v11, v4

    int-to-float v4, v10

    mul-float/2addr v4, v6

    float-to-int v12, v4

    :cond_build
    if-gez v11, :cond_left_ok

    const/4 v11, 0x0

    :cond_left_ok
    if-gez v12, :cond_top_ok

    const/4 v12, 0x0

    :cond_top_ok
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x33

    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v3, 0x0

    invoke-virtual {v0, v11, v12, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    return-object v0
.end method

.method private applyPrefs()V
    .locals 2

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->makeLp()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEdit:Z

    if-nez v0, :cond_ret

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->readEnabled()Z

    move-result v0

    if-eqz v0, :cond_gone

    const/4 v1, 0x0

    goto :cond_set

    :cond_gone
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->releaseAll()V

    const/16 v1, 0x8

    :cond_set
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_ret
    return-void
.end method

.method private refreshAlpha()V
    .locals 2

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEnabled:Z

    if-eqz v0, :cond_off

    const v1, 0x3f666666    # 0.9f

    goto :cond_set

    :cond_off
    const v1, 0x3e99999a    # 0.3f

    :cond_set
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method private save()V
    .locals 11

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->suf(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->ref(Z)I

    move-result v4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/dsemu/drastic/ui/AnalogStick;->ref(Z)I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout$LayoutParams;

    const-string v7, "e"

    invoke-virtual {v7, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-boolean v8, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEnabled:Z

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v7, "x"

    invoke-virtual {v7, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    int-to-float v8, v8

    int-to-float v9, v4

    div-float/2addr v8, v9

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    const-string v7, "y"

    invoke-virtual {v7, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    int-to-float v8, v8

    int-to-float v9, v5

    div-float/2addr v8, v9

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    const-string v7, "s"

    invoke-virtual {v7, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget v8, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v8, v8

    div-float/2addr v8, v3

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private radius()F
    .locals 3

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const v1, 0x3f6b851f    # 0.92f

    mul-float/2addr v0, v1

    return v0
.end method

.method private setDir(IZ)V
    .locals 3

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mState:[Z

    aget-boolean v1, v0, p1

    if-eq v1, p2, :cond_0

    aput-boolean p2, v0, p1

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mGl:Lcom/dsemu/drastic/DraSticGlView;

    add-int/lit8 v1, p1, 0xc

    invoke-virtual {v0, v1, p2}, Lcom/dsemu/drastic/DraSticGlView;->w0(IZ)V

    :cond_0
    return-void
.end method

.method private drawEdit(Landroid/graphics/Canvas;)V
    .locals 9

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mPaintE:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mZone:I

    int-to-float v3, v3

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v4, 0x40000000    # 2.0f

    sub-float v6, v1, v4

    sub-float v7, v2, v4

    new-instance v8, Landroid/graphics/RectF;

    invoke-direct {v8, v4, v4, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v8, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-boolean v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEnabled:Z

    if-eqz v4, :cond_lbl_off

    const-string v4, "ON"

    goto :cond_lbl

    :cond_lbl_off
    const-string v4, "OFF"

    :cond_lbl
    const/high16 v5, 0x40000000    # 2.0f

    div-float v6, v3, v5

    sub-float v7, v1, v6

    const v5, 0x3f333333    # 0.7f

    mul-float/2addr v5, v3

    invoke-virtual {p1, v4, v7, v5, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    sub-float v7, v1, v6

    sub-float v5, v2, v6

    const v4, 0x3e99999a    # 0.3f

    mul-float/2addr v4, v3

    invoke-virtual {p1, v7, v5, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private onTouchEdit(Landroid/view/MotionEvent;)Z
    .locals 9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v0, :cond_notdown

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSY:F

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSL:I

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mST:I

    iget v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSS:I

    const/4 v3, 0x3

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mMode:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mZone:I

    int-to-float v6, v6

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v7, v6

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    sub-float/2addr v8, v6

    cmpl-float v2, v4, v7

    if-ltz v2, :cond_dn_done

    cmpg-float v2, v5, v6

    if-gez v2, :cond_dn_notop

    const/4 v3, 0x1

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mMode:I

    goto :cond_dn_done

    :cond_dn_notop
    cmpl-float v2, v5, v8

    if-ltz v2, :cond_dn_done

    const/4 v3, 0x2

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mMode:I

    :cond_dn_done
    const/4 v0, 0x1

    return v0

    :cond_notdown
    const/4 v2, 0x2

    if-ne v0, v2, :cond_notmove

    iget v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mMode:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_ret

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSX:F

    sub-float/2addr v4, v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSY:F

    sub-float/2addr v5, v6

    if-ne v3, v2, :cond_domove

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSS:I

    float-to-int v7, v4

    add-int/2addr v6, v7

    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mZone:I

    mul-int/lit8 v7, v7, 0x2

    if-ge v6, v7, :cond_min_ok

    move v6, v7

    :cond_min_ok
    iget v7, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mZone:I

    mul-int/lit8 v7, v7, 0x8

    if-le v6, v7, :cond_max_ok

    move v6, v7

    :cond_max_ok
    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :cond_apply

    :cond_domove
    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mSL:I

    float-to-int v7, v4

    add-int/2addr v6, v7

    if-gez v6, :cond_lok

    const/4 v6, 0x0

    :cond_lok
    iput v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v6, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mST:I

    float-to-int v7, v5

    add-int/2addr v6, v7

    if-gez v6, :cond_tok

    const/4 v6, 0x0

    :cond_tok
    iput v6, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :cond_apply
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_ret
    const/4 v0, 0x1

    return v0

    :cond_notmove
    const/4 v2, 0x1

    if-eq v0, v2, :cond_up

    const/4 v2, 0x3

    if-ne v0, v2, :cond_ret2

    :cond_up
    iget v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mMode:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_save

    if-ne v0, v4, :cond_save

    iget-boolean v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEnabled:Z

    xor-int/lit8 v5, v5, 0x1

    iput-boolean v5, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEnabled:Z

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->refreshAlpha()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_save
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->save()V

    const/4 v3, 0x0

    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mMode:I

    :cond_ret2
    const/4 v0, 0x1

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->radius()F

    move-result v3

    iget-object v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mBase:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mRing:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mDx:F

    add-float/2addr v0, v4

    iget v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mDy:F

    add-float/2addr v2, v4

    const v4, 0x3ec28f5c    # 0.38f

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mThumb:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-boolean v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEdit:Z

    if-eqz v4, :cond_noedit

    invoke-direct {p0, p1}, Lcom/dsemu/drastic/ui/AnalogStick;->drawEdit(Landroid/graphics/Canvas;)V

    :cond_noedit
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_done

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->applyPrefs()V

    :cond_done
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

    iget-boolean v0, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mEdit:Z

    if-eqz v0, :cond_game

    invoke-direct {p0, p1}, Lcom/dsemu/drastic/ui/AnalogStick;->onTouchEdit(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_game
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_release

    const/4 v2, 0x3

    if-eq v0, v2, :cond_release

    if-eqz v0, :cond_track

    const/4 v2, 0x2

    if-ne v0, v2, :cond_done

    :cond_track
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v6, v5

    sub-float/2addr v3, v6

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v6, v5

    sub-float/2addr v4, v6

    invoke-static {v3, v4}, Landroid/graphics/PointF;->length(FF)F

    move-result v5

    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->radius()F

    move-result v6

    const v7, 0x3f1eb852    # 0.62f

    mul-float/2addr v6, v7

    const v7, 0x3eb33333    # 0.35f

    mul-float/2addr v7, v6

    const/4 v8, 0x0

    cmpl-float v9, v5, v7

    if-lez v9, :cond_set_dirs

    const v9, 0x401a827a    # 2.4142135f

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v10

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v11

    mul-float v7, v9, v10

    cmpg-float v7, v11, v7

    if-gez v7, :cond_no_h

    const/4 v7, 0x0

    cmpl-float v7, v3, v7

    if-lez v7, :cond_left

    invoke-direct {p0, v1, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    const/4 v7, 0x3

    invoke-direct {p0, v7, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    goto :goto_v

    :cond_left
    const/4 v7, 0x3

    invoke-direct {p0, v7, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    invoke-direct {p0, v1, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    goto :goto_v

    :cond_no_h
    invoke-direct {p0, v1, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    const/4 v7, 0x3

    invoke-direct {p0, v7, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    :goto_v
    mul-float v7, v9, v11

    cmpg-float v7, v10, v7

    if-gez v7, :cond_no_v

    const/4 v7, 0x0

    cmpl-float v7, v4, v7

    if-lez v7, :cond_up

    const/4 v7, 0x2

    invoke-direct {p0, v7, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    invoke-direct {p0, v2, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    goto :goto_move

    :cond_up
    invoke-direct {p0, v2, v1}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    const/4 v7, 0x2

    invoke-direct {p0, v7, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    goto :goto_move

    :cond_no_v
    invoke-direct {p0, v2, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    const/4 v7, 0x2

    invoke-direct {p0, v7, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    goto :goto_move

    :cond_set_dirs
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->releaseAll()V

    :goto_move
    cmpl-float v7, v5, v6

    if-lez v7, :cond_noclamp

    div-float v7, v6, v5

    mul-float/2addr v3, v7

    mul-float/2addr v4, v7

    :cond_noclamp
    iput v3, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mDx:F

    iput v4, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mDy:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return v1

    :cond_release
    invoke-direct {p0}, Lcom/dsemu/drastic/ui/AnalogStick;->releaseAll()V

    const/4 v2, 0x0

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mDx:F

    iput v2, p0, Lcom/dsemu/drastic/ui/AnalogStick;->mDy:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_done
    return v1
.end method

.method private releaseAll()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lcom/dsemu/drastic/ui/AnalogStick;->setDir(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
