.class public Lcom/dsemu/drastic/PenStick;
.super Landroid/view/View;
.source "PenStick.java"


# instance fields
.field private mBase:Landroid/graphics/Paint;

.field private mDown:Z

.field private mDx:F

.field private mDy:F

.field private mGl:Lcom/dsemu/drastic/DraSticGlView;

.field private mHandler:Landroid/os/Handler;

.field private mPx:F

.field private mPy:F

.field private mRing:Landroid/graphics/Paint;

.field private mThumb:Landroid/graphics/Paint;

.field private mTick:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 6

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/dsemu/drastic/PenStick;->mGl:Lcom/dsemu/drastic/DraSticGlView;

    const/high16 v0, 0x43000000    # 128.0f

    iput v0, p0, Lcom/dsemu/drastic/PenStick;->mPx:F

    const/high16 v0, 0x42c00000    # 96.0f

    iput v0, p0, Lcom/dsemu/drastic/PenStick;->mPy:F

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/dsemu/drastic/PenStick;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/dsemu/drastic/PenStick$Tick;

    invoke-direct {v0, p0}, Lcom/dsemu/drastic/PenStick$Tick;-><init>(Lcom/dsemu/drastic/PenStick;)V

    iput-object v0, p0, Lcom/dsemu/drastic/PenStick;->mTick:Ljava/lang/Runnable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/4 v1, 0x1

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v5, 0x66224488

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v4, p0, Lcom/dsemu/drastic/PenStick;->mBase:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v5, -0x55000001

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v5, 0x40400000    # 3.0f

    mul-float/2addr v5, v0

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iput-object v4, p0, Lcom/dsemu/drastic/PenStick;->mRing:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v5, -0x33000001

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v4, p0, Lcom/dsemu/drastic/PenStick;->mThumb:Landroid/graphics/Paint;

    return-void
.end method

.method public static attach(Landroid/app/Activity;Lcom/dsemu/drastic/DraSticGlView;)V
    .locals 6

    new-instance v0, Lcom/dsemu/drastic/PenStick;

    invoke-direct {v0, p0, p1}, Lcom/dsemu/drastic/PenStick;-><init>(Landroid/content/Context;Lcom/dsemu/drastic/DraSticGlView;)V

    const v1, 0x3f19999a    # 0.6f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42f00000    # 120.0f

    mul-float/2addr v2, v1

    float-to-int v2, v2

    const/high16 v3, 0x41c00000    # 24.0f

    mul-float/2addr v3, v1

    float-to-int v3, v3

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v5, 0x33

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v3, v5, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, v0, v4}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private static dz(F)F
    .locals 3

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3e19999a    # 0.15f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_pass

    const/4 v0, 0x0

    return v0

    :cond_pass
    return p0
.end method

.method private ni()Ln0/i;
    .locals 1

    iget-object v0, p0, Lcom/dsemu/drastic/PenStick;->mGl:Lcom/dsemu/drastic/DraSticGlView;

    if-eqz v0, :cond_null

    invoke-static {v0}, Lcom/dsemu/drastic/DraSticGlView;->E(Lcom/dsemu/drastic/DraSticGlView;)Ln0/i;

    move-result-object v0

    return-object v0

    :cond_null
    const/4 v0, 0x0

    return-object v0
.end method

.method private push()V
    .locals 4

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->ni()Ln0/i;

    move-result-object v0

    if-eqz v0, :cond_ret

    iget v1, p0, Lcom/dsemu/drastic/PenStick;->mPx:F

    float-to-int v1, v1

    iget v2, p0, Lcom/dsemu/drastic/PenStick;->mPy:F

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Ln0/i;->penDown(II)V

    :cond_ret
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

.method private track(Landroid/view/MotionEvent;)V
    .locals 8

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    sub-float/2addr v1, v3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Landroid/graphics/PointF;->length(FF)F

    move-result v3

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->radius()F

    move-result v5

    const v6, 0x3f1eb852    # 0.62f

    mul-float/2addr v5, v6

    cmpl-float v6, v3, v5

    if-lez v6, :cond_ok

    div-float v6, v5, v3

    mul-float/2addr v1, v6

    mul-float/2addr v2, v6

    :cond_ok
    iput v1, p0, Lcom/dsemu/drastic/PenStick;->mDx:F

    iput v2, p0, Lcom/dsemu/drastic/PenStick;->mDy:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

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

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->radius()F

    move-result v3

    iget-object v4, p0, Lcom/dsemu/drastic/PenStick;->mBase:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v4, p0, Lcom/dsemu/drastic/PenStick;->mRing:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v4, p0, Lcom/dsemu/drastic/PenStick;->mDx:F

    add-float/2addr v0, v4

    iget v4, p0, Lcom/dsemu/drastic/PenStick;->mDy:F

    add-float/2addr v2, v4

    const v4, 0x3ec28f5c    # 0.38f

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/dsemu/drastic/PenStick;->mThumb:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_down

    const/4 v1, 0x2

    if-eq v0, v1, :cond_move

    const/4 v1, 0x1

    if-eq v0, v1, :cond_up

    const/4 v1, 0x3

    if-eq v0, v1, :cond_up

    goto :cond_ret

    :cond_down
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/dsemu/drastic/PenStick;->mDown:Z

    invoke-direct {p0, p1}, Lcom/dsemu/drastic/PenStick;->track(Landroid/view/MotionEvent;)V

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->push()V

    iget-object v2, p0, Lcom/dsemu/drastic/PenStick;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/dsemu/drastic/PenStick;->mTick:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/16 v4, 0x10

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :cond_ret

    :cond_move
    invoke-direct {p0, p1}, Lcom/dsemu/drastic/PenStick;->track(Landroid/view/MotionEvent;)V

    goto :cond_ret

    :cond_up
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/dsemu/drastic/PenStick;->mDown:Z

    iget-object v2, p0, Lcom/dsemu/drastic/PenStick;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/dsemu/drastic/PenStick;->mTick:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/dsemu/drastic/PenStick;->mDx:F

    iput v1, p0, Lcom/dsemu/drastic/PenStick;->mDy:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->ni()Ln0/i;

    move-result-object v2

    if-eqz v2, :cond_ret

    invoke-virtual {v2}, Ln0/i;->penUp()V

    :cond_ret
    const/4 v0, 0x1

    return v0
.end method

.method public tick()V
    .locals 10

    iget-boolean v0, p0, Lcom/dsemu/drastic/PenStick;->mDown:Z

    if-eqz v0, :cond_ret

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->radius()F

    move-result v1

    const v2, 0x3f1eb852    # 0.62f

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/dsemu/drastic/PenStick;->mDx:F

    div-float/2addr v2, v1

    invoke-static {v2}, Lcom/dsemu/drastic/PenStick;->dz(F)F

    move-result v2

    iget v3, p0, Lcom/dsemu/drastic/PenStick;->mDy:F

    div-float/2addr v3, v1

    invoke-static {v3}, Lcom/dsemu/drastic/PenStick;->dz(F)F

    move-result v3

    const/high16 v4, 0x40900000    # 4.5f

    mul-float/2addr v2, v4

    mul-float/2addr v3, v4

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->ni()Ln0/i;

    move-result-object v4

    if-eqz v4, :cond_resched

    invoke-virtual {v4}, Ln0/i;->penOrient()I

    move-result v5

    const/4 v6, 0x5

    if-ne v5, v6, :cond_n6

    neg-float v7, v3

    move v8, v2

    goto :cond_apply

    :cond_n6
    const/4 v6, 0x6

    if-ne v5, v6, :cond_n0

    move v7, v3

    neg-float v8, v2

    goto :cond_apply

    :cond_n0
    move v7, v2

    move v8, v3

    :cond_apply
    iget v6, p0, Lcom/dsemu/drastic/PenStick;->mPx:F

    add-float/2addr v6, v7

    const/4 v7, 0x0

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/high16 v7, 0x437f0000    # 255.0f

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    iput v6, p0, Lcom/dsemu/drastic/PenStick;->mPx:F

    iget v6, p0, Lcom/dsemu/drastic/PenStick;->mPy:F

    add-float/2addr v6, v8

    const/4 v7, 0x0

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    const/high16 v7, 0x433f0000    # 191.0f

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v6

    iput v6, p0, Lcom/dsemu/drastic/PenStick;->mPy:F

    invoke-direct {p0}, Lcom/dsemu/drastic/PenStick;->push()V

    :cond_resched
    iget-object v0, p0, Lcom/dsemu/drastic/PenStick;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/dsemu/drastic/PenStick;->mTick:Ljava/lang/Runnable;

    const-wide/16 v2, 0x10

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_ret
    return-void
.end method
