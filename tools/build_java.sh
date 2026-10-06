#!/usr/bin/env bash
# Bouwt src/ModStations.java opnieuw naar smali (alleen nodig als je de Java aanpast).
# Benodigd: JDK (javac), android.jar (API 28), dx.jar en apktool.jar.
#   ANDROID_JAR=... DX_JAR=... APKTOOL_JAR=... ORIGINAL_APK=Radio.apk tools/build_java.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
: "${ANDROID_JAR:?zet ANDROID_JAR naar android.jar (API 28)}"
: "${DX_JAR:?zet DX_JAR naar dx.jar}"
: "${APKTOOL_JAR:?zet APKTOOL_JAR naar apktool.jar}"
: "${ORIGINAL_APK:?zet ORIGINAL_APK naar de originele Radio.apk}"
TMP="$(mktemp -d)"
mkdir -p "$TMP/out" "$TMP/only/android/car/app/radio"
javac -source 8 -target 8 -bootclasspath "$ANDROID_JAR" -cp "$ANDROID_JAR" -d "$TMP/out" -Xlint:-options \
  $(find "$ROOT/tools/stubs" "$ROOT/src" -name '*.java')
cp "$TMP"/out/android/car/app/radio/ModStations*.class "$TMP/only/android/car/app/radio/"
java -cp "$DX_JAR" com.android.dx.command.Main --dex --min-sdk-version=23 --output="$TMP/classes.dex" "$TMP/only"
# apktool gebruiken als disassembler: dex in een kopie van de APK stoppen en uitpakken
cp "$ORIGINAL_APK" "$TMP/f.apk"
(cd "$TMP" && zip -q f.apk classes.dex && java -jar "$APKTOOL_JAR" d -f -r f.apk -o dec >/dev/null)
rm -f "$ROOT"/mod/smali/android/car/app/radio/ModStations*.smali
cp "$TMP"/dec/smali/android/car/app/radio/ModStations*.smali "$ROOT/mod/smali/android/car/app/radio/"
rm -rf "$TMP"
echo "Klaar: mod/smali/android/car/app/radio/ModStations*.smali bijgewerkt"
