@ECHO OFF

msiexec /a %1 /qb TARGETDIR="%2"
