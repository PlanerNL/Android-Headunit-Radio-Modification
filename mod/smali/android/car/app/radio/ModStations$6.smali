.class Landroid/car/app/radio/ModStations$6;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations;->fill(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$d:Landroid/app/Dialog;

.field final synthetic val$s:Landroid/car/app/radio/ModStations$St;


# direct methods
.method constructor <init>(Landroid/car/app/radio/ModStations$St;Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 494
    iput-object p1, p0, Landroid/car/app/radio/ModStations$6;->val$s:Landroid/car/app/radio/ModStations$St;

    iput-object p2, p0, Landroid/car/app/radio/ModStations$6;->val$d:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 496
    iget-object v0, p0, Landroid/car/app/radio/ModStations$6;->val$s:Landroid/car/app/radio/ModStations$St;

    iget v0, v0, Landroid/car/app/radio/ModStations$St;->freq:I

    invoke-static {v0}, Landroid/car/app/radio/ModStations;->tune(I)V

    .line 497
    iget-object v0, p0, Landroid/car/app/radio/ModStations$6;->val$d:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 498
    return-void
.end method
