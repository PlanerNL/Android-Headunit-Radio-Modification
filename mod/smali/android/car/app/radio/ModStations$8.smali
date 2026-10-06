.class Landroid/car/app/radio/ModStations$8;
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
.method constructor <init>(Landroid/app/Activity;Landroid/car/app/radio/ModStations$St;ILandroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 503
    iput-object p1, p0, Landroid/car/app/radio/ModStations$8;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Landroid/car/app/radio/ModStations$8;->val$s:Landroid/car/app/radio/ModStations$St;

    iput p3, p0, Landroid/car/app/radio/ModStations$8;->val$idx:I

    iput-object p4, p0, Landroid/car/app/radio/ModStations$8;->val$d:Landroid/app/Dialog;

    iput-object p5, p0, Landroid/car/app/radio/ModStations$8;->val$list:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 505
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Landroid/car/app/radio/ModStations$8;->val$a:Landroid/app/Activity;

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const-string v1, "Zender verwijderen?"

    .line 506
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Landroid/car/app/radio/ModStations$8;->val$s:Landroid/car/app/radio/ModStations$St;

    iget-object v2, v2, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/car/app/radio/ModStations$8;->val$s:Landroid/car/app/radio/ModStations$St;

    iget v2, v2, Landroid/car/app/radio/ModStations$St;->freq:I

    .line 507
    invoke-static {v2}, Landroid/car/app/radio/ModStations;->fmt(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MHz) wordt uit de lijst gehaald."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Annuleren"

    const/4 v2, 0x0

    .line 508
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Verwijderen"

    new-instance v2, Landroid/car/app/radio/ModStations$8$1;

    invoke-direct {v2, p0}, Landroid/car/app/radio/ModStations$8$1;-><init>(Landroid/car/app/radio/ModStations$8;)V

    .line 509
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 517
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 518
    return-void
.end method
