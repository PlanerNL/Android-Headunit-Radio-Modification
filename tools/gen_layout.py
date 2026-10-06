import sys
P=dict(
 big=dict(pad=20,padTop=12,padBot=0,top=60,ind_h=30,ind_ts=14,pill_w=140,pill_h=52,pill_ts=24,flag_ts=14,side_w=150,btn=84,side_ts=15,
  ps_ts=24,band_ts=20,freq_ts=84,unit_ts=24,unit_mb=14,rt_ts=16,pty_ts=14,slider_w='720dp',seek_h=36,scale_h=30,
  preset_h=104,preset_mt=8,div_mt=12,bar_h=84,icon=28,label_ts=14),
 small=dict(pad=20,padTop=20,padBot=0,top=50,ind_h=24,ind_ts=12,pill_w=104,pill_h=42,pill_ts=19,flag_ts=12,side_w=110,btn=64,side_ts=13,
  ps_ts=18,band_ts=15,freq_ts=58,unit_ts=18,unit_mb=9,rt_ts=13,pty_ts=12,slider_w='match_parent',seek_h=30,scale_h=24,
  preset_h=72,preset_mt=4,div_mt=6,bar_h=62,icon=22,label_ts=12))
p=P[sys.argv[1]]; out=sys.argv[2]
RAND = len(sys.argv) > 3 and sys.argv[3] == "randtest"
def _v(side, dp, color):
    return f'''    <View android:layout_width="2dp" android:layout_height="match_parent" android:layout_gravity="{side}"
        android:layout_margin{side.capitalize()}="{dp}dp" android:background="{color}"/>
    <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_gravity="{side}|center_vertical"
        android:layout_margin{side.capitalize()}="{dp+3}dp" android:textSize="12sp" android:textColor="{color}" android:background="#AA000000" android:text="{dp}"/>
'''
def _h(side, dp, color):
    return f'''    <View android:layout_width="match_parent" android:layout_height="2dp" android:layout_gravity="{side}"
        android:layout_margin{side.capitalize()}="{dp}dp" android:background="{color}"/>
    <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_gravity="{side}|center_horizontal"
        android:layout_margin{side.capitalize()}="{dp+3}dp" android:textSize="12sp" android:textColor="{color}" android:background="#AA000000" android:text="{dp}"/>
'''
OVERLAY = ""
if RAND:
    for dp, c in {0:"#FFFF3030",20:"#FF30FF30",40:"#FFFFFF30",60:"#FF30FFFF",80:"#FFFF30FF"}.items():
        OVERLAY += _v("left",dp,c)+_v("right",dp,c)+_h("top",dp,c)+_h("bottom",dp,c)
def item(id_, icon, label):
    return f'''        <LinearLayout
            android:id="@+id/{id_}"
            android:layout_width="0dp"
            android:layout_height="match_parent"
            android:layout_weight="1"
            android:layout_margin="3dp"
            android:orientation="vertical"
            android:gravity="center"
            android:clickable="true"
            android:focusable="true"
            android:background="@drawable/mod_item_bg">
            <ImageView
                android:layout_width="{p['icon']}dp"
                android:layout_height="{p['icon']}dp"
                android:duplicateParentState="true"
                android:src="@drawable/{icon}"
                android:tint="@color/mod_icon_tint"/>
            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="3dp"
                android:duplicateParentState="true"
                android:singleLine="true"
                android:textSize="{p['label_ts']}sp"
                android:textColor="@color/mod_label_color"
                android:text="@string/{label}"/>
        </LinearLayout>
'''
def flag(id_, text, chip=True):
    bg = '\n            android:background="@drawable/mod_chip"' if chip else ''
    return f'''        <android.car.ui.ShadowTextView
            android:id="@+id/{id_}"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginLeft="5dp"
            android:paddingLeft="7dp"
            android:paddingRight="7dp"
            android:paddingTop="2dp"
            android:paddingBottom="2dp"{bg}
            android:textSize="{p['flag_ts']}sp"
            android:textColor="@color/mod_text2"
            android:text="{text}"/>
'''
def ind(tag, text):
    return f'''        <TextView
            android:tag="{tag}"
            android:layout_width="wrap_content"
            android:layout_height="{p['ind_h']}dp"
            android:layout_marginLeft="6dp"
            android:minWidth="{p['ind_h']}dp"
            android:gravity="center"
            android:paddingLeft="7dp"
            android:paddingRight="7dp"
            android:background="@drawable/mod_ind_bg"
            android:textSize="{p['ind_ts']}sp"
            android:textStyle="bold"
            android:textColor="@color/mod_ind_text"
            android:text="{text}"/>
'''
def side(btn, icon, label):
    return f'''        <LinearLayout
            android:layout_width="{p['side_w']}dp"
            android:layout_height="wrap_content"
            android:orientation="vertical"
            android:gravity="center_horizontal">
            <ImageButton
                android:id="@+id/{btn}"
                android:layout_width="{p['btn']}dp"
                android:layout_height="{p['btn']}dp"
                android:background="@drawable/mod_circle_btn"
                android:src="@drawable/{icon}"
                android:scaleType="center"/>
            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="6dp"
                android:gravity="center"
                android:lineSpacingExtra="1dp"
                android:textSize="{p['side_ts']}sp"
                android:textColor="@color/mod_text2"
                android:text="@string/{label}"/>
        </LinearLayout>
'''
def preset(n):
    return f'''        <include
            android:id="@+id/subFreq{n}"
            android:layout_width="0dp"
            android:layout_height="match_parent"
            android:layout_weight="1"
            android:layout_marginLeft="4dp"
            android:layout_marginRight="4dp"
            layout="@layout/mod_subfreq"/>
'''
def pill(id_, tag, text, extra='', wide=False):
    inner = f'''<TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_gravity="center"
                android:textSize="{p['pill_ts']}sp" android:textStyle="bold" android:textColor="@color/mod_pill_text" android:text="{text}"/>'''
    grav = '\n            android:gravity="center"' if tag=='LinearLayout' else ''
    return f'''        <{tag}
            android:id="@+id/{id_}"
            android:layout_width="{('wrap_content' if wide else str(p['pill_w'])+'dp')}"
            android:layout_height="{p['pill_h']}dp"
            android:layout_marginRight="8dp"{(chr(10)+'            android:minWidth="'+str(p['pill_w'])+'dp"'+chr(10)+'            android:paddingLeft="18dp"'+chr(10)+'            android:paddingRight="18dp"') if wide else ''}{grav}{extra}
            android:clickable="true"
            android:focusable="true"
            android:background="@drawable/mod_pill">
            {inner}
        </{tag}>
'''
x = f'''<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/layoutBg"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/mod_bg">
<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:paddingLeft="{p['pad']}dp"
    android:paddingRight="{p['pad']}dp"
    android:paddingTop="{p['padTop']}dp"
    android:paddingBottom="{p['padBot']}dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="{p['top']}dp"
        android:orientation="horizontal"
        android:gravity="center_vertical">
{pill("btn_fm","LinearLayout","FM")}{pill("btn_am","FrameLayout","AM")}{pill("mod_stations_btn","FrameLayout","@string/mod_stations", chr(10)+'            android:onClick="modOpenStations"', wide=True)}{pill("ll_collect_list","FrameLayout","@string/mod_list", chr(10)+'            android:visibility="gone"')}        <View android:layout_width="0dp" android:layout_height="1dp" android:layout_weight="1"/>
{flag("flag_seek_state", "", chip=False)}        <LinearLayout
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:visibility="gone">
{flag("flag_st", "@string/radio_nt_st", chip=False)}        <ImageView
            android:id="@+id/flag_circle"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/icon_voice_small"/>
{flag("flag_loc", "@string/radio_nt_loc", chip=False)}        <LinearLayout
            android:id="@+id/rds_flag_bar"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:orientation="horizontal">
{flag("rds_flag_tp", "@string/radio_nt_tp")}{flag("rds_flag_ta", "@string/radio_nt_ta")}{flag("rds_flag_af", "@string/radio_nt_af")}{flag("rds_flag_pty", "@string/radio_nt_pty")}        </LinearLayout>
        </LinearLayout>
{ind("mod_ind_st","@string/radio_nt_st")}        <ImageView
            android:tag="mod_ind_ring"
            android:layout_width="{p['ind_h']}dp"
            android:layout_height="{p['ind_h']}dp"
            android:layout_marginLeft="6dp"
            android:padding="3dp"
            android:scaleType="fitCenter"
            android:background="@drawable/mod_ind_bg"
            android:src="@drawable/icon_voice_small"
            android:tint="@color/mod_ind_text"/>
{ind("mod_ind_loc","@string/radio_nt_loc")}{ind("mod_ind_tp","@string/radio_nt_tp")}{ind("mod_ind_ta","@string/radio_nt_ta")}{ind("mod_ind_af","@string/radio_nt_af")}{ind("mod_ind_pty","@string/radio_nt_pty")}    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"
        android:orientation="horizontal"
        android:gravity="center_vertical">
{side("btn_prev", "mod_ic_prev", "mod_prev")}        <LinearLayout
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:orientation="vertical"
            android:gravity="center_horizontal">
            <android.car.ui.ShadowTextView
                android:id="@+id/rds_ps_name"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:textSize="{p['ps_ts']}sp"
                android:textColor="@color/mod_text2"
                android:singleLine="true"
                android:text=""/>
            <LinearLayout
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:orientation="horizontal"
                android:gravity="bottom">
                <ImageView
                    android:tag="mod_main_logo"
                    android:layout_width="{p['freq_ts']}sp"
                    android:layout_height="{p['freq_ts']}sp"
                    android:layout_marginRight="14dp"
                    android:layout_marginBottom="4dp"
                    android:scaleType="fitCenter"
                    android:visibility="gone"/>
                <TextView
                    android:id="@+id/imgBandType"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:visibility="gone"
                    android:layout_marginRight="10dp"
                    android:layout_marginBottom="{p['unit_mb']}dp"
                    android:textSize="{p['band_ts']}sp"
                    android:textColor="@color/mod_text3"
                    android:text="FM1"/>
                <FrameLayout
                    android:id="@+id/mainFreq_framelayout"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content">
                    <android.car.app.radio.ImageNumberView
                        android:id="@+id/mainFreq"
                        android:layout_width="1dp"
                        android:layout_height="1dp"
                        android:visibility="invisible"/>
                    <TextView
                        android:id="@+id/mainFreq_text"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:includeFontPadding="false"
                        android:singleLine="true"
                        android:textSize="{p['freq_ts']}sp"
                        android:textColor="@color/mod_text"/>
                </FrameLayout>
                <TextView
                    android:id="@+id/imgBandUnit"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_marginLeft="8dp"
                    android:layout_marginBottom="{p['unit_mb']}dp"
                    android:textSize="{p['unit_ts']}sp"
                    android:textColor="@color/mod_text2"
                    android:text="MHz"/>
            </LinearLayout>
            <android.car.ui.AutoScrollTextView
                android:id="@+id/radio_main_text"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:gravity="center"
                android:ellipsize="marquee"
                android:focusable="true"
                android:focusableInTouchMode="true"
                android:scrollHorizontally="true"
                android:singleLine="true"
                android:marqueeRepeatLimit="marquee_forever"
                android:textSize="{p['rt_ts']}sp"
                android:textColor="@color/mod_text3"/>
            <LinearLayout
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:orientation="horizontal">
                <android.car.ui.ShadowTextView
                    android:id="@+id/rds_pty_name"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:textSize="{p['pty_ts']}sp"
                    android:textColor="@color/mod_text3"
                    android:text=""/>
                <android.car.ui.ShadowTextView
                    android:id="@+id/rds_pty_sel"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_marginLeft="10dp"
                    android:visibility="gone"
                    android:textSize="{p['pty_ts']}sp"
                    android:textColor="@color/mod_accent"
                    android:text=""/>
            </LinearLayout>
            <LinearLayout
                android:layout_width="{p['slider_w']}"
                android:layout_height="wrap_content"
                android:layout_marginTop="6dp"
                android:orientation="vertical">
                <SeekBar
                    android:id="@+id/freq_bar"
                    android:layout_width="match_parent"
                    android:layout_height="{p['seek_h']}dp"
                    android:paddingLeft="16dp"
                    android:paddingRight="16dp"
                    android:focusable="false"
                    android:indeterminate="false"
                    android:progressDrawable="@drawable/mod_track"
                    android:thumb="@drawable/mod_thumb"/>
                <ImageView
                    android:id="@+id/freqrule_bg"
                    android:layout_width="match_parent"
                    android:layout_height="{p['scale_h']}dp"
                    android:paddingLeft="16dp"
                    android:paddingRight="16dp"
                    android:scaleType="fitXY"
                    android:src="@drawable/fm_8750_1080"/>
            </LinearLayout>
        </LinearLayout>
{side("btn_next", "mod_ic_next", "mod_next")}    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="{p['preset_h']}dp"
        android:layout_marginTop="{p['preset_mt']}dp"
        android:layout_marginLeft="-4dp"
        android:layout_marginRight="-4dp"
        android:orientation="horizontal">
{"".join(preset(i) for i in range(1,7))}    </LinearLayout>

    <View
        android:layout_width="match_parent"
        android:layout_height="1dp"
        android:layout_marginTop="{p['div_mt']}dp"
        android:background="@color/mod_stroke"/>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="{p['bar_h']}dp"
        android:orientation="horizontal">
{item("btn_aps", "mod_ic_aps", "mod_aps")}{item("btn_st", "mod_ic_st", "mod_st")}{item("btn_loc", "mod_ic_loc", "mod_loc")}        <LinearLayout
            android:id="@+id/rds_btn_bar"
            android:layout_width="0dp"
            android:layout_height="match_parent"
            android:layout_weight="3"
            android:orientation="horizontal">
{item("btn_ta", "mod_ic_ta", "mod_ta")}{item("btn_af", "mod_ic_af", "mod_af")}{item("btn_pty", "mod_ic_pty", "mod_pty")}            <ImageButton
                android:id="@+id/btn_pty_more"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:visibility="gone"/>
        </LinearLayout>
    </LinearLayout>
</LinearLayout>
{OVERLAY}</FrameLayout>
'''
open(out,'w').write(x)
