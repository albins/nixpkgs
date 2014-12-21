{ stdenv, fetchurl, gobjectIntrospection, gnome3, gtk3, glib, intltool, libtool, pkgconfig, tdb, json_glib, gst_all_1, libnotify, libmtp, clutter, itstool, python3,hicolor_icon_theme, shared_mime_info}:

stdenv.mkDerivation rec {
  name = "rhythmbox-3.1";

  src = fetchurl {
    url = "mirror://gnome/sources/rhythmbox/3.1/${name}.tar.xz";
    sha256 = "2dc4f80080943ba8d2450cc4f9c4978f741efa26a6b1599ef68f57f7b2d7fcc1";
  };

propagatedUserEnvPkgs = [ gnome3.gnome_themes_standard
                      gnome3.gnome_icon_theme hicolor_icon_theme
                      shared_mime_info
                      gnome3.gnome_icon_theme_symbolic
                      gnome3.gsettings_desktop_schemas];

  buildInputs = [gobjectIntrospection intltool glib gtk3 libtool pkgconfig gnome3.libsoup gnome3.libpeas tdb json_glib gnome3.totem-pl-parser gst_all_1.gstreamer gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly libnotify libmtp clutter itstool python3 gnome_desktop gsettings_desktop_schemas];

#  configurePhase = ''
#  ./autogen.sh --prefix=$out
#  '';

# From the Empathy package
preFixup = ''
for f in $out/bin/* $out/libexec/*; do
wrapProgram $f \
            --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
            --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS:${gtk3}/share:${gnome3.gnome_themes_standard}/:${gnome3.gnome_themes_standard}/share:${hicolor_icon_theme}/share:$out/share:$GSETTINGS_SCHEMAS_PATH"
done
rm $out/share/icons/hicolor/icon-theme.cache
'';

  meta = {
    homepage = https://wiki.gnome.org/Apps/Rhythmbox;
    description = "Rhythmbox is a music playing application for GNOME.";
    # license = with stdenv.lib.licenses; mit;
    maintainers = with stdenv.lib.maintainers; [ albins ];
    platforms = with stdenv.lib.platforms; linux;
  };
}
