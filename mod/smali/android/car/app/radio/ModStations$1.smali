.class Landroid/car/app/radio/ModStations$1;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations;->sort(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/car/app/radio/ModStations$St;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/car/app/radio/ModStations$St;Landroid/car/app/radio/ModStations$St;)I
    .locals 2

    .prologue
    .line 131
    iget v0, p1, Landroid/car/app/radio/ModStations$St;->freq:I

    iget v1, p2, Landroid/car/app/radio/ModStations$St;->freq:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 130
    check-cast p1, Landroid/car/app/radio/ModStations$St;

    check-cast p2, Landroid/car/app/radio/ModStations$St;

    invoke-virtual {p0, p1, p2}, Landroid/car/app/radio/ModStations$1;->compare(Landroid/car/app/radio/ModStations$St;Landroid/car/app/radio/ModStations$St;)I

    move-result v0

    return v0
.end method
