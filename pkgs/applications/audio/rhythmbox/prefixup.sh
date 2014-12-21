for f in $out/bin/* $out/libexec/*; do
wrapProgram $f \
--set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
--prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk3}/share:${gnome3.gnome_themes_standard}/:${gnome3.gnome_themes_standard}/share:${hicolor_icon_theme}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
done
rm $out/share/icons/hicolor/icon-theme.cache
