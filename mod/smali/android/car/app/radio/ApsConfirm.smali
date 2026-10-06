.class public Landroid/car/app/radio/ApsConfirm;
.super Ljava/lang/Object;
.source "ApsConfirm.java"


# MOD: bevestigingsvenster voor "Zoek en sla op"
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static show(Landroid/car/app/radio/RadioMain;)V
    .locals 4

    if-eqz p0, :cond_end

    invoke-virtual {p0}, Landroid/car/app/radio/RadioMain;->getMRadioManager()Landroid/car/app/radio/manager/RadioManager;

    move-result-object v0

    if-eqz v0, :cond_end

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Zenders zoeken en opslaan?"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v2, "De radio zoekt alle zenders en slaat ze op vanaf P1, doorlopend over FM1, FM2 en FM3 (tot P18). De favorieten in alle drie de groepen worden overschreven, ongeacht in welke groep je nu zit."

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Landroid/car/app/radio/ApsConfirm$1;

    invoke-direct {v2, v0}, Landroid/car/app/radio/ApsConfirm$1;-><init>(Landroid/car/app/radio/manager/RadioManager;)V

    const-string v3, "Zoeken en opslaan"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v3, "Annuleren"

    const/4 v2, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_end
    return-void
.end method
