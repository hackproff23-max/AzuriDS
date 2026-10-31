.class public Lcom/dsemu/drastic/ui/AnalogStick;
.super Landroid/view/View;
.source "AnalogStick.java"


# instance fields
.field private mBase:Landroid/graphics/Paint;

.field private mDx:F

.field private mDy:F

.field private mGl:Lcom/dsemu/drastic/DraSticGlView;

.field private mRing:Landroid/graphics/Paint;

.field private mState:[Z

.field private mThumb:Landroid/graphics/Paint;


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

    return-void
.end method

.method public static attach(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 8

    new-instance v0, Lcom/dsemu/drastic/ui/AnalogStick;

    invoke-direct {v0, p0, p1}, Lcom/dsemu/drastic/ui/AnalogStick;-><init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;)V

    const v1, 0x3f19999a    # 0.6f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x43160000    # 150.0f

    mul-float/2addr v2, v1

    float-to-int v2, v2

    const/high16 v3, 0x41c00000    # 24.0f

    mul-float/2addr v3, v1

    float-to-int v3, v3

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x53

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {v4, v3, v3, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, v0, v4}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

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

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

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
