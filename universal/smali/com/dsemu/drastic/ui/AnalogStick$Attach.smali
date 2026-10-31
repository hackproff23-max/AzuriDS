.class Lcom/dsemu/drastic/ui/AnalogStick$Attach;
.super Ljava/lang/Object;
.source "AnalogStick.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dsemu/drastic/ui/AnalogStick$Attach;->a:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/dsemu/drastic/ui/AnalogStick$Attach;->a:Landroid/app/Activity;

    invoke-static {v0}, Lcom/dsemu/drastic/ui/AnalogStick;->attachEditor(Landroid/app/Activity;)V

    return-void
.end method
