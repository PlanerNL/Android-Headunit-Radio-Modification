package android.car.app.radio;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.car.app.radio.manager.RadioManager;
import android.car.app.radio.utils.SaveStationNameUtil;
import android.car.radio.RadioDefine;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.InputType;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

/**
 * MOD: eigen zenderlijst. Wordt bewaard in eigen instellingen en wordt dus
 * niet geraakt door "Zoek en sla op".
 */
public class ModStations {

    static final String PREFS = "mod_stations";
    static final String KEY = "list";
    static final String LOGO_DIR = "RadioLogos";

    static final int C_BG = 0xFF161B22;
    static final int C_ROW = 0xFF1A1F27;
    static final int C_ROW_PRESSED = 0xFF252C37;
    static final int C_STROKE = 0xFF2A313C;
    static final int C_ACCENT = 0xFF4C9EFF;
    static final int C_TEXT = 0xFFFFFFFF;
    static final int C_TEXT2 = 0xFF9AA4B2;
    static final int C_DANGER = 0xFFE5534B;

    static List<St> sCache = null;
    static final java.util.HashMap<String, Bitmap> sLogos = new java.util.HashMap<String, Bitmap>();

    static class St {
        String name;
        int freq;
        St(String n, int f) { name = n; freq = f; }
    }

    // ---------- opslag ----------

    static List<St> defaults() {
        List<St> l = new ArrayList<St>();
        l.add(new St("NPO Radio 1", 9840));
        l.add(new St("NPO Radio 2", 10460));
        l.add(new St("NPO 3FM", 9620));
        l.add(new St("Qmusic", 10040));
        l.add(new St("Sky Radio", 10100));
        l.add(new St("Radio 538", 10260));
        l.add(new St("Tukker FM", 9000));
        l.add(new St("AA FM", 10610));
        return l;
    }

    static List<St> load(Context c) {
        if (sCache != null) return copy(sCache);
        SharedPreferences p = c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String s = p.getString(KEY, null);
        if (s == null) {
            List<St> d = defaults();
            save(c, d);
            return d;
        }
        List<St> l = new ArrayList<St>();
        for (String line : s.split("\n")) {
            int t = line.lastIndexOf('\t');
            if (t <= 0) continue;
            try {
                l.add(new St(line.substring(0, t), Integer.parseInt(line.substring(t + 1).trim())));
            } catch (Exception ignored) {
            }
        }
        sort(l);
        sCache = copy(l);
        return l;
    }

    static List<St> copy(List<St> l) {
        List<St> r = new ArrayList<St>();
        for (St s : l) r.add(new St(s.name, s.freq));
        return r;
    }

    static void save(Context c, List<St> l) {
        sort(l);
        StringBuilder b = new StringBuilder();
        for (St s : l) {
            b.append(s.name.replace("\n", " ").replace("\t", " ")).append('\t').append(s.freq).append('\n');
        }
        c.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putString(KEY, b.toString()).apply();
        sCache = copy(l);
    }

    static void sort(List<St> l) {
        Collections.sort(l, new Comparator<St>() {
            public int compare(St a, St b) { return a.freq - b.freq; }
        });
    }

    static String fmt(int f) {
        return String.format(Locale.ROOT, "%d.%02d", f / 100, f % 100);
    }

    static int parseFreq(String s) {
        try {
            double d = Double.parseDouble(s.trim().replace(',', '.'));
            int f = (int) Math.round(d * 100);
            if (f >= 8750 && f <= 10800) return f;
        } catch (Exception ignored) {
        }
        return -1;
    }

    // ---------- radio ----------

    static RadioDefine.RadioDataV1 data() {
        try {
            RadioManager rm = RadioManager.access$getInstance$cp();
            return rm == null ? null : rm.getRadioData();
        } catch (Throwable t) {
            return null;
        }
    }

    static int currentFmFreq() {
        RadioDefine.RadioDataV1 d = data();
        if (d == null || d.mainFreq == null) return -1;
        if (!RadioDefine.isFmBand(d.mainFreq.bandType)) return -1;
        return d.mainFreq.freq;
    }

    static void tune(final int freq) {
        try {
            final RadioManager rm = RadioManager.access$getInstance$cp();
            if (rm == null) return;
            RadioDefine.RadioDataV1 d = rm.getRadioData();
            boolean fm = d != null && d.mainFreq != null && RadioDefine.isFmBand(d.mainFreq.bandType);
            if (fm) {
                rm.setRadioFreq(freq);
            } else {
                rm.switchToFm();
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                    public void run() {
                        try { rm.setRadioFreq(freq); } catch (Throwable ignored) { }
                    }
                }, 600);
            }
        } catch (Throwable ignored) {
        }
    }

    // ---------- helpers ----------

    static int dp(Context c, float v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, c.getResources().getDisplayMetrics());
    }

    static GradientDrawable round(int fill, int stroke, int radius) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(fill);
        g.setCornerRadius(radius);
        if (stroke != 0) g.setStroke(2, stroke);
        return g;
    }

    static StateListDrawable pressable(Context c, int normal, int pressed) {
        StateListDrawable s = new StateListDrawable();
        s.addState(new int[]{android.R.attr.state_pressed}, round(pressed, 0, dp(c, 10)));
        s.addState(new int[]{}, round(normal, 0, dp(c, 10)));
        return s;
    }

    static TextView text(Context c, String s, float sp, int color, boolean bold) {
        TextView t = new TextView(c);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setSingleLine(true);
        t.setEllipsize(TextUtils.TruncateAt.END);
        return t;
    }

    static TextView button(Context c, String s, int color) {
        TextView t = text(c, s, 16, color, true);
        t.setGravity(Gravity.CENTER);
        int ph = dp(c, 14), pv = dp(c, 8);
        t.setPadding(ph, pv, ph, pv);
        StateListDrawable s2 = new StateListDrawable();
        s2.addState(new int[]{android.R.attr.state_pressed}, round(C_ROW_PRESSED, C_ACCENT, dp(c, 18)));
        s2.addState(new int[]{}, round(C_ROW, C_STROKE, dp(c, 18)));
        t.setBackground(s2);
        t.setClickable(true);
        return t;
    }

    static String logoKey(String name) {
        return name.toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9]", "");
    }

    /** Logo uit de app zelf: assets/RadioLogos/<naam>.png (of .jpg/.jpeg/.webp). */
    static Bitmap logo(Context c, String name) {
        String k = logoKey(name);
        if (sLogos.containsKey(k)) return sLogos.get(k);
        Bitmap found = loadLogo(c, k);
        sLogos.put(k, found);
        return found;
    }

    static Bitmap loadLogo(Context c, String k) {
        String[] ext = {".png", ".jpg", ".jpeg", ".webp"};
        for (String e : ext) {
            InputStream in = null;
            try {
                in = c.getAssets().open(LOGO_DIR + "/" + k + e);
                Bitmap b = BitmapFactory.decodeStream(in);
                if (b != null) return b;
            } catch (Throwable ignored) {
            } finally {
                if (in != null) try { in.close(); } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    static View badge(Context c, String name) {
        int size = dp(c, 44);
        Bitmap bm = logo(c, name);
        if (bm != null) {
            ImageView iv = new ImageView(c);
            iv.setImageBitmap(bm);
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iv.setLayoutParams(new LinearLayout.LayoutParams(size, size));
            return iv;
        }
        String initials = "";
        for (String w : name.trim().split("\\s+")) {
            if (w.length() > 0 && initials.length() < 3) initials += Character.toUpperCase(w.charAt(0));
        }
        if (initials.length() == 0) initials = "?";
        float[] hsv = {Math.abs(name.hashCode() % 360), 0.45f, 0.55f};
        TextView t = text(c, initials, 14, C_TEXT, true);
        t.setGravity(Gravity.CENTER);
        GradientDrawable g = new GradientDrawable();
        g.setShape(GradientDrawable.OVAL);
        g.setColor(Color.HSVToColor(hsv));
        t.setBackground(g);
        t.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        return t;
    }

    // ---------- logo op de favorietknoppen ----------

    /** Zoekt het logo: eerst via de frequentie in de bibliotheek, dan via de RDS-naam. */
    static Bitmap resolveLogo(Context c, String freqText, String rdsName) {
        Bitmap bm = null;
        int f = parseFreq(freqText == null ? "" : freqText);
        if (f > 0) {
            for (St s : load(c)) {
                if (s.freq == f) { bm = logo(c, s.name); break; }
            }
        }
        if (bm == null && rdsName != null && rdsName.trim().length() > 0) bm = logo(c, rdsName);
        return bm;
    }

    static void applyLogo(View v, Bitmap bm) {
        if (!(v instanceof ImageView)) return;
        ImageView iv = (ImageView) v;
        if (bm != null) {
            iv.setImageBitmap(bm);
            iv.setVisibility(View.VISIBLE);
        } else {
            iv.setImageDrawable(null);
            iv.setVisibility(View.GONE);
        }
    }

    /** Wordt vanuit UI2UiControl.setSubFreq aangeroepen voor elke favoriet. */
    public static void presetLogo(View preset, String freqText, String rdsName) {
        try {
            if (preset == null) return;
            applyLogo(preset.findViewWithTag("mod_preset_logo"), resolveLogo(preset.getContext(), freqText, rdsName));
        } catch (Throwable ignored) {
        }
    }

    /** Groot logo links van de zendernaam. */
    public static void mainLogo(View anchor, String freqText, String rdsName) {
        try {
            if (anchor == null) return;
            View root = anchor.getRootView();
            if (root == null) return;
            applyLogo(root.findViewWithTag("mod_main_logo"), resolveLogo(anchor.getContext(), freqText, rdsName));
        } catch (Throwable ignored) {
        }
    }

    // ---------- geluid terughalen na een andere bron ----------

    static long sLastKick = 0;

    /**
     * Aangeroepen vanuit RadioMain.onResume. Staat de bron niet meer op radio
     * (bijvoorbeeld na de mp3-speler), dan wordt de originele radio-app heel
     * even geopend zodat de headunit het geluid weer op FM zet, en daarna komt
     * deze app weer naar voren.
     */
    public static void onResume(final Activity a) {
        try {
            RadioManager rm = RadioManager.access$getInstance$cp();
            if (rm == null) return;
            if (rm.getCurrentSource() == 0x10000) return;
            long now = SystemClock.elapsedRealtime();
            if (now - sLastKick < 5000) return;
            sLastKick = now;
            Intent orig = new Intent();
            orig.setComponent(new ComponentName("android.car.app.radio", "android.car.app.radio.RadioMain"));
            orig.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            a.startActivity(orig);
            final Context app = a.getApplicationContext();
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                public void run() {
                    try {
                        Intent back = new Intent(app, RadioMain.class);
                        back.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                        app.startActivity(back);
                    } catch (Throwable ignored) {
                    }
                }
            }, 900);
        } catch (Throwable ignored) {
        }
    }

    // ---------- dialoog ----------

    public static void show(final Activity a) {
        try {
            final Dialog d = new Dialog(a);
            d.requestWindowFeature(Window.FEATURE_NO_TITLE);

            LinearLayout root = new LinearLayout(a);
            root.setOrientation(LinearLayout.VERTICAL);
            int pad = dp(a, 16);
            root.setPadding(pad, pad, pad, pad);
            root.setBackground(round(C_BG, C_STROKE, dp(a, 16)));

            LinearLayout head = new LinearLayout(a);
            head.setOrientation(LinearLayout.HORIZONTAL);
            head.setGravity(Gravity.CENTER_VERTICAL);
            TextView title = text(a, "Bibliotheek", 20, C_TEXT, true);
            head.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            TextView add = button(a, "+ Huidige zender", C_ACCENT);
            head.addView(add);
            TextView close = button(a, "Sluiten", C_TEXT);
            LinearLayout.LayoutParams clp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            clp.leftMargin = dp(a, 10);
            head.addView(close, clp);
            root.addView(head);

            ScrollView sv = new ScrollView(a);
            final LinearLayout list = new LinearLayout(a);
            list.setOrientation(LinearLayout.VERTICAL);
            sv.addView(list);
            LinearLayout.LayoutParams svp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
            svp.topMargin = dp(a, 12);
            root.addView(sv, svp);

            d.setContentView(root);
            fill(a, d, list);

            close.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) { d.dismiss(); }
            });
            add.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    int f = currentFmFreq();
                    if (f < 0) {
                        Toast.makeText(a, "Kies eerst een FM-zender", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    String name = "";
                    RadioDefine.RadioDataV1 dd = data();
                    if (dd != null && dd.psText != null) name = dd.psText.trim();
                    if (name.length() == 0) {
                        try {
                            String n = new SaveStationNameUtil(a).getStationName(fmt(f));
                            if (n != null) name = n.trim();
                        } catch (Throwable ignored) {
                        }
                    }
                    edit(a, d, list, -1, name, f);
                }
            });

            d.show();
            Window w = d.getWindow();
            if (w != null) {
                w.setBackgroundDrawableResource(android.R.color.transparent);
                DisplayMetrics dm = a.getResources().getDisplayMetrics();
                w.setLayout((int) (dm.widthPixels * 0.62f), (int) (dm.heightPixels * 0.88f));
                w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                w.setDimAmount(0.6f);
            }
        } catch (Throwable t) {
            Toast.makeText(a, "Zenderlijst kon niet openen", Toast.LENGTH_SHORT).show();
        }
    }

    static void fill(final Activity a, final Dialog d, final LinearLayout list) {
        list.removeAllViews();
        final List<St> items = load(a);
        int cur = currentFmFreq();
        if (items.isEmpty()) {
            TextView e = text(a, "Nog geen zenders. Kies een zender en tik op \u201c+ Huidige zender\u201d.", 16, C_TEXT2, false);
            e.setSingleLine(false);
            e.setPadding(0, dp(a, 20), 0, 0);
            list.addView(e);
            return;
        }
        for (int i = 0; i < items.size(); i++) {
            final int idx = i;
            final St s = items.get(i);
            boolean active = s.freq == cur;

            LinearLayout row = new LinearLayout(a);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            int p = dp(a, 10);
            row.setPadding(p, p, p, p);
            row.setBackground(pressable(a, active ? 0xFF16304F : C_ROW, C_ROW_PRESSED));
            row.setClickable(true);

            row.addView(badge(a, s.name));

            LinearLayout txt = new LinearLayout(a);
            txt.setOrientation(LinearLayout.VERTICAL);
            txt.setPadding(dp(a, 14), 0, 0, 0);
            txt.addView(text(a, s.name, 18, active ? C_ACCENT : C_TEXT, true));
            txt.addView(text(a, fmt(s.freq) + " MHz", 14, C_TEXT2, false));
            row.addView(txt, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView ed = button(a, "Bewerk", C_TEXT);
            row.addView(ed);
            TextView del = button(a, "Wis", C_DANGER);
            LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            dlp.leftMargin = dp(a, 8);
            row.addView(del, dlp);

            LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rp.bottomMargin = dp(a, 8);
            list.addView(row, rp);

            row.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    tune(s.freq);
                    d.dismiss();
                }
            });
            ed.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) { edit(a, d, list, idx, s.name, s.freq); }
            });
            del.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    new AlertDialog.Builder(a, AlertDialog.THEME_DEVICE_DEFAULT_DARK)
                            .setTitle("Zender verwijderen?")
                            .setMessage(s.name + " (" + fmt(s.freq) + " MHz) wordt uit de lijst gehaald.")
                            .setNegativeButton("Annuleren", null)
                            .setPositiveButton("Verwijderen", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface di, int w) {
                                    List<St> l = load(a);
                                    if (idx < l.size()) l.remove(idx);
                                    save(a, l);
                                    fill(a, d, list);
                                }
                            })
                            .show();
                }
            });
        }
    }

    static void edit(final Activity a, final Dialog d, final LinearLayout list,
                     final int idx, String name, int freq) {
        LinearLayout box = new LinearLayout(a);
        box.setOrientation(LinearLayout.VERTICAL);
        int p = dp(a, 20);
        box.setPadding(p, dp(a, 8), p, 0);
        final EditText en = new EditText(a);
        en.setHint("Naam");
        en.setSingleLine(true);
        en.setText(name);
        box.addView(en);
        final EditText ef = new EditText(a);
        ef.setHint("Frequentie, bijv. 102.60");
        ef.setSingleLine(true);
        ef.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
        ef.setText(freq > 0 ? fmt(freq) : "");
        box.addView(ef);

        final AlertDialog ad = new AlertDialog.Builder(a, AlertDialog.THEME_DEVICE_DEFAULT_DARK)
                .setTitle(idx < 0 ? "Zender toevoegen" : "Zender bewerken")
                .setView(box)
                .setNegativeButton("Annuleren", null)
                .setPositiveButton("Opslaan", null)
                .create();
        ad.setOnShowListener(new DialogInterface.OnShowListener() {
            public void onShow(DialogInterface di) {
                ad.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
                    public void onClick(View v) {
                        String n = en.getText().toString().trim();
                        int f = parseFreq(ef.getText().toString());
                        if (n.length() == 0) {
                            en.setError("Vul een naam in");
                            return;
                        }
                        if (f < 0) {
                            ef.setError("Tussen 87.50 en 108.00");
                            return;
                        }
                        List<St> l = load(a);
                        if (idx >= 0 && idx < l.size()) {
                            l.get(idx).name = n;
                            l.get(idx).freq = f;
                        } else {
                            l.add(new St(n, f));
                        }
                        save(a, l);
                        fill(a, d, list);
                        ad.dismiss();
                    }
                });
            }
        });
        ad.show();
    }
}
