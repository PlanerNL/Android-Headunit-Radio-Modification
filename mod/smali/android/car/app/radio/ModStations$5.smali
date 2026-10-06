.class Landroid/car/app/radio/ModStations$5;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations;->show(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$d:Landroid/app/Dialog;

.field final synthetic val$list:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 413
    iput-object p1, p0, Landroid/car/app/radio/ModStations$5;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Landroid/car/app/radio/ModStations$5;->val$d:Landroid/app/Dialog;

    iput-object p3, p0, Landroid/car/app/radio/ModStations$5;->val$list:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .prologue
    .line 415
    invoke-static {}, Landroid/car/app/radio/ModStations;->currentFmFreq()I

    move-result v5

    .line 416
    if-gez v5, :cond_0

    .line 417
    iget-object v0, p0, Landroid/car/app/radio/ModStations$5;->val$a:Landroid/app/Activity;

    const-string v1, "Kies eerst een FM-zender"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 431
    :goto_0
    return-void

    .line 420
    :cond_0
    const-string v0, ""

    .line 421
    invoke-static {}, Landroid/car/app/radio/ModStations;->data()Landroid/car/radio/RadioDefine$RadioDataV1;

    move-result-object v1

    .line 422
    if-eqz v1, :cond_1

    iget-object v2, v1, Landroid/car/radio/RadioDefine$RadioDataV1;->psText:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v0, v1, Landroid/car/radio/RadioDefine$RadioDataV1;->psText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 423
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 425
    :try_start_0
    new-instance v1, Landroid/car/app/radio/utils/SaveStationNameUtil;

    iget-object v2, p0, Landroid/car/app/radio/ModStations$5;->val$a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/car/app/radio/utils/SaveStationNameUtil;-><init>(Landroid/content/Context;)V

    invoke-static {v5}, Landroid/car/app/radio/ModStations;->fmt(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/car/app/radio/utils/SaveStationNameUtil;->getStationName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 426
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_2
    move-object v4, v0

    .line 430
    :goto_1
    iget-object v0, p0, Landroid/car/app/radio/ModStations$5;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Landroid/car/app/radio/ModStations$5;->val$d:Landroid/app/Dialog;

    iget-object v2, p0, Landroid/car/app/radio/ModStations$5;->val$list:Landroid/widget/LinearLayout;

    const/4 v3, -0x1

    invoke-static/range {v0 .. v5}, Landroid/car/app/radio/ModStations;->edit(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;ILjava/lang/String;I)V

    goto :goto_0

    .line 427
    :catch_0
    move-exception v1

    move-object v4, v0

    goto :goto_1

    :cond_3
    move-object v4, v0

    goto :goto_1
.end method
