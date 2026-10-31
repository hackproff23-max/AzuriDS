.class Lcom/dsemu/drastic/PenStick$Tick;
.super Ljava/lang/Object;
.source "PenStick.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final a:Lcom/dsemu/drastic/PenStick;


# direct methods
.method constructor <init>(Lcom/dsemu/drastic/PenStick;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dsemu/drastic/PenStick$Tick;->a:Lcom/dsemu/drastic/PenStick;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/dsemu/drastic/PenStick$Tick;->a:Lcom/dsemu/drastic/PenStick;

    invoke-virtual {v0}, Lcom/dsemu/drastic/PenStick;->tick()V

    return-void
.end method
