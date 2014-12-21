{ stdenv, fetchurl, gobjectIntrospection, gnome3, gtk3, glib, intltool, libtool, pkgconfig, tdb, json_glib, gst_all_1, libnotify, libmtp, clutter, itstool, python3, hicolor_icon_theme, shared_mime_info, makeWrapper}:

stdenv.mkDerivation rec {
  name = "rhythmbox-3.1";

  src = fetchurl {
    url = "mirror://gnome/sources/rhythmbox/3.1/${name}.tar.xz";
    sha256 = "2dc4f80080943ba8d2450cc4f9c4978f741efa26a6b1599ef68f57f7b2d7fcc1";
  };

  buildInputs = with gnome3;
  [gobjectIntrospection intltool glib gtk3 libtool
   pkgconfig libsoup libpeas tdb json_glib totem-pl-parser
   gst_all_1.gstreamer gst_all_1.gst-plugins-base
   gst_all_1.gst-plugins-good gst_all_1.gst-plugins-ugly
   libnotify libmtp clutter itstool python3 gnome_desktop
   gsettings_desktop_schemas gnome_themes_standard hicolor_icon_theme
   gnome_icon_theme gnome_icon_theme_symbolic makeWrapper];

#  configurePhase = ''
#  ./autogen.sh --prefix=$out
#  '';

# From the Empathy package
preFixup = ./prefixup.sh;

  meta = {
    homepage = https://wiki.gnome.org/Apps/Rhythmbox;
    description = "Rhythmbox is a music playing application for GNOME.";
    # license = with stdenv.lib.licenses; mit;
    maintainers = with stdenv.lib.maintainers; [ albins ];
    platforms = with stdenv.lib.platforms; linux;
  };
}
