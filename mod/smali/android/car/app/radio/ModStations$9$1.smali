.class Landroid/car/app/radio/ModStations$9$1;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations$9;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/car/app/radio/ModStations$9;


# direct methods
.method constructor <init>(Landroid/car/app/radio/ModStations$9;)V
    .locals 0

    .prologue
    .line 549
    iput-object p1, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .prologue
    .line 551
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$en:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 552
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$ef:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/car/app/radio/ModStations;->parseFreq(Ljava/lang/String;)I

    move-result v2

    .line 553
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 554
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$en:Landroid/widget/EditText;

    const-string v1, "Vul een naam in"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 571
    :goto_0
    return-void

    .line 557
    :cond_0
    if-gez v2, :cond_1

    .line 558
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$ef:Landroid/widget/EditText;

    const-string v1, "Tussen 87.50 en 108.00"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 561
    :cond_1
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$a:Landroid/app/Activity;

    invoke-static {v0}, Landroid/car/app/radio/ModStations;->load(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 562
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget v0, v0, Landroid/car/app/radio/ModStations$9;->val$idx:I

    if-ltz v0, :cond_2

    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget v0, v0, Landroid/car/app/radio/ModStations$9;->val$idx:I

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 563
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget v0, v0, Landroid/car/app/radio/ModStations$9;->val$idx:I

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/car/app/radio/ModStations$St;

    iput-object v1, v0, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    .line 564
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget v0, v0, Landroid/car/app/radio/ModStations$9;->val$idx:I

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/car/app/radio/ModStations$St;

    iput v2, v0, Landroid/car/app/radio/ModStations$St;->freq:I

    .line 568
    :goto_1
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$a:Landroid/app/Activity;

    invoke-static {v0, v3}, Landroid/car/app/radio/ModStations;->save(Landroid/content/Context;Ljava/util/List;)V

    .line 569
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v1, v1, Landroid/car/app/radio/ModStations$9;->val$d:Landroid/app/Dialog;

    iget-object v2, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v2, v2, Landroid/car/app/radio/ModStations$9;->val$list:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2}, Landroid/car/app/radio/ModStations;->fill(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    .line 570
    iget-object v0, p0, Landroid/car/app/radio/ModStations$9$1;->this$0:Landroid/car/app/radio/ModStations$9;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$9;->val$ad:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_0

    .line 566
    :cond_2
    new-instance v0, Landroid/car/app/radio/ModStations$St;

    invoke-direct {v0, v1, v2}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
