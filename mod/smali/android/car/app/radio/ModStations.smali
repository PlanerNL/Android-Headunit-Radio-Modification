.class public Landroid/car/app/radio/ModStations;
.super Ljava/lang/Object;
.source "ModStations.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/car/app/radio/ModStations$St;
    }
.end annotation


# static fields
.field static final C_ACCENT:I = -0xb36101

.field static final C_BG:I = -0xe9e4de

.field static final C_DANGER:I = -0x1aacb5

.field static final C_ROW:I = -0xe5e0d9

.field static final C_ROW_PRESSED:I = -0xdad3c9

.field static final C_STROKE:I = -0xd5cec4

.field static final C_TEXT:I = -0x1

.field static final C_TEXT2:I = -0x655b4e

.field static final KEY:Ljava/lang/String; = "list"

.field static final LOGO_DIR:Ljava/lang/String; = "RadioLogos"

.field static final PREFS:Ljava/lang/String; = "mod_stations"

.field static sCache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;"
        }
    .end annotation
.end field

.field static sLastKick:J

.field static final sLogos:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 66
    const/4 v0, 0x0

    sput-object v0, Landroid/car/app/radio/ModStations;->sCache:Ljava/util/List;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/car/app/radio/ModStations;->sLogos:Ljava/util/HashMap;

    .line 336
    const-wide/16 v0, 0x0

    sput-wide v0, Landroid/car/app/radio/ModStations;->sLastKick:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyLogo(Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 1

    .prologue
    .line 303
    instance-of v0, p0, Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .line 312
    :goto_0
    return-void

    .line 304
    :cond_0
    check-cast p0, Landroid/widget/ImageView;

    .line 305
    if-eqz p1, :cond_1

    .line 306
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 307
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 309
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 310
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method static badge(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 262
    const/high16 v0, 0x42300000    # 44.0f

    invoke-static {p0, v0}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v3

    .line 263
    invoke-static {p0, p1}, Landroid/car/app/radio/ModStations;->logo(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 264
    if-eqz v1, :cond_0

    .line 265
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 266
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 267
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 268
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 284
    :goto_0
    return-object v0

    .line 271
    :cond_0
    const-string v0, ""

    .line 272
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v4, "\\s+"

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    move v1, v2

    :goto_1
    if-ge v1, v5, :cond_2

    aget-object v6, v4, v1

    .line 273
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v7, v9, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 272
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 275
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    const-string v0, "?"

    .line 276
    :cond_3
    new-array v1, v9, [F

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v4

    rem-int/lit16 v4, v4, 0x168

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    int-to-float v4, v4

    aput v4, v1, v2

    const v2, 0x3ee66666    # 0.45f

    aput v2, v1, v8

    const/4 v2, 0x2

    const v4, 0x3f0ccccd    # 0.55f

    aput v4, v1, v2

    .line 277
    const/high16 v2, 0x41600000    # 14.0f

    const/4 v4, -0x1

    invoke-static {p0, v0, v2, v4, v8}, Landroid/car/app/radio/ModStations;->text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;

    move-result-object v0

    .line 278
    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 279
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 280
    invoke-virtual {v2, v8}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 281
    invoke-static {v1}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 282
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 283
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0
.end method

.method static button(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/high16 v7, 0x41900000    # 18.0f

    const/4 v6, 0x1

    .line 220
    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {p0, p1, v0, p2, v6}, Landroid/car/app/radio/ModStations;->text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;

    move-result-object v0

    .line 221
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 222
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {p0, v1}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {p0, v2}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    .line 223
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 224
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 225
    new-array v2, v6, [I

    const v3, 0x10100a7

    aput v3, v2, v8

    const v3, -0xdad3c9

    const v4, -0xb36101

    invoke-static {p0, v7}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v3, v4, v5}, Landroid/car/app/radio/ModStations;->round(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 226
    new-array v2, v8, [I

    const v3, -0xe5e0d9

    const v4, -0xd5cec4

    invoke-static {p0, v7}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {v3, v4, v5}, Landroid/car/app/radio/ModStations;->round(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 227
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 228
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setClickable(Z)V

    .line 229
    return-object v0
.end method

.method static copy(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 115
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/car/app/radio/ModStations$St;

    new-instance v3, Landroid/car/app/radio/ModStations$St;

    iget-object v4, v0, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    iget v0, v0, Landroid/car/app/radio/ModStations$St;->freq:I

    invoke-direct {v3, v4, v0}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 116
    :cond_0
    return-object v1
.end method

.method static currentFmFreq()I
    .locals 3

    .prologue
    const/4 v0, -0x1

    .line 161
    invoke-static {}, Landroid/car/app/radio/ModStations;->data()Landroid/car/radio/RadioDefine$RadioDataV1;

    move-result-object v1

    .line 162
    if-eqz v1, :cond_0

    iget-object v2, v1, Landroid/car/radio/RadioDefine$RadioDataV1;->mainFreq:Landroid/car/radio/RadioDefine$FreqInfo;

    if-nez v2, :cond_1

    .line 164
    :cond_0
    :goto_0
    return v0

    .line 163
    :cond_1
    iget-object v2, v1, Landroid/car/radio/RadioDefine$RadioDataV1;->mainFreq:Landroid/car/radio/RadioDefine$FreqInfo;

    iget v2, v2, Landroid/car/radio/RadioDefine$FreqInfo;->bandType:I

    invoke-static {v2}, Landroid/car/radio/RadioDefine;->isFmBand(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 164
    iget-object v0, v1, Landroid/car/radio/RadioDefine$RadioDataV1;->mainFreq:Landroid/car/radio/RadioDefine$FreqInfo;

    iget v0, v0, Landroid/car/radio/RadioDefine$FreqInfo;->freq:I

    goto :goto_0
.end method

.method static data()Landroid/car/radio/RadioDefine$RadioDataV1;
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 153
    :try_start_0
    invoke-static {}, Landroid/car/app/radio/manager/RadioManager;->access$getInstance$cp()Landroid/car/app/radio/manager/RadioManager;

    move-result-object v1

    .line 154
    if-nez v1, :cond_0

    .line 156
    :goto_0
    return-object v0

    .line 154
    :cond_0
    invoke-virtual {v1}, Landroid/car/app/radio/manager/RadioManager;->getRadioData()Landroid/car/radio/RadioDefine$RadioDataV1;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 155
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static defaults()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 79
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "NPO Radio 1"

    const/16 v3, 0x2670

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "NPO Radio 2"

    const/16 v3, 0x28dc

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "NPO 3FM"

    const/16 v3, 0x2594

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "Qmusic"

    const/16 v3, 0x2738

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "Sky Radio"

    const/16 v3, 0x2774

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "Radio 538"

    const/16 v3, 0x2814

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "Tukker FM"

    const/16 v3, 0x2328

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Landroid/car/app/radio/ModStations$St;

    const-string v2, "AA FM"

    const/16 v3, 0x2972

    invoke-direct {v1, v2, v3}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    return-object v0
.end method

.method static dp(Landroid/content/Context;F)I
    .locals 2

    .prologue
    .line 190
    const/4 v0, 0x1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {v0, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method static edit(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;ILjava/lang/String;I)V
    .locals 8

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 525
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 526
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 527
    const/high16 v0, 0x41a00000    # 20.0f

    invoke-static {p0, v0}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v0

    .line 528
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {p0, v2}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v0, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 529
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 530
    const-string v0, "Naam"

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 531
    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 532
    invoke-virtual {v2, p4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 533
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 534
    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 535
    const-string v0, "Frequentie, bijv. 102.60"

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 536
    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 537
    const/16 v0, 0x2002

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 538
    if-lez p5, :cond_0

    invoke-static {p5}, Landroid/car/app/radio/ModStations;->fmt(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 539
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 541
    new-instance v4, Landroid/app/AlertDialog$Builder;

    const/4 v0, 0x4

    invoke-direct {v4, p0, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 542
    if-gez p3, :cond_1

    const-string v0, "Zender toevoegen"

    :goto_1
    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 543
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Annuleren"

    .line 544
    invoke-virtual {v0, v1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Opslaan"

    .line 545
    invoke-virtual {v0, v1, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 546
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 547
    new-instance v0, Landroid/car/app/radio/ModStations$9;

    move-object v4, p0

    move v5, p3

    move-object v6, p1

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Landroid/car/app/radio/ModStations$9;-><init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/Activity;ILandroid/app/Dialog;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 575
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 576
    return-void

    .line 538
    :cond_0
    const-string v0, ""

    goto :goto_0

    .line 542
    :cond_1
    const-string v0, "Zender bewerken"

    goto :goto_1
.end method

.method static fill(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V
    .locals 16

    .prologue
    .line 449
    invoke-virtual/range {p2 .. p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 450
    invoke-static/range {p0 .. p0}, Landroid/car/app/radio/ModStations;->load(Landroid/content/Context;)Ljava/util/List;

    move-result-object v13

    .line 451
    invoke-static {}, Landroid/car/app/radio/ModStations;->currentFmFreq()I

    move-result v14

    .line 452
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 453
    const-string v1, "Nog geen zenders. Kies een zender en tik op \u201c+ Huidige zender\u201d."

    const/high16 v2, 0x41800000    # 16.0f

    const v3, -0x655b4e

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v1, v2, v3, v4}, Landroid/car/app/radio/ModStations;->text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;

    move-result-object v1

    .line 454
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 455
    const/4 v2, 0x0

    const/high16 v3, 0x41a00000    # 20.0f

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 456
    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 521
    :cond_0
    return-void

    .line 459
    :cond_1
    const/4 v5, 0x0

    :goto_0
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    if-ge v5, v1, :cond_0

    .line 461
    invoke-interface {v13, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/car/app/radio/ModStations$St;

    .line 462
    iget v1, v6, Landroid/car/app/radio/ModStations$St;->freq:I

    if-ne v1, v14, :cond_2

    const/4 v1, 0x1

    .line 464
    :goto_1
    new-instance v3, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 465
    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 466
    const/16 v2, 0x10

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 467
    const/high16 v2, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    .line 468
    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 469
    if-eqz v1, :cond_3

    const v2, -0xe9cfb1

    :goto_2
    const v4, -0xdad3c9

    move-object/from16 v0, p0

    invoke-static {v0, v2, v4}, Landroid/car/app/radio/ModStations;->pressable(Landroid/content/Context;II)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 470
    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 472
    iget-object v2, v6, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Landroid/car/app/radio/ModStations;->badge(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 474
    new-instance v2, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 475
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 476
    const/high16 v4, 0x41600000    # 14.0f

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v2, v4, v7, v8, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 477
    iget-object v4, v6, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    const/high16 v7, 0x41900000    # 18.0f

    if-eqz v1, :cond_4

    const v1, -0xb36101

    :goto_3
    const/4 v8, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v4, v7, v1, v8}, Landroid/car/app/radio/ModStations;->text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 478
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, v6, Landroid/car/app/radio/ModStations$St;->freq:I

    invoke-static {v4}, Landroid/car/app/radio/ModStations;->fmt(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " MHz"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/high16 v4, 0x41600000    # 14.0f

    const v7, -0x655b4e

    const/4 v8, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v1, v4, v7, v8}, Landroid/car/app/radio/ModStations;->text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 479
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v1, v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 481
    const-string v1, "Bewerk"

    const/4 v2, -0x1

    move-object/from16 v0, p0

    invoke-static {v0, v1, v2}, Landroid/car/app/radio/ModStations;->button(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    .line 482
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 483
    const-string v1, "Wis"

    const v2, -0x1aacb5

    move-object/from16 v0, p0

    invoke-static {v0, v1, v2}, Landroid/car/app/radio/ModStations;->button(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v15

    .line 484
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v4, -0x2

    invoke-direct {v1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 486
    const/high16 v2, 0x41000000    # 8.0f

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 487
    invoke-virtual {v3, v15, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 489
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v4, -0x2

    invoke-direct {v1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 491
    const/high16 v2, 0x41000000    # 8.0f

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 492
    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 494
    new-instance v1, Landroid/car/app/radio/ModStations$6;

    move-object/from16 v0, p1

    invoke-direct {v1, v6, v0}, Landroid/car/app/radio/ModStations$6;-><init>(Landroid/car/app/radio/ModStations$St;Landroid/app/Dialog;)V

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 500
    new-instance v1, Landroid/car/app/radio/ModStations$7;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-direct/range {v1 .. v6}, Landroid/car/app/radio/ModStations$7;-><init>(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;ILandroid/car/app/radio/ModStations$St;)V

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 503
    new-instance v7, Landroid/car/app/radio/ModStations$8;

    move-object/from16 v8, p0

    move-object v9, v6

    move v10, v5

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    invoke-direct/range {v7 .. v12}, Landroid/car/app/radio/ModStations$8;-><init>(Landroid/app/Activity;Landroid/car/app/radio/ModStations$St;ILandroid/app/Dialog;Landroid/widget/LinearLayout;)V

    invoke-virtual {v15, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 459
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 462
    :cond_2
    const/4 v1, 0x0

    goto/16 :goto_1

    .line 469
    :cond_3
    const v2, -0xe5e0d9

    goto/16 :goto_2

    .line 477
    :cond_4
    const/4 v1, -0x1

    goto/16 :goto_3
.end method

.method static fmt(I)Ljava/lang/String;
    .locals 5

    .prologue
    .line 136
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "%d.%02d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    div-int/lit8 v4, p0, 0x64

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    rem-int/lit8 v4, p0, 0x64

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static load(Landroid/content/Context;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 91
    sget-object v0, Landroid/car/app/radio/ModStations;->sCache:Ljava/util/List;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/car/app/radio/ModStations;->sCache:Ljava/util/List;

    invoke-static {v0}, Landroid/car/app/radio/ModStations;->copy(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 110
    :goto_0
    return-object v0

    .line 92
    :cond_0
    const-string v0, "mod_stations"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 93
    const-string v2, "list"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 94
    if-nez v2, :cond_1

    .line 95
    invoke-static {}, Landroid/car/app/radio/ModStations;->defaults()Ljava/util/List;

    move-result-object v0

    .line 96
    invoke-static {p0, v0}, Landroid/car/app/radio/ModStations;->save(Landroid/content/Context;Ljava/util/List;)V

    goto :goto_0

    .line 99
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 100
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    :goto_1
    if-ge v1, v3, :cond_3

    aget-object v4, v2, v1

    .line 101
    const/16 v5, 0x9

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 102
    if-gtz v5, :cond_2

    .line 100
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 104
    :cond_2
    :try_start_0
    new-instance v6, Landroid/car/app/radio/ModStations$St;

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v6, v7, v4}, Landroid/car/app/radio/ModStations$St;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 105
    :catch_0
    move-exception v4

    goto :goto_2

    .line 108
    :cond_3
    invoke-static {v0}, Landroid/car/app/radio/ModStations;->sort(Ljava/util/List;)V

    .line 109
    invoke-static {v0}, Landroid/car/app/radio/ModStations;->copy(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Landroid/car/app/radio/ModStations;->sCache:Ljava/util/List;

    goto :goto_0
.end method

.method static loadLogo(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 246
    const/4 v2, 0x4

    new-array v4, v2, [Ljava/lang/String;

    const-string v2, ".png"

    aput-object v2, v4, v0

    const/4 v2, 0x1

    const-string v3, ".jpg"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, ".jpeg"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, ".webp"

    aput-object v3, v4, v2

    .line 247
    array-length v5, v4

    move v3, v0

    :goto_0
    if-ge v3, v5, :cond_4

    aget-object v0, v4, v3

    .line 250
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "RadioLogos/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 251
    :try_start_1
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    .line 252
    if-eqz v0, :cond_1

    .line 255
    if-eqz v2, :cond_0

    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 258
    :cond_0
    :goto_1
    return-object v0

    .line 255
    :cond_1
    if-eqz v2, :cond_2

    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 247
    :cond_2
    :goto_2
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    .line 253
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 255
    :goto_3
    if-eqz v0, :cond_2

    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v0

    :goto_4
    if-eqz v1, :cond_3

    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4

    .line 256
    :cond_3
    :goto_5
    throw v0

    :cond_4
    move-object v0, v1

    .line 258
    goto :goto_1

    .line 255
    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_2

    :catch_4
    move-exception v1

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v1, v2

    goto :goto_4

    .line 253
    :catch_5
    move-exception v0

    move-object v0, v2

    goto :goto_3
.end method

.method static logo(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 238
    invoke-static {p1}, Landroid/car/app/radio/ModStations;->logoKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 239
    sget-object v0, Landroid/car/app/radio/ModStations;->sLogos:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/car/app/radio/ModStations;->sLogos:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 242
    :goto_0
    return-object v0

    .line 240
    :cond_0
    invoke-static {p0, v1}, Landroid/car/app/radio/ModStations;->loadLogo(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 241
    sget-object v2, Landroid/car/app/radio/ModStations;->sLogos:Ljava/util/HashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method static logoKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 233
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "[^a-z0-9]"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static mainLogo(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 326
    if-nez p0, :cond_1

    .line 332
    :cond_0
    :goto_0
    return-void

    .line 327
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    .line 328
    if-eqz v0, :cond_0

    .line 329
    const-string v1, "mod_main_logo"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1, p2}, Landroid/car/app/radio/ModStations;->resolveLogo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/car/app/radio/ModStations;->applyLogo(Landroid/view/View;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 330
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static onResume(Landroid/app/Activity;)V
    .locals 6

    .prologue
    .line 346
    :try_start_0
    invoke-static {}, Landroid/car/app/radio/manager/RadioManager;->access$getInstance$cp()Landroid/car/app/radio/manager/RadioManager;

    move-result-object v0

    .line 347
    if-nez v0, :cond_1

    .line 369
    :cond_0
    :goto_0
    return-void

    .line 348
    :cond_1
    invoke-virtual {v0}, Landroid/car/app/radio/manager/RadioManager;->getCurrentSource()I

    move-result v0

    const/high16 v1, 0x10000

    if-eq v0, v1, :cond_0

    .line 349
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 350
    sget-wide v2, Landroid/car/app/radio/ModStations;->sLastKick:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1388

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 351
    sput-wide v0, Landroid/car/app/radio/ModStations;->sLastKick:J

    .line 352
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 353
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "android.car.app.radio"

    const-string v3, "android.car.app.radio.RadioMain"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 354
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 355
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 356
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 357
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Landroid/car/app/radio/ModStations$3;

    invoke-direct {v2, v0}, Landroid/car/app/radio/ModStations$3;-><init>(Landroid/content/Context;)V

    const-wide/16 v4, 0x384

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 367
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static parseFreq(Ljava/lang/String;)I
    .locals 4

    .prologue
    .line 141
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2c

    const/16 v2, 0x2e

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 142
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    long-to-int v0, v0

    .line 143
    const/16 v1, 0x222e

    if-lt v0, v1, :cond_0

    const/16 v1, 0x2a30

    if-gt v0, v1, :cond_0

    .line 146
    :goto_0
    return v0

    .line 144
    :catch_0
    move-exception v0

    .line 146
    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static presetLogo(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 317
    if-nez p0, :cond_0

    .line 321
    :goto_0
    return-void

    .line 318
    :cond_0
    :try_start_0
    const-string v0, "mod_preset_logo"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1, p2}, Landroid/car/app/radio/ModStations;->resolveLogo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/car/app/radio/ModStations;->applyLogo(Landroid/view/View;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 319
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static pressable(Landroid/content/Context;II)Landroid/graphics/drawable/StateListDrawable;
    .locals 5

    .prologue
    const/high16 v4, 0x41200000    # 10.0f

    const/4 v3, 0x0

    .line 202
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 203
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    invoke-static {p0, v4}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p2, v3, v2}, Landroid/car/app/radio/ModStations;->round(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 204
    new-array v1, v3, [I

    invoke-static {p0, v4}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p1, v3, v2}, Landroid/car/app/radio/ModStations;->round(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 205
    return-object v0
.end method

.method static resolveLogo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5

    .prologue
    .line 291
    const/4 v1, 0x0

    .line 292
    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    invoke-static {p1}, Landroid/car/app/radio/ModStations;->parseFreq(Ljava/lang/String;)I

    move-result v2

    .line 293
    if-lez v2, :cond_3

    .line 294
    invoke-static {p0}, Landroid/car/app/radio/ModStations;->load(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/car/app/radio/ModStations$St;

    .line 295
    iget v4, v0, Landroid/car/app/radio/ModStations$St;->freq:I

    if-ne v4, v2, :cond_1

    iget-object v0, v0, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    invoke-static {p0, v0}, Landroid/car/app/radio/ModStations;->logo(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 298
    :goto_0
    if-nez v0, :cond_2

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    invoke-static {p0, p2}, Landroid/car/app/radio/ModStations;->logo(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 299
    :cond_2
    return-object v0

    :cond_3
    move-object v0, v1

    goto :goto_0
.end method

.method static round(III)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .prologue
    .line 194
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 195
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 196
    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 197
    if-eqz p1, :cond_0

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 198
    :cond_0
    return-object v0
.end method

.method static save(Landroid/content/Context;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    invoke-static {p1}, Landroid/car/app/radio/ModStations;->sort(Ljava/util/List;)V

    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/car/app/radio/ModStations$St;

    .line 123
    iget-object v3, v0, Landroid/car/app/radio/ModStations$St;->name:Ljava/lang/String;

    const-string v4, "\n"

    const-string v5, " "

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\t"

    const-string v5, " "

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x9

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v0, v0, Landroid/car/app/radio/ModStations$St;->freq:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 125
    :cond_0
    const-string v0, "mod_stations"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "list"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 126
    invoke-static {p1}, Landroid/car/app/radio/ModStations;->copy(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroid/car/app/radio/ModStations;->sCache:Ljava/util/List;

    .line 127
    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 375
    :try_start_0
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 376
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 378
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 379
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 380
    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {p0, v2}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v2

    .line 381
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 382
    const v2, -0xe9e4de

    const v3, -0xd5cec4

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {p0, v4}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {v2, v3, v4}, Landroid/car/app/radio/ModStations;->round(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 384
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 385
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 386
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 387
    const-string v3, "Bibliotheek"

    const/high16 v4, 0x41a00000    # 20.0f

    const/4 v5, -0x1

    const/4 v6, 0x1

    invoke-static {p0, v3, v4, v5, v6}, Landroid/car/app/radio/ModStations;->text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;

    move-result-object v3

    .line 388
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v4, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 389
    const-string v3, "+ Huidige zender"

    const v4, -0xb36101

    invoke-static {p0, v3, v4}, Landroid/car/app/radio/ModStations;->button(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    .line 390
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 391
    const-string v4, "Sluiten"

    const/4 v5, -0x1

    invoke-static {p0, v4, v5}, Landroid/car/app/radio/ModStations;->button(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    .line 392
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 394
    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {p0, v6}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 395
    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 396
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 398
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 399
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 400
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 401
    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 402
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 404
    const/high16 v7, 0x41400000    # 12.0f

    invoke-static {p0, v7}, Landroid/car/app/radio/ModStations;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 405
    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 407
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 408
    invoke-static {p0, v0, v5}, Landroid/car/app/radio/ModStations;->fill(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    .line 410
    new-instance v1, Landroid/car/app/radio/ModStations$4;

    invoke-direct {v1, v0}, Landroid/car/app/radio/ModStations$4;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 413
    new-instance v1, Landroid/car/app/radio/ModStations$5;

    invoke-direct {v1, p0, v0, v5}, Landroid/car/app/radio/ModStations$5;-><init>(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;)V

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 434
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 435
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 436
    if-eqz v0, :cond_0

    .line 437
    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 438
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 439
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const v3, 0x3f1eb852    # 0.62f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    const v3, 0x3f6147ae    # 0.88f

    mul-float/2addr v1, v3

    float-to-int v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/view/Window;->setLayout(II)V

    .line 440
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 441
    const v1, 0x3f19999a    # 0.6f

    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 446
    :cond_0
    :goto_0
    return-void

    .line 443
    :catch_0
    move-exception v0

    .line 444
    const-string v0, "Zenderlijst kon niet openen"

    invoke-static {p0, v0, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method static sort(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/car/app/radio/ModStations$St;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Landroid/car/app/radio/ModStations$1;

    invoke-direct {v0}, Landroid/car/app/radio/ModStations$1;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 133
    return-void
.end method

.method static text(Landroid/content/Context;Ljava/lang/String;FIZ)Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 209
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 210
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 212
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    if-eqz p4, :cond_0

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 214
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 215
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 216
    return-object v0
.end method

.method static tune(I)V
    .locals 6

    .prologue
    .line 169
    :try_start_0
    invoke-static {}, Landroid/car/app/radio/manager/RadioManager;->access$getInstance$cp()Landroid/car/app/radio/manager/RadioManager;

    move-result-object v1

    .line 170
    if-nez v1, :cond_0

    .line 185
    :goto_0
    return-void

    .line 171
    :cond_0
    invoke-virtual {v1}, Landroid/car/app/radio/manager/RadioManager;->getRadioData()Landroid/car/radio/RadioDefine$RadioDataV1;

    move-result-object v0

    .line 172
    if-eqz v0, :cond_1

    iget-object v2, v0, Landroid/car/radio/RadioDefine$RadioDataV1;->mainFreq:Landroid/car/radio/RadioDefine$FreqInfo;

    if-eqz v2, :cond_1

    iget-object v0, v0, Landroid/car/radio/RadioDefine$RadioDataV1;->mainFreq:Landroid/car/radio/RadioDefine$FreqInfo;

    iget v0, v0, Landroid/car/radio/RadioDefine$FreqInfo;->bandType:I

    invoke-static {v0}, Landroid/car/radio/RadioDefine;->isFmBand(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    .line 173
    :goto_1
    if-eqz v0, :cond_2

    .line 174
    invoke-virtual {v1, p0}, Landroid/car/app/radio/manager/RadioManager;->setRadioFreq(I)V

    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    goto :goto_0

    .line 172
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 176
    :cond_2
    invoke-virtual {v1}, Landroid/car/app/radio/manager/RadioManager;->switchToFm()V

    .line 177
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Landroid/car/app/radio/ModStations$2;

    invoke-direct {v2, v1, p0}, Landroid/car/app/radio/ModStations$2;-><init>(Landroid/car/app/radio/manager/RadioManager;I)V

    const-wide/16 v4, 0x258

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method
