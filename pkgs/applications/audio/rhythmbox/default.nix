{ stdenv, fetchurl, gobjectIntrospection, gnome3}:

stdenv.mkDerivation rec {
  name = "rhythmbox-3.1";

  src = fetchurl {
    url = "mirror://gnome/sources/rhythmbox/3.1/${name}.tar.xz";
    sha256 = "2dc4f80080943ba8d2450cc4f9c4978f741efa26a6b1599ef68f57f7b2d7fcc1";
  };

  buildInputs = [gobjectIntrospection ];

#  configurePhase = ''
#  ./autogen.sh --prefix=$out
#  '';

  meta = {
    homepage = https://wiki.gnome.org/Apps/Rhythmbox;
    description = "Rhythmbox is a music playing application for GNOME.";
    # license = with stdenv.lib.licenses; mit;
    maintainers = with stdenv.lib.maintainers; [ albins ];
    platforms = with stdenv.lib.platforms; linux;
  };
}
