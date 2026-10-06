.class Landroid/car/app/radio/ModStations$St;
.super Ljava/lang/Object;
.source "ModStations.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/car/app/radio/ModStations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "St"
.end annotation


# instance fields
.field freq:I

.field name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    iput p2, p0, Landroid/car/app/radio/ModStations$St;->freq:I

    return-void
.end method
