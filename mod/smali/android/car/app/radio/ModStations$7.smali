.class Landroid/car/app/radio/ModStations$7;
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
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$d:Landroid/app/Dialog;

.field final synthetic val$idx:I

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$s:Landroid/car/app/radio/ModStations$St;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;ILandroid/car/app/radio/ModStations$St;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 500
    iput-object p1, p0, Landroid/car/app/radio/ModStations$7;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Landroid/car/app/radio/ModStations$7;->val$d:Landroid/app/Dialog;

    iput-object p3, p0, Landroid/car/app/radio/ModStations$7;->val$list:Landroid/widget/LinearLayout;

    iput p4, p0, Landroid/car/app/radio/ModStations$7;->val$idx:I

    iput-object p5, p0, Landroid/car/app/radio/ModStations$7;->val$s:Landroid/car/app/radio/ModStations$St;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .prologue
    .line 501
    iget-object v0, p0, Landroid/car/app/radio/ModStations$7;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Landroid/car/app/radio/ModStations$7;->val$d:Landroid/app/Dialog;

    iget-object v2, p0, Landroid/car/app/radio/ModStations$7;->val$list:Landroid/widget/LinearLayout;

    iget v3, p0, Landroid/car/app/radio/ModStations$7;->val$idx:I

    iget-object v4, p0, Landroid/car/app/radio/ModStations$7;->val$s:Landroid/car/app/radio/ModStations$St;

    iget-object v4, v4, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    iget-object v5, p0, Landroid/car/app/radio/ModStations$7;->val$s:Landroid/car/app/radio/ModStations$St;

    iget v5, v5, Landroid/car/app/radio/ModStations$St;->freq:I

    invoke-static/range {v0 .. v5}, Landroid/car/app/radio/ModStations;->edit(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;ILjava/lang/String;I)V

    return-void
.end method
