.class public Lcom/dsemu/drastic/PenDot;
.super Landroid/view/View;
.source "PenDot.java"


# instance fields
.field private mD:F

.field private mFill:Landroid/graphics/Paint;

.field private mLine:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mPen:Lcom/dsemu/drastic/PenStick;

.field private mR:F

.field private mRing:Landroid/graphics/Paint;

.field private mSx:F

.field private mSy:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/dsemu/drastic/PenStick;)V
    .locals 6

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/dsemu/drastic/PenDot;->mPen:Lcom/dsemu/drastic/PenStick;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/dsemu/drastic/PenDot;->mD:F

    const/high16 v1, 0x40400000    # 3.0f

    mul-float/2addr v1, v0

    iput v1, p0, Lcom/dsemu/drastic/PenDot;->mR:F

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    const/4 v3, 0x1

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v3}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v1, -0x1

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v4, p0, Lcom/dsemu/drastic/PenDot;->mRing:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v3}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v1, -0xddde

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v4, p0, Lcom/dsemu/drastic/PenDot;->mFill:Landroid/graphics/Paint;

    # contorno preto do cursor
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v3}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, -0x1000000

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v1, 0x3fc00000    # 1.5f

    mul-float/2addr v1, v0

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iput-object v4, p0, Lcom/dsemu/drastic/PenDot;->mLine:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    iput-object v4, p0, Lcom/dsemu/drastic/PenDot;->mPath:Landroid/graphics/Path;

    return-void
.end method

# lineTo em dp relativo a ponta do cursor
.method private lt(FF)V
    .locals 3

    iget v0, p0, Lcom/dsemu/drastic/PenDot;->mD:F

    mul-float/2addr p1, v0

    mul-float/2addr p2, v0

    iget v1, p0, Lcom/dsemu/drastic/PenDot;->mSx:F

    add-float/2addr p1, v1

    iget v1, p0, Lcom/dsemu/drastic/PenDot;->mSy:F

    add-float/2addr p2, v1

    iget-object v2, p0, Lcom/dsemu/drastic/PenDot;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Path;->lineTo(FF)V

    return-void
.end method


# virtual methods
# cursor em seta: branco = livre, vermelho = caneta encostada (arrastando)
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    iget-object v0, p0, Lcom/dsemu/drastic/PenDot;->mPen:Lcom/dsemu/drastic/PenStick;

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->calc()V

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->getSX()F

    move-result v1

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->getSY()F

    move-result v2

    const/4 v3, 0x0

    cmpg-float v3, v1, v3

    if-ltz v3, :cond_ret

    iput v1, p0, Lcom/dsemu/drastic/PenDot;->mSx:F

    iput v2, p0, Lcom/dsemu/drastic/PenDot;->mSy:F

    iget-object v3, p0, Lcom/dsemu/drastic/PenDot;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v4, 0x0

    const v5, 0x41880000    # 17.0f

    invoke-direct {p0, v4, v5}, Lcom/dsemu/drastic/PenDot;->lt(FF)V

    const/high16 v4, 0x40800000    # 4.0f

    const v5, 0x41533333    # 13.2f

    invoke-direct {p0, v4, v5}, Lcom/dsemu/drastic/PenDot;->lt(FF)V

    const/high16 v4, 0x40e00000    # 7.0f

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-direct {p0, v4, v5}, Lcom/dsemu/drastic/PenDot;->lt(FF)V

    const/high16 v4, 0x41180000    # 9.5f

    const/high16 v5, 0x41980000    # 19.0f

    invoke-direct {p0, v4, v5}, Lcom/dsemu/drastic/PenDot;->lt(FF)V

    const v4, 0x40d33333    # 6.6f

    const v5, 0x4149999a    # 12.6f

    invoke-direct {p0, v4, v5}, Lcom/dsemu/drastic/PenDot;->lt(FF)V

    const/high16 v4, 0x41400000    # 12.0f

    const v5, 0x4149999a    # 12.6f

    invoke-direct {p0, v4, v5}, Lcom/dsemu/drastic/PenDot;->lt(FF)V

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->isPressed()Z

    move-result v4

    if-eqz v4, :cond_idle

    iget-object v5, p0, Lcom/dsemu/drastic/PenDot;->mFill:Landroid/graphics/Paint;

    goto :cond_draw

    :cond_idle
    iget-object v5, p0, Lcom/dsemu/drastic/PenDot;->mRing:Landroid/graphics/Paint;

    :cond_draw
    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v5, p0, Lcom/dsemu/drastic/PenDot;->mLine:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_ret
    return-void
.end method
