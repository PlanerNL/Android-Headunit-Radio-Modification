.class public Landroid/car/app/radio/ModBootReceiver$1;
.super Ljava/lang/Object;
.source "ModBootReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final pr:Landroid/content/BroadcastReceiver$PendingResult;


.method public constructor <init>(Landroid/content/Context;Landroid/content/BroadcastReceiver$PendingResult;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/car/app/radio/ModBootReceiver$1;->ctx:Landroid/content/Context;

    iput-object p2, p0, Landroid/car/app/radio/ModBootReceiver$1;->pr:Landroid/content/BroadcastReceiver$PendingResult;

    return-void
.end method

.method public run()V
    .locals 4

    :try_start_0
    invoke-static {}, Landroid/car/app/radio/manager/RadioManager;->access$getInstance$cp()Landroid/car/app/radio/manager/RadioManager;

    move-result-object v0

    if-eqz v0, :cond_done

    invoke-virtual {v0}, Landroid/car/app/radio/manager/RadioManager;->getCurrentSource()I

    move-result v1


    const/high16 v2, 0x10000

    if-ne v1, v2, :cond_done

    # MOD: alleen ingrijpen als de originele radio-app op de voorgrond staat
    invoke-virtual {v0}, Landroid/car/app/radio/manager/RadioManager;->getDataManager()Landroid/car/base/CarDataManager;

    move-result-object v1

    if-eqz v1, :mod_go

    const-string v2, "state.app.cur_app_pack"

    invoke-virtual {v1, v2}, Landroid/car/base/CarDataManager;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :mod_go

    const-string v2, "android.car.app.radio"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_done

    :mod_go
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Landroid/car/app/radio/ModBootReceiver$1;->ctx:Landroid/content/Context;

    const-class v3, Landroid/car/app/radio/RadioMain;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :cond_done

    :catch_0
    move-exception v0


    :cond_done
    iget-object v0, p0, Landroid/car/app/radio/ModBootReceiver$1;->pr:Landroid/content/BroadcastReceiver$PendingResult;

    if-eqz v0, :cond_end

    invoke-virtual {v0}, Landroid/content/BroadcastReceiver$PendingResult;->finish()V

    :cond_end
    return-void
.end method
