#!/usr/bin/env python3
"""Past de nieuwe radio-UI toe op een met apktool uitgepakte map.
Gebruik:  python3 apply_mod.py radio_src
Er wordt pas iets geschreven als alle controles slagen."""
import os, re, shutil, sys

MODFLAGS = '\n# MOD: indicatoren altijd zichtbaar, duidelijk aan of uit\n.method private modFlags(Landroid/car/radio/RadioDefine$RadioDataV1;)V\n    .locals 5\n\n    if-eqz p1, :mod_f_end\n\n    :try_start_0\n    invoke-virtual {p0}, Landroid/car/app/radio/UI2UiControl;->getWindow()Landroid/view/Window;\n\n    move-result-object v0\n\n    if-eqz v0, :mod_f_end\n\n    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;\n\n    move-result-object v0\n\n    if-eqz v0, :mod_f_end\n\n    iget-boolean v1, p0, Landroid/car/app/radio/UI2UiControl;->mIsFm:Z\n\n    const-string v2, "mod_ind_st"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_0\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->stOn:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_0\n    const-string v2, "mod_ind_ring"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_1\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->stOn:Z\n\n    and-int/2addr v3, v4\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->stSignal:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_1\n    const-string v2, "mod_ind_loc"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_2\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->locOn:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_2\n    const-string v2, "mod_ind_tp"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_3\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->tpSignal:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_3\n    const-string v2, "mod_ind_ta"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_4\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->taOn:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_4\n    const-string v2, "mod_ind_af"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_5\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->afOn:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_5\n    const-string v2, "mod_ind_pty"\n\n    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;\n\n    move-result-object v2\n\n    if-eqz v2, :mod_f_6\n\n    move v3, v1\n\n    iget-boolean v4, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->ptyOn:Z\n\n    and-int/2addr v3, v4\n\n    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V\n\n    :mod_f_6\n    :try_end_0\n    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :mod_f_end\n\n    :mod_f_end\n    return-void\n.end method\n'

ARGS = [a for a in sys.argv[1:] if not a.startswith("--")]
RANDTEST = "--randtest" in sys.argv
def _opt(name, default):
    for x in sys.argv[1:]:
        if x.startswith("--" + name + "="):
            return x.split("=", 1)[1]
    return default
NEW_PKG = _opt("package", "nl.planernl.radiomod")
NEW_NAME = _opt("name", "Radio Mod")
ORIG_PKG = "android.car.app.radio"
SRC = ARGS[0] if ARGS else "radio_src"
KIT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "mod")
UI2 = os.path.join(SRC, "smali/android/car/app/radio/UI2UiControl.smali")
SUBFREQ = os.path.join(SRC, "res/layout/ui2_subfreq.xml")

def fail(msg):
    print("FOUT:", msg); print("Er is niets aangepast."); sys.exit(1)

for p in (UI2, SUBFREQ, os.path.join(SRC, "apktool.yml")):
    if not os.path.exists(p):
        fail(f"{p} niet gevonden. Klopt de mapnaam?")

smali = open(UI2, encoding="utf-8").read()

# 1) setSubFreq: altijd naam + frequentie tonen
SUB_DONE = "# MOD: naam en frequentie op favorieten" in smali
if not SUB_DONE:
    m = re.search(r"\.method private final setSubFreq\(III\)V.*?\.end method", smali, re.S)
    if not m: fail("methode setSubFreq niet gevonden")
    body = m.group(0)
    start = body.find("iget-boolean p3, p0, Landroid/car/app/radio/UI2UiControl;->mRdsInfoVisible:Z")
    endtok = "invoke-virtual {p1, p3}, Landroid/car/app/radio/SubFreqLayout;->setFreqText1(Ljava/lang/String;)V"
    end = body.rfind(endtok)
    if start < 0 or end < 0: fail("onverwachte inhoud in setSubFreq")
    new = """# MOD: naam en frequentie op favorieten
    iget-object p3, p0, Landroid/car/app/radio/UI2UiControl;->mStationNameUtil:Landroid/car/app/radio/utils/SaveStationNameUtil;

    invoke-virtual {p3, p1}, Landroid/car/app/radio/utils/SaveStationNameUtil;->getStationName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :mod_name_ok

    const-string p3, ""

    :mod_name_ok
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    iget-object v0, p0, Landroid/car/app/radio/UI2UiControl;->mSubFreqArr:[Landroid/car/app/radio/SubFreqLayout;

    aget-object v0, v0, p2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Landroid/car/app/radio/SubFreqLayout;->setFreqText1(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Landroid/car/app/radio/SubFreqLayout;->setFreqName(Ljava/lang/String;)V"""
    body2 = body[:start] + new + body[end + len(endtok):]
    smali = smali.replace(body, body2)

# 2) Zoek en sla op: eerst bevestigen
APS_DONE = "Landroid/car/app/radio/ApsConfirm;->show" in smali
if not APS_DONE:
    pat = re.compile(
        r"iget-object p0, p0, Landroid/car/app/radio/UI2UiControl;->mRadioMain:Landroid/car/app/radio/RadioMain;\s+"
        r"invoke-virtual \{p0\}, Landroid/car/app/radio/RadioMain;->getMRadioManager\(\)Landroid/car/app/radio/manager/RadioManager;\s+"
        r"move-result-object p0\s+"
        r"invoke-static \{p0\}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull\(Ljava/lang/Object;\)V\s+"
        r"invoke-virtual \{p0\}, Landroid/car/app/radio/manager/RadioManager;->btnLongAPS\(\)V")
    hits = pat.findall(smali)
    if len(hits) != 1: fail(f"APS-aanroep niet eenduidig gevonden ({len(hits)}x)")
    smali = pat.sub("""# MOD: eerst bevestigen
    iget-object p0, p0, Landroid/car/app/radio/UI2UiControl;->mRadioMain:Landroid/car/app/radio/RadioMain;

    invoke-static {p0}, Landroid/car/app/radio/ApsConfirm;->show(Landroid/car/app/radio/RadioMain;)V""", smali)

# 3) Klein label boven de zendernaam: frequentie i.p.v. zendernaam
LBL_DONE = "modFreqLabel" in smali
if not LBL_DONE:
    m = re.search(r"\.method private final showMainFreq\(ZI\)V.*?\.end method", smali, re.S)
    if not m or not m.group(0).endswith("    return-void\n.end method"):
        fail("methode showMainFreq niet gevonden of onverwacht")
    body = m.group(0)
    body2 = body[:-len("    return-void\n.end method")] + "    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modFreqLabel()V\n\n    return-void\n.end method"
    smali = smali.replace(body, body2)
    C = "Landroid/car/app/radio/UI2UiControl;"
    smali += """

# MOD: klein label toont de frequentie als de grote tekst de zendernaam is
.method private modFreqLabel()V
    .locals 4

    iget-object v0, p0, %(C)s->mRdsPsName:Landroid/widget/TextView;

    if-eqz v0, :mod_end

    iget-object v1, p0, %(C)s->mMainFreqStr:Ljava/lang/String;

    if-eqz v1, :mod_end

    iget-object v2, p0, %(C)s->mStationNameUtil:Landroid/car/app/radio/utils/SaveStationNameUtil;

    invoke-virtual {v2, v1}, Landroid/car/app/radio/utils/SaveStationNameUtil;->getStationName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :mod_empty

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :mod_empty

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, %(C)s->mTextBandUnit:Landroid/widget/TextView;

    if-eqz v3, :mod_build

    const-string v1, " "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    :mod_build
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :mod_set

    :mod_empty
    const-string v2, ""

    :mod_set
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :mod_end
    return-void
.end method
""" % {"C": C}

# 3b) FM/AM-knoppen: actieve band tonen (FM1/FM2/FM3) en markeren
BAND_DONE = "modBandButtons" in smali
if not BAND_DONE:
    pub = open(os.path.join(SRC, "res/values/public.xml"), encoding="utf-8").read()
    mid = re.search(r'type="id" name="btn_fm" id="(0x[0-9a-f]+)"', pub)
    if not mid: fail("id van btn_fm niet gevonden in public.xml")
    m = re.search(r"\.method public refreshMainFreq\(Landroid/car/radio/RadioDefine\$RadioDataV1;\)V.*?\.end method", smali, re.S)
    if not m or not m.group(0).endswith("    return-void\n.end method") or m.group(0).count("return-void") != 1:
        fail("methode refreshMainFreq onverwacht")
    body = m.group(0)
    smali = smali.replace(body, body[:-len("    return-void\n.end method")] +
        "    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modBandButtons()V\n\n    return-void\n.end method")
    C = "Landroid/car/app/radio/UI2UiControl;"
    smali += """

# MOD: FM/AM-knoppen tonen de actieve band en zijn gemarkeerd
.method private modBandButtons()V
    .locals 6

    :try_start_0
    iget-object v0, p0, %(C)s->mTextBandType:Landroid/widget/TextView;

    if-eqz v0, :mod_b_end

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :mod_b_end

    iget-boolean v1, p0, %(C)s->mIsFm:Z

    const v2, %(ID)s

    invoke-direct {p0, v2}, %(C)s->findViewById(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :mod_b_am

    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :mod_b_am

    check-cast v2, Landroid/widget/TextView;

    move-object v3, v0

    if-nez v1, :mod_b_fmtxt

    const-string v3, "FM"

    :mod_b_fmtxt
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :mod_b_am
    iget-object v2, p0, %(C)s->groupViewAM:Landroid/view/View;

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :mod_b_end

    xor-int/lit8 v4, v1, 0x1

    invoke-virtual {v2, v4}, Landroid/view/View;->setSelected(Z)V

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :mod_b_end

    check-cast v2, Landroid/widget/TextView;

    move-object v3, v0

    if-eqz v1, :mod_b_amtxt

    const-string v3, "AM"

    :mod_b_amtxt
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :mod_b_end

    :mod_b_end
    return-void
.end method
""" % {"C": C, "ID": mid.group(1)}

# 3c) Favorieten oplopend nummeren: FM1 = P1-P6, FM2 = P7-P12, FM3 = P13-P18
if "modPresetLabels" not in smali:
    C = "Landroid/car/app/radio/UI2UiControl;"
    h1 = "    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modBandButtons()V\n"
    h2 = "    invoke-virtual {v0, p3}, Landroid/car/app/radio/SubFreqLayout;->setFreqName(Ljava/lang/String;)V\n"
    if smali.count(h1) != 1 or smali.count(h2) != 1:
        fail("haakpunten voor de P-nummering niet gevonden")
    call = "\n    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modPresetLabels()V\n"
    smali = smali.replace(h1, h1 + call).replace(h2, h2 + call)
    smali += """

# MOD: favorieten oplopend nummeren per groep (FM1: P1-P6, FM2: P7-P12, FM3: P13-P18)
.method private modPresetLabels()V
    .locals 6

    :try_start_0
    const/4 v0, 0x0

    iget-object v1, p0, %(C)s->mRadioData:Landroid/car/radio/RadioDefine$RadioDataV1;

    if-eqz v1, :mod_p_have

    iget-object v1, v1, Landroid/car/radio/RadioDefine$RadioDataV1;->mainFreq:Landroid/car/radio/RadioDefine$FreqInfo;

    if-eqz v1, :mod_p_have

    iget v0, v1, Landroid/car/radio/RadioDefine$FreqInfo;->bandIndex:I

    :mod_p_have
    mul-int/lit8 v0, v0, 0x6

    iget-object v1, p0, %(C)s->mSubFreqArr:[Landroid/car/app/radio/SubFreqLayout;

    if-eqz v1, :mod_p_end

    const/4 v2, 0x0

    :mod_p_loop
    array-length v3, v1

    if-ge v2, v3, :mod_p_end

    aget-object v3, v1, v2

    if-eqz v3, :mod_p_next

    invoke-virtual {v3}, Landroid/car/app/radio/SubFreqLayout;->getMIndexText()Landroid/widget/TextView;

    move-result-object v3

    if-eqz v3, :mod_p_next

    add-int v4, v0, v2

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "P"

    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :mod_p_next
    add-int/lit8 v2, v2, 0x1

    goto :mod_p_loop

    :mod_p_end
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :mod_p_catch

    :mod_p_catch
    return-void
.end method
""" % {"C": C}

# 3d) RDS-knoppen (AF/TA/PTY) niet laten knipperen, alleen blauw als ze aan staan
if "# MOD: knop niet knipperen" not in smali:
    old = """    iget-object p2, p0, Landroid/car/app/radio/UI2UiControl;->mFlagFlashAnim:Landroid/view/animation/AlphaAnimation;

    check-cast p2, Landroid/view/animation/Animation;

    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
"""
    m = re.search(r"\.method private final updateRdsBtn\(.*?\.end method", smali, re.S)
    if not m or m.group(0).count(old) != 1:
        fail("updateRdsBtn onverwacht")
    b = m.group(0)
    smali = smali.replace(b, b.replace(old, """    # MOD: knop niet knipperen
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V
"""))

# 3e) Knoppen Stereo/mono en Alleen sterk blauw als ze aan staan
if "modStLocButtons" not in smali:
    m = re.search(r"\.method public refreshFmFlag\(Landroid/car/radio/RadioDefine\$RadioDataV1;\)V\n    \.locals \d+\n", smali)
    if not m: fail("refreshFmFlag niet gevonden")
    smali = smali.replace(m.group(0), m.group(0) + "\n    invoke-direct {p0, p1}, Landroid/car/app/radio/UI2UiControl;->modStLocButtons(Landroid/car/radio/RadioDefine$RadioDataV1;)V\n", 1)
    C = "Landroid/car/app/radio/UI2UiControl;"
    smali += """

# MOD: knoppen Stereo/mono en Alleen sterk tonen of de functie aan staat
.method private modStLocButtons(Landroid/car/radio/RadioDefine$RadioDataV1;)V
    .locals 3

    if-eqz p1, :mod_sl_end

    iget-boolean v0, p0, %(C)s->mIsFm:Z

    iget-object v1, p0, %(C)s->mGroupViewST:Landroid/view/View;

    if-eqz v1, :mod_sl_loc

    iget-boolean v2, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->stOn:Z

    and-int/2addr v2, v0

    invoke-virtual {v1, v2}, Landroid/view/View;->setSelected(Z)V

    :mod_sl_loc
    iget-object v1, p0, %(C)s->mGroupViewLoc:Landroid/view/View;

    if-eqz v1, :mod_sl_end

    iget-boolean v2, p1, Landroid/car/radio/RadioDefine$RadioDataV1;->locOn:Z

    and-int/2addr v2, v0

    invoke-virtual {v1, v2}, Landroid/view/View;->setSelected(Z)V

    :mod_sl_end
    return-void
.end method
""" % {"C": C}

# 3f) Indicatoren bovenin altijd zichtbaar met duidelijke aan/uit-stand
if "modFlags" not in smali:
    call = "\n    invoke-direct {p0, p1}, Landroid/car/app/radio/UI2UiControl;->modFlags(Landroid/car/radio/RadioDefine$RadioDataV1;)V\n"
    for meth in ("refreshFmFlag", "refreshRdsFlag"):
        m = re.search(r"\.method public " + meth + r"\(Landroid/car/radio/RadioDefine\$RadioDataV1;\)V\n    \.locals \d+\n", smali)
        if not m: fail(meth + " niet gevonden")
        smali = smali.replace(m.group(0), m.group(0) + call, 1)
    smali += MODFLAGS

# 3g) Logo's op de favorietknoppen
if "ModStations;->presetLogo" not in smali:
    h2 = "    invoke-virtual {v0, p3}, Landroid/car/app/radio/SubFreqLayout;->setFreqName(Ljava/lang/String;)V\n"
    if smali.count(h2) != 1: fail("haakpunt voor logo's op favorieten niet gevonden")
    smali = smali.replace(h2, h2 + "\n    invoke-static {v0, p1, p3}, Landroid/car/app/radio/ModStations;->presetLogo(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V\n")

# 3h) "MHz" verbergen als de grote tekst een zendernaam is
if "modUnitVisibility" not in smali:
    h = "    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modFreqLabel()V\n"
    if smali.count(h) != 1: fail("haakpunt voor MHz niet gevonden")
    smali = smali.replace(h, h + "\n    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modUnitVisibility()V\n")
    C = "Landroid/car/app/radio/UI2UiControl;"
    smali += """

# MOD: eenheid (MHz/KHz) alleen tonen als de grote tekst een frequentie is
.method private modUnitVisibility()V
    .locals 4

    iget-object v0, p0, %(C)s->mTextBandUnit:Landroid/widget/TextView;

    if-eqz v0, :mod_u_end

    const/4 v3, 0x0

    iget-object v1, p0, %(C)s->mMainFreqStr:Ljava/lang/String;

    if-eqz v1, :mod_u_set

    iget-object v2, p0, %(C)s->mStationNameUtil:Landroid/car/app/radio/utils/SaveStationNameUtil;

    invoke-virtual {v2, v1}, Landroid/car/app/radio/utils/SaveStationNameUtil;->getStationName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :mod_u_set

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :mod_u_set

    const/16 v3, 0x8

    :mod_u_set
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :mod_u_end
    return-void
.end method
""" % {"C": C}

# 3i) Groot logo links van de zendernaam
if "modMainLogo" not in smali:
    h = "    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modUnitVisibility()V\n"
    if smali.count(h) != 1: fail("haakpunt voor groot logo niet gevonden")
    smali = smali.replace(h, h + "\n    invoke-direct {p0}, Landroid/car/app/radio/UI2UiControl;->modMainLogo()V\n")
    C = "Landroid/car/app/radio/UI2UiControl;"
    smali += """

# MOD: groot logo links van de zendernaam
.method private modMainLogo()V
    .locals 4

    iget-object v0, p0, %(C)s->mMainTextFreqView:Landroid/widget/TextView;

    if-eqz v0, :mod_ml_end

    iget-object v1, p0, %(C)s->mMainFreqStr:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :mod_ml_call

    iget-object v3, p0, %(C)s->mStationNameUtil:Landroid/car/app/radio/utils/SaveStationNameUtil;

    invoke-virtual {v3, v1}, Landroid/car/app/radio/utils/SaveStationNameUtil;->getStationName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :mod_ml_call
    invoke-static {v0, v1, v2}, Landroid/car/app/radio/ModStations;->mainLogo(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    :mod_ml_end
    return-void
.end method
""" % {"C": C}

# Reparatie van eerdere versie (findViewById is private -> invoke-direct)
smali = smali.replace("invoke-virtual {p0, v2}, Landroid/car/app/radio/UI2UiControl;->findViewById(I)Landroid/view/View;",
                      "invoke-direct {p0, v2}, Landroid/car/app/radio/UI2UiControl;->findViewById(I)Landroid/view/View;")

# 4) ui2_subfreq.xml: verborgen velden toevoegen (voorkomt crash op andere schermformaten)
sub = open(SUBFREQ, encoding="utf-8").read()
if "freqName" not in sub:
    close = "</android.car.app.radio.SubFreqLayout>"
    if close not in sub: fail("ui2_subfreq.xml heeft een onverwachte opbouw")
    extra = """    <LinearLayout android:id="@+id/freqShow" android:layout_width="wrap_content" android:layout_height="wrap_content" android:visibility="gone">
        <TextView android:id="@+id/freqName" android:layout_width="wrap_content" android:layout_height="wrap_content" />
        <TextView android:id="@+id/freqText2" android:layout_width="wrap_content" android:layout_height="wrap_content" />
    </LinearLayout>
"""
    sub = sub.replace(close, extra + close)

MAN = os.path.join(SRC, "AndroidManifest.xml")
man = open(MAN, encoding="utf-8").read()
if "ModBootReceiver" not in man:
    if "</application>" not in man or "<application" not in man:
        fail("AndroidManifest.xml heeft een onverwachte opbouw")
    rec = """        <receiver android:name="android.car.app.radio.ModBootReceiver" android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
                <action android:name="android.car.action.CAR_BOOT_COMPLETED"/>
                <action android:name="android.car.action.EXIT_SLEEP"/>
            </intent-filter>
        </receiver>
"""
    man = man.replace("</application>", rec + "    </application>", 1)
    if "android.permission.RECEIVE_BOOT_COMPLETED" not in man:
        i = man.index("<application")
        man = man[:i] + '<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>\n    ' + man[i:]

# 5) RadioApplication: ontvanger ook dynamisch registreren
APP = os.path.join(SRC, "smali/android/car/app/radio/manager/RadioApplication.smali")
if not os.path.exists(APP): fail("RadioApplication.smali niet gevonden")
appsmali = open(APP, encoding="utf-8").read()
if "ModBootReceiver;->register" not in appsmali:
    m = re.search(r"\.method public onCreate\(\)V.*?\.end method", appsmali, re.S)
    if not m or not m.group(0).endswith("    return-void\n.end method") or m.group(0).count("return-void") != 1:
        fail("RadioApplication.onCreate onverwacht")
    b = m.group(0)
    appsmali = appsmali.replace(b, b[:-len("    return-void\n.end method")] +
        "    invoke-static {p0}, Landroid/car/app/radio/ModBootReceiver;->register(Landroid/content/Context;)V\n\n    return-void\n.end method")

# 6) Zenderlijst: methode in RadioMain om de lijst te openen
RM = os.path.join(SRC, "smali/android/car/app/radio/RadioMain.smali")
if not os.path.exists(RM): fail("RadioMain.smali niet gevonden")
rmsmali = open(RM, encoding="utf-8").read()
if "modOpenStations" not in rmsmali:
    rmsmali += """

# MOD: zenderlijst openen (android:onClick in de layout)
.method public modOpenStations(Landroid/view/View;)V
    .locals 0

    invoke-static {p0}, Landroid/car/app/radio/ModStations;->show(Landroid/app/Activity;)V

    return-void
.end method
"""
if "ModStations;->onResume" not in rmsmali:
    m = re.search(r"\.method protected onResume\(\)V\n    \.locals \d+\n", rmsmali)
    if not m: fail("RadioMain.onResume niet gevonden")
    rmsmali = rmsmali.replace(m.group(0), m.group(0) + "\n    invoke-static {p0}, Landroid/car/app/radio/ModStations;->onResume(Landroid/app/Activity;)V\n", 1)
if False:
    i = man.index("<application")
    man = man[:i] + '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>\n    ' + man[i:]

# 0) Eigen pakketnaam, zodat de app naast het origineel kan staan
pkg_changed = False
mm = re.search(r'(<manifest\b[^>]*?\spackage=")([^"]+)(")', man)
if not mm: fail("pakketnaam niet gevonden in AndroidManifest.xml")
if mm.group(2) == ORIG_PKG:
    if not re.match(r"^[a-zA-Z][\w]*(\.[a-zA-Z][\w]*)+$", NEW_PKG) or NEW_PKG == ORIG_PKG:
        fail("ongeldige pakketnaam: " + NEW_PKG)
    man = man[:mm.start(2)] + NEW_PKG + man[mm.end(2):]
    pkg_changed = True

# 0b) App-naam (alleen bij de eerste keer, of als --name is opgegeven)
name_files = {}
if pkg_changed or any(x.startswith("--name=") for x in sys.argv[1:]):
    safe = NEW_NAME.replace("&", "&amp;").replace("<", "&lt;").replace("'", "\\'")
    for root, _, files in os.walk(os.path.join(SRC, "res")):
        if os.path.basename(root).startswith("values") and "strings.xml" in files:
            fpath = os.path.join(root, "strings.xml")
            t = open(fpath, encoding="utf-8").read()
            t2 = re.sub(r'(<string name="radio_app_name">)[^<]*(</string>)', lambda m: m.group(1) + safe + m.group(2), t)
            if t2 != t:
                name_files[fpath] = t2

# 0c) CarBaseManager2: bij de autodienst aanmelden met de originele pakketnaam
CBM = os.path.join(SRC, "smali/android/car/base/CarBaseManager2.smali")
if not os.path.exists(CBM): fail("CarBaseManager2.smali niet gevonden")
cbm = open(CBM, encoding="utf-8").read()
cbm_pat = re.compile(
    r"    iget-object v1, p0, Landroid/car/base/CarBaseManager2;->mContext:Landroid/content/Context;\s+"
    r"invoke-virtual \{v1\}, Landroid/content/Context;->getPackageName\(\)Ljava/lang/String;\s+"
    r"move-result-object v1\n(\s+const-string v2, \"package_name\")")
if len(cbm_pat.findall(cbm)) == 1:
    cbm = cbm_pat.sub(lambda m: '    const-string v1, "' + ORIG_PKG + '"\n' + m.group(1), cbm)
elif '"package_name"' not in cbm:
    fail("CarBaseManager2.smali heeft een onverwachte opbouw")

# Alles gecontroleerd: nu schrijven
for root, _, files in os.walk(KIT):
    for f in files:
        rel = os.path.relpath(os.path.join(root, f), KIT)
        dst = os.path.join(SRC, rel)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        shutil.copyfile(os.path.join(root, f), dst)
        print("  gekopieerd:", rel)
open(UI2, "w", encoding="utf-8").write(smali)
print("  aangepast: smali/.../UI2UiControl.smali" + (" (was al gedaan)" if SUB_DONE and APS_DONE else ""))
open(SUBFREQ, "w", encoding="utf-8").write(sub)
print("  aangepast: res/layout/ui2_subfreq.xml")
open(MAN, "w", encoding="utf-8").write(man)
open(APP, "w", encoding="utf-8").write(appsmali)
open(RM, "w", encoding="utf-8").write(rmsmali)
open(CBM, "w", encoding="utf-8").write(cbm)
for fpath, t in name_files.items():
    open(fpath, "w", encoding="utf-8").write(t)
if pkg_changed:
    print("  pakketnaam: " + NEW_PKG)
if name_files:
    print("  app-naam: " + NEW_NAME)
print("  aangepast: RadioMain.smali")
print("  aangepast: RadioApplication.smali")
print("  aangepast: AndroidManifest.xml")
if RANDTEST:
    shutil.copyfile(os.path.join(os.path.dirname(KIT), "extra", "ui2_activity_radio_randtest.xml"),
                    os.path.join(SRC, "res/layout-w800dp-h420dp/ui2_activity_radio.xml"))
    print("  TEST: layout met hulplijnen geplaatst")
os.makedirs(os.path.join(SRC, "assets", "RadioLogos"), exist_ok=True)
print("  map voor logo's: " + os.path.join(SRC, "assets", "RadioLogos"))
print("Klaar. Bouw nu met: apktool b " + SRC + " -o Radio_mod.apk")
