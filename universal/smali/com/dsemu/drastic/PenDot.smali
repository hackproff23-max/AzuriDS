.class public Lcom/dsemu/drastic/PenDot;
.super Landroid/view/View;
.source "PenDot.java"


# instance fields
.field private mFill:Landroid/graphics/Paint;

.field private mPen:Lcom/dsemu/drastic/PenStick;

.field private mR:F

.field private mRing:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/dsemu/drastic/PenStick;)V
    .locals 5

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/dsemu/drastic/PenDot;->mPen:Lcom/dsemu/drastic/PenStick;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

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

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    iget-object v0, p0, Lcom/dsemu/drastic/PenDot;->mPen:Lcom/dsemu/drastic/PenStick;

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->calc()V

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->getSX()F

    move-result v1

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->getSY()F

    move-result v2

    const/4 v3, 0x0

    cmpg-float v3, v1, v3

    if-ltz v3, :cond_ret

    iget v3, p0, Lcom/dsemu/drastic/PenDot;->mR:F

    const/high16 v4, 0x3fc00000    # 1.5f

    mul-float/2addr v4, v3

    iget-object v5, p0, Lcom/dsemu/drastic/PenDot;->mRing:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lcom/dsemu/drastic/PenDot;->mFill:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_ret
    return-void
.end method
