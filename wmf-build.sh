#!/bin/bash
CWD="`pwd`"
EXTENSIONDIR="$CWD/modules/zotero"
XPCOMDIR="$EXTENSIONDIR/chrome/content/zotero/xpcom"
BUILDDIR="$CWD/deploy"

rm -rf "$BUILDDIR"
mkdir "$BUILDDIR"

mkdir -p "$BUILDDIR/defaults/preferences"

mkdir "$BUILDDIR/translation-server"
cp -r "$CWD/src/"* \
	"$XPCOMDIR/rdf" \
	"$XPCOMDIR/cookieSandbox.js" \
	"$XPCOMDIR/date.js" \
	"$XPCOMDIR/debug.js" \
	"$XPCOMDIR/file.js" \
	"$XPCOMDIR/http.js" \
	"$XPCOMDIR/openurl.js" \
	"$XPCOMDIR/server.js" \
	"$XPCOMDIR/utilities.js" \
	"$XPCOMDIR/utilities_translate.js" \
	"$XPCOMDIR/xregexp" \
	"$EXTENSIONDIR/chrome/content/zotero/tools/testTranslators/translatorTester.js" \
	"$BUILDDIR/translation-server"

mkdir "$BUILDDIR/translation-server/connector"
cp -r "$XPCOMDIR/connector/cachedTypes.js" \
	"$XPCOMDIR/connector/translator.js" \
	"$XPCOMDIR/connector/typeSchemaData.js" \
	"$BUILDDIR/translation-server/connector"

mkdir "$BUILDDIR/translation-server/translation"
cp -r "$XPCOMDIR/translation/tlds.js" \
	"$XPCOMDIR/translation/translate.js" \
	"$XPCOMDIR/translation/translate_firefox.js" \
	"$BUILDDIR/translation-server/translation"

mkdir "$BUILDDIR/translation-server/resource"
cp -r "$EXTENSIONDIR/resource/q.js" "$BUILDDIR/translation-server/resource"

echo "content translation-server translation-server/" >> "$BUILDDIR/chrome.manifest"
echo "resource zotero translation-server/resource/" >> "$BUILDDIR/chrome.manifest"

find "$BUILDDIR" -depth -type d -name .svn -exec rm -rf {} \;
find "$BUILDDIR" -name .DS_Store -exec rm -rf \;
find "$BUILDDIR" -name '._*' -exec rm -rf \;
