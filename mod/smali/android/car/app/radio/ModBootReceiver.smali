.class public Landroid/car/app/radio/ModBootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ModBootReceiver.java"

# MOD: na opstarten/ontwaken eigen radio-app weer naar voren halen


.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1


    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Landroid/car/app/radio/ModBootReceiver$1;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Landroid/car/app/radio/ModBootReceiver$1;-><init>(Landroid/content/Context;Landroid/content/BroadcastReceiver$PendingResult;)V

    const-wide/16 v4, 0xbb8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v3, Landroid/car/app/radio/ModBootReceiver$1;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Landroid/car/app/radio/ModBootReceiver$1;-><init>(Landroid/content/Context;Landroid/content/BroadcastReceiver$PendingResult;)V

    const-wide/16 v4, 0x1770

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v3, Landroid/car/app/radio/ModBootReceiver$1;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Landroid/car/app/radio/ModBootReceiver$1;-><init>(Landroid/content/Context;Landroid/content/BroadcastReceiver$PendingResult;)V

    const-wide/16 v4, 0x2710

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v3, Landroid/car/app/radio/ModBootReceiver$1;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Landroid/car/app/radio/ModBootReceiver$1;-><init>(Landroid/content/Context;Landroid/content/BroadcastReceiver$PendingResult;)V

    const-wide/16 v4, 0x3a98

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# MOD: ook dynamisch registreren (werkt als het proces de slaapstand overleeft)
.method public static register(Landroid/content/Context;)V
    .locals 4

    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.car.action.EXIT_SLEEP"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.car.action.ACC_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.car.action.CAR_BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v1, Landroid/car/app/radio/ModBootReceiver;

    invoke-direct {v1}, Landroid/car/app/radio/ModBootReceiver;-><init>()V

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
