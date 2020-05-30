#! /bin/sh

echo "<Macro COOKIESECRET>"
echo -n "  SessionCryptoPassphrase "
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20
echo ""
echo "</Macro>"

echo ""

echo "<Macro LOGINSECRET>"
echo -n "  AuthFormSitePassphrase "
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20
echo ""
echo "  AuthName \"Protected Area\""
echo "</Macro>"
