.class public Landroid/car/app/radio/ApsConfirm$1;
.super Ljava/lang/Object;
.source "ApsConfirm.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final rm:Landroid/car/app/radio/manager/RadioManager;


.method public constructor <init>(Landroid/car/app/radio/manager/RadioManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/car/app/radio/ApsConfirm$1;->rm:Landroid/car/app/radio/manager/RadioManager;

    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Landroid/car/app/radio/ApsConfirm$1;->rm:Landroid/car/app/radio/manager/RadioManager;

    invoke-virtual {v0}, Landroid/car/app/radio/manager/RadioManager;->btnLongAPS()V

    return-void
.end method
