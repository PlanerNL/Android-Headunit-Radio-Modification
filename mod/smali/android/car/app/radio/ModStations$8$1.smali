.class Landroid/car/app/radio/ModStations$8$1;
.super Ljava/lang/Object;
.source "ModStations.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/car/app/radio/ModStations$8;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/car/app/radio/ModStations$8;


# direct methods
.method constructor <init>(Landroid/car/app/radio/ModStations$8;)V
    .locals 0

    .prologue
    .line 509
    iput-object p1, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .prologue
    .line 511
    iget-object v0, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$8;->val$a:Landroid/app/Activity;

    invoke-static {v0}, Landroid/car/app/radio/ModStations;->load(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 512
    iget-object v1, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget v1, v1, Landroid/car/app/radio/ModStations$8;->val$idx:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v1, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget v1, v1, Landroid/car/app/radio/ModStations$8;->val$idx:I

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 513
    :cond_0
    iget-object v1, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget-object v1, v1, Landroid/car/app/radio/ModStations$8;->val$a:Landroid/app/Activity;

    invoke-static {v1, v0}, Landroid/car/app/radio/ModStations;->save(Landroid/content/Context;Ljava/util/List;)V

    .line 514
    iget-object v0, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget-object v0, v0, Landroid/car/app/radio/ModStations$8;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget-object v1, v1, Landroid/car/app/radio/ModStations$8;->val$d:Landroid/app/Dialog;

    iget-object v2, p0, Landroid/car/app/radio/ModStations$8$1;->this$0:Landroid/car/app/radio/ModStations$8;

    iget-object v2, v2, Landroid/car/app/radio/ModStations$8;->val$list:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2}, Landroid/car/app/radio/ModStations;->fill(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    .line 515
    return-void
.end method
