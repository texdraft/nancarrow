\version "2.24.3"

ostinatoC = \relative {
  c,8[ c' dis, e] g[ dis e d]
}

ostinatoF = \relative {
  f,8[ f' gis, a] c[ gis a g]
}

ostinatoG = \relative {
  g,8[ g' ais, b] d[ ais b a]
}

ostinato = {
  \ostinatoC |
  \ostinatoC |
  \ostinatoC |
  \ostinatoC |
  \ostinatoF |
  \ostinatoF |
  \ostinatoC |
  \ostinatoC |
  \ostinatoG |
  \ostinatoG |
  \ostinatoC |
  \ostinatoC | 
}

melody = \relative {
  % page 1
  \time 4/4
  \clef "treble^8"
  r2 r4 r8. \grace dis'''8 <e g>16~( |
  4 c8-.) r r <f, a>4.~( |
  4. <dis fis>8 <e g>-.) r <aes c d>4~( |

  4. g8-.) r4 \grace e8 dis4~ |
  dis8 c-. c-. c-. r4 r8. \grace e'8 <dis g>16~( |
  4 c8-.) r8 r8 % r4 in the original
    <f, a>4.~( | 

  4. <es fis>8 g-.) r4 d8( |
  gis[ a] <dis, e g c>-.) r r4 <dis e g c>8-. d( |
  gis[ a] <dis, e g c>-.) r4 <dis e g c>8 r g( |
  
  cis[ d] <gis, a c f>-.) r4 <gis a c f>8-. r g( |
  cis[ d] <gis, a c f>-.) r8 r4 <gis a c f>8-. r8 |
  cis([ d c a] g-.) \grace e8( dis4 c8-.) |

  % page 2
  c-.[ c-.] r4 r4 r8. <a' c dis>16[ | 
  e' g] <a, c dis>[ e' g] r8. r8 <f, a>16[ <gis c>] <f a>16[ <gis c> <f a> <gis c>] |
  <f a>[ <gis c> <f a> <gis c>] <f a>[ <gis c> <dis fis>8( ] <e g>-.) r8 <gis d'>16[ <c, a'> <gis' d'> <c, a'>] |

  <gis' d'>[ <c, a'> <gis' d'> <c, a'>] <gis' d'> <c, a'> g'8-. % g16 in original
    r4 dis16[ e dis e] |
  dis e c8-. 8-. 8-. r4 r8. <a' c g'>16[ |
  e' dis] <a c g'>[ e' dis] r8. r8 <gis, c>16 <f a> <gis c> <f a> <gis c> <f a> |

  <gis c> <f a> <gis c> <f a> <gis c> <f a> <e g>8-. es-. r4 d8( |
  gis a <e c'>16) <dis g> <e c'> <dis g> <e c'> <dis g> <e c'> <dis g> <e c'>8-. d( |
  gis a <e c'>16) <dis g> <e c'> <dis g> <e c'> <dis g> <e c'>8-. r g( |

  cis d <a f'>16) <gis c> <a f'> <gis c> <a f'> <gis c> <a f'>8-. r g( |
  cis d <a f'>16) <gis c> <a f'> <gis c> <a f'> <gis c> <a f'> <gis c> <a f'>8 % no staccato as in original
    r8 |
  <dis, e cis'>16[ d' c a g] <dis e cis'>[ d' c a g] <dis e cis'>[ d' c a g es] |

  % page 3
  c8-. 8-. r4 r2 |
  \grace dis'8 e8[ g16] \grace dis8 e8[ g16] \grace dis8 e8[ g16] <e, g c d>8-. r4 <e g c d>16 |
  r4 r16 \grace e'8 dis8[ c16] \grace e8 dis8[ c16] \grace e8 dis8[ c16] <g' a dis' e>8-. |

  r4 <g a dis' e>8-. r4 \grace gis,8 a8[ c16] \grace gis8 a8[ c16] |
  \grace gis,8 a8[ c16] <f gis a cis d>8-. r4 <f gis a cis d>8-. r8. r8 |
  \grace a,8 gis8[ f16] \grace a,8 gis8[ f16] \grace a,8 gis8[ f16] <c, f gis a>8-. r4 <f'' gis a cis d>16 |

  r4 r16 <c,,, f gis a>8-. r16 <f'' gis a cis d>8-. r4 <c,,, f gis a>8-. |
}

\score {
  \new StaffGroup <<
    \new Staff { \tempo 2 = 120 \melody }
    \new Staff {
      \clef bass
      \time 4/4
      \ostinatoC
      \repeat unfold 22 \ostinato
    }
  >>
  \layout {
    \enablePolymeter
    \context {
      \Score
      \RemoveAllEmptyStaves
    }
  }
  \midi {
  }
}