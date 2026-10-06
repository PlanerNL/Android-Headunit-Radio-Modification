.class Landroid/car/app/radio/ModStations$9;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations;->edit(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;ILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$ad:Landroid/app/AlertDialog;

.field final synthetic val$d:Landroid/app/Dialog;

.field final synthetic val$ef:Landroid/widget/EditText;

.field final synthetic val$en:Landroid/widget/EditText;

.field final synthetic val$idx:I

.field final synthetic val$list:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/Activity;ILandroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 547
    iput-object p1, p0, Landroid/car/app/radio/ModStations$9;->val$ad:Landroid/app/AlertDialog;

    iput-object p2, p0, Landroid/car/app/radio/ModStations$9;->val$en:Landroid/widget/EditText;

    iput-object p3, p0, Landroid/car/app/radio/ModStations$9;->val$ef:Landroid/widget/EditText;

    iput-object p4, p0, Landroid/car/app/radio/ModStations$9;->val$a:Landroid/app/Activity;

    iput p5, p0, Landroid/car/app/radio/ModStations$9;->val$idx:I

    iput-object p6, p0, Landroid/car/app/radio/ModStations$9;->val$d:Landroid/app/Dialog;

    iput-object p7, p0, Landroid/car/app/radio/ModStations$9;->val$list:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2

    .prologue
    .line 549
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9;->val$ad:Landroid/app/AlertDialog;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Landroid/car/app/radio/ModStations$9$1;

    invoke-direct {v1, p0}, Landroid/car/app/radio/ModStations$9$1;-><init>(Landroid/car/app/radio/ModStations$9;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 573
    return-void
.end method
