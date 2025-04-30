\version "2.24.3"

melody = \relative {
  \time 3/4
  R2. |
  R2. |
  R2. |
  R2. |
  \ottava 1
  r4 a''8( cis e4-.) |
  d4-. b-. g-. |
  e8( fis g f e4~ |
  e2.) |
  r4 g'8( f e4~ |
  e8 a, d4-.) c-. |
  b( cis8 dis e4~ |
  e2.) |
  r4 a,8( cis e4-.) |
  d4-. b-. g-. |
  e8( fis g f e4~ |
  e2.) |
  r4 cis'8( dis e4~ |
  e8 b cis4-.) gis-. |
  b( a8 g f4~ |
  f g8 f e4-.) | 
  c-. d-. g,-. |
  e'-. g-. d-. | 
  d-. fis-. a-. |
  b-. cis-. dis-. |
  e-. b-. gis-. |
  e8( fis g f e4~ |
  e2.~ |
  e2.~ 
  e8) r r2 |

  r4 a8( cis e4-.) |
  d4-. b-. g-. |
  e8( fis g f e4~ |
  e2.) |
  r4 g'8( f e4~ |
  e8 a, d4-.) c-. |
  b( cis8 dis e4~ |
  e2.) |
  r4 a,8( cis e4-.) |
  d4-. b-. g-. |
  e8( fis g f e4~ |

  % page 2
  e2.) |
  r4 cis'8( dis e4~ |
  e8 b cis4-.) gis-. |
  b( a8 g f4~ |
  f4 g8 f e4-.) |
  c'4-. d-. g,-. |
  e'-. g-. d~|
  d fis,-. a-. |

  b-. cis-. dis-. |
  e-. b-. gis-. |
  f( g8 f e4~ |
  e2.~ |
  e2.~ |
  e2) gis8( b |
  e8) r4 b8 r4 |
  a'2( g8 f |

  e8) r4 r4. |
  r4. a,,8( cis e |
  a8) r4 b8 r4 |
  cis2( d8 e |
  f8) r4 r4. |
  r4. c,8( e g |
  c) r4 e,8 r4 |
  fis2( g8 a |

  b) r4 b,8( dis fis |
  b) r4 gis8 r4 |
  a2( g8 f |
  e) r4 d8( g b |
  d4-.) b-. cis8( dis |
  e fis gis a g f |
  e d c b cis dis |
  e) r4 r4. |

  R2. |
  r2 e,4-. |
  b'-. d-. a~ |
  a b-. c~ |
  c b-. a-. |
  e'-. g-. d~ |
  d e-. f~ |
  f e-. d-. |

  % page 3
  e2 f4~ |
  f g2 |
  e4-. f-. g-. |
  a2 b4~|
  b c2 |
  a4-. f-. d-. |
  b-. e-. a,~ |
  a fis-. d~ |

  d b'-. g |
  d-. b-. f'~ |
  f g-. f-. |
  e8 r4 \ottava 0 e,8( gis b |
  e) r4 b8 r4 |
  a'2( g8 f |
  e) r r2 |
  r4. a,,8( cis e |

  a) r4 b8 r4 |
  cis2( d8 e |
  f) r r2 |
  r4. c,8( e g |
  c) r4 e,8 r4 |
  fis2( g8 a |
  b) r4 b,8( dis fis |
  b) r4 gis8 r4 |

  a2( g8 f |
  e) r4 d8( g b |
  d4-.) b-. cis8( dis |
  e fis gis a g f |
  e d c b cis dis |
  e) r r2 |
  R2. |
  r2 e,4-.

  b'-. d-. a~ |
  a b-. c~ |
  c b-. a-. |
  e'-. g-. d~ |
  d e-. f~ |
  f e-. d-. |
  e2 f4~ |
  f g2 |

  % page 4
  e4-. f-. g-. |
  a2 b4~ |
  b c2 | 
  a4-. f-. d-. |
  b-. e-. a,~ |
  a fis-. d~ |
  d b'-. g-. |
  d-. b-. f'~ |

  f g-. f-. |
  e-. r2 |
  R2. |
  \time 24/8
%  <<
%    {
%      e'4.~( 4~ 4.~ 4 cis'8) r8 r2 a4. r4 gis4.~ |
%      gis4.~ 4 fis8 r2 r4 gis2~ 8 r4 a4~( a4. |
%      b8) r2 r2 r8 cis4~ 8 r4. d4.~ d4 e8 r4 |
%      r2 r8 gis~ 2~ 8 r8 fis2~( fis4. e8) r8 r4. |
%      es4.~ 4~ 8 r2 bes,4~( bes2 es8) r4 r4 f4.~ |
%      % page 5
%      f8 r2 c'8~( 2~ 4 bes8) r4. r4. aes4~ 8 r4 |
%    }
%    \new Staff {
%      \time 24/8
%      r2 r8 cis,4.~ 4~ cis8 r8 e,2~( 4. gis8) r8 r4. |
%      a4.~ 4~ 8 r2 b4~ b2 a8 r4 r4 gis4.~ |
%      gis8 r2 fis4.~( 4~ 4 e8) r4. r4. d4~ d8 r4 |
%      cis4.~( 4~ 4. 4~) 
%    }
%  >>
}

accompaniment = \relative {
  \time 6/8
  r4. b'8 r4 |
  cis8 r4 dis8 r4 |
  e8 r4 d8 r4 |
  c8 r4 b8 r4 |
  a8 r4 g8 r4 |
  f8 r4 e8 r4 |
  fis8 r4 gis8 r4 |
  a8 r4 b8 r4 |

  e,8 r4 fis8 r4 |
  gis8 r4 a8 r4 |
  g8 r4 f8 r4 |
  e8 r4 d8 r4 |
  c8 r4 b8 r4 |
  a8 r4 b8 r4 |
  cis8 r4 dis8 r4 |
  e8 r4 d8 r4 |

  \clef bass
  c8 r4 b8 r4 |
  a8 r4 g8 r4 |
  f8 r4 e8 r4 |
  fis8 r4 gis8 r4 |
  a8 r4 g8 r4 |
  f8 r4 e8 r4 |
  d8 r4 c8 r4 |
  b8 r4 a8 r4 |

  g8 r4 f8 r4 |
  e8 r4 b8 r4 |
  e8 r4 fis8 r4 |
  gis8 r4 a8 r4 |
  g8 r4 f8 r4 |
  \time 18/8
  <e e'' gis>8 r2
    \clef treble
      <fis'' a>8 r4. <gis b>8 r <a cis> r4 <b d>8 r4. |
  <a c>8 r2 <g b>8 r4. <f a>8 r <e gis> r4 <fis a>8 r4. |
  <gis b>8 r2 <a cis>8 r4. <b d>8 r <a c> r4 <g b>8 r4. |
  <f a>8 r2 <e gis>8 r4. <fis a>8 r <gis b> r4

  % page 2
    <a cis>8 r4. |
  <b d>8 r2 <a c>8 r4. <g b>8 r <f a> r4 <e gis>8 r4. |
  <fis a>8 r2 <gis b>8 r4. <a cis>8 r <b d> r4 <a c>8 r4. |
  <g b>8 r2 <f a>8

    r4. <e gis>8 r8 <fis a> r4 <gis b>8 r4. |
  <a cis>8 r2 <b d>8 r4. <a c>8 r <g b> r4 <f a>8 r4. |
  \time 24/8
  <e gis>8 r2
    \clef bass b8 r2 e,8 r e, r4. c''8 r4 % r8 r8 in original

    g8 r c, r4 |
  c,8 r2 a''8 r2 e8 r a, r4. a,8 r4 f''8 r c r4 |
  f,8 r2 f,8 r2 d'''8 r a r4. d,8 r4 % r8 r8 in original

    d,8 r b'' r4 |
  fis8 r2 b,8 r2 b,8 r g'' r4. d8 g4 g,8 r g, r4 |
  e''8 r2 b8 r2 e,8 r e, r4.
    \clef treble <e''' gis b>8 r4 % r8 r8 in original

    <c e g>8 r <a cis e> r4 |
  \clef bass
  a,,8 r2 a,8 r2 <a''' cis e>8 r <f a c> r4. <d fis a>8 r4 d,8 r d, r4 |
  \clef treble
  <d''' fis a>8 r2 <bes d f>8 r2
    \clef bass <g b d>8 r g, r4. g,8 r4 % r8 r8 in original

  % page 3
      <g'' b d>8 r <e gis b> r4 |
  <c e g>8 r2 c,8 r2 c,8 r <c''' e g>8 r4. <a cis e>8 r4 <f a c>8 r f, r4 |
  f,8 r2 \clef treble <f''' a c>8 r2 <d fis a>8 r <b dis fis> r4.
    \clef bass b,8 r4 % r8 r8 in original

    b,8 r <b'' dis fis> r4
  \time 12/8
  <g b d>8 r2 <e gis b>8 r2 e,8 r8 |
  \time 24/8
  e,8 r2 b'''4.~( b4 e,8) r e, r4. c''8 r4 g8 r c,4.( |
  c,8) r2 a''8

    r2 e8 r a, r4. a,4.( f''8) r c r4 |
  f,4.~( 4 f,8) r2 d'''8 r a r4. d,4.( d,8) r b'' r4 |
  fis4.~( 4 b,8)

    r2 b,8 r g'' r4. d4.( g,8) r g, r4 |
  e''8 r2 b4.~( 4 e,8) r e, r4.
    \clef treble <e''' gis b>4.( <c e g>8) r
    \clef bass <a cis e>4.( |
  a,8) r2 a,4.~( % 8 ~ 2 in original

    4 <a'' cis e>8) r <f a c>2( <d fis a>8) r4 d,4( d,8) r4
  \clef treble
  <d''' fis a>4.~( 4 <bes d f>8) r2
    \clef bass <g b d>4( g,8) r4. g,4.( <g'' b d>8) r8 <e gis b>4.( |
  <c e g>8) r2 c,4.~( % 8 ~ 2 in original
  
  % page 4
  4 c,8) r <c''' e g>2( <a cis e>8) r4 <f a c>4( f,8) r4 |
  f,4.~( 4 \clef treble <f''' a c>8) r2 <d fis a>4( <b dis fis>8) r4.
    \clef bass b,4.( b,8) r <b'' dis fis>4.( |
  <g b d>8) r2 <e gis b>8~

    2 e,8 r \ottava -1 e, r4. a1~( |
  \time 36/8
  2.~ 2 a'4) r2. f,4 r f' r2 e,4 r2. |


  e'4 r1 b4 r2. b'4 r ais, r2 ais'4 r2. |
  fis,4 r1 % r2 r2 in original

    fis'4 r2. aes,4 r aes' r2 es,4 r2. |
  es'4 r1 des,4 r2.

  % page 5
    des'4 % missing stem in original
      r4 f, r2 f'4 r2. |
  c,4 r1 c'4 r2. g4 r g' r2 f,4

    r2. |
  f'4 r1 bes,4 r2. bes'4 r es, r2 es'4 r2. |
  aes,,4 r1 % r2 r2 in original

    aes'4 r2. ces,4 r ces' r2 des,4 r2. |
  des'4 r1 ges,,4 r2.

  % page 6
    ges'4 r4 % rest missing in original
    c, r2 c'4 r2. |
  \ottava 0
  des,4 r1 aes'4 r2. f'4 r4 % rest missing in original
    es, r2 bes'4

    r2. |
  g'4 r1 aes,4 r2. es'4 r4 % rest missing in original
    c'4 r2 ces,4 r2. |
  ges4 r1 % r2 r2 in original; first r2 missing

    es'4 r2. \ottava -1 fes,,4 r4 % rest missing
    ces'4 r2 aes'4 r2. |
  ges,4 r1 des4 r2.

  % page 7
    bes'4 r4 aes, r2 es4 r2. |
}

\score {
  \layout {
    \enablePolymeter
  }
  <<
    \new Staff { \tempo 2. = 140 \melody }
    \new Staff { \accompaniment }
  >>
  \midi {
    \enablePolymeter
  }
}