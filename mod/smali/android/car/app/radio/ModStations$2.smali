.class Landroid/car/app/radio/ModStations$2;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations;->tune(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$freq:I

.field final synthetic val$rm:Landroid/car/app/radio/manager/RadioManager;


# direct methods
.method constructor <init>(Landroid/car/app/radio/manager/RadioManager;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 177
    iput-object p1, p0, Landroid/car/app/radio/ModStations$2;->val$rm:Landroid/car/app/radio/manager/RadioManager;

    iput p2, p0, Landroid/car/app/radio/ModStations$2;->val$freq:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 179
    :try_start_0
    iget-object v0, p0, Landroid/car/app/radio/ModStations$2;->val$rm:Landroid/car/app/radio/manager/RadioManager;

    iget v1, p0, Landroid/car/app/radio/ModStations$2;->val$freq:I

    invoke-virtual {v0, v1}, Landroid/car/app/radio/manager/RadioManager;->setRadioFreq(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    goto :goto_0
.end method
