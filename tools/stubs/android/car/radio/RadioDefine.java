package android.car.radio;
public class RadioDefine {
    public static boolean isFmBand(int i) { return false; }
    public static class FreqInfo { public int bandIndex; public int bandType; public int freq; }
    public static class RadioDataV1 { public FreqInfo mainFreq; public String psText; }
}
