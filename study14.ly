\version "2.24.3"

data = \absolute {
  \time 3/8
  gis4. \bar "|"
  \time 4/8
  fis8[ e c fis,] \bar "|"
  \time 6/8
  b,4.~ 4 d8 \bar "|"
  \time 3/8
  r4 dis8 \bar "|"
  \time 2/8
  e8 r8 \bar "|"
  \time 6/8
  r8 b,[ a, f,] r e \bar "|"
  \time 5/8
  dis8 r4. c'8 \bar "|"
  \time 3/8
  b8 r4 \bar "|"
  a4. \bar "|"
  \time 4/8
  gis8 r4. \bar "|"
  \time 5/8
  e8[ dis b, c] r8 \bar "|"
  g2 fis8 \bar "|"
  \time 2/8
  e8 r \bar "|"
  \time 4/8
  a8 r4. \bar "|"
  \time 5/8
  c'4.~ 4 \bar "|"
  \time 4/8
  b8 r4. \bar "|"
  \time 3/8
  d'4. \bar "|"
  \time 5/8
  cis'8 r4. e'8 \bar "|"
  \time 3/8
  a8 r4 \bar "|"
  \time 5/8
  fis,8[ g, e,] r4 \bar "|"
  \time 4/8
  d8 r4 g8 \bar "|"
  \time 3/8
  fis8 r4 \bar "|"
  \time 5/8
  b4.~ 4 \bar "|"
  \time 4/8
  c'8 r4 gis8 \bar "|"
  \time 5/8
  a8 r4 cis'8 b \bar "|"
  \time 4/8
  r4 fis8 e \bar "|"
  c8 r4. \bar "|"
  \time 3/8
  r4. \bar "|"
  fis'8 r4 \bar "|"
  \time 5/8
  r4. cis8[ fis] \bar "|"
  g8 r4. a8 \bar "|"
  \time 4/8
  d8 r4. \bar "|"
  \time 6/8
  r4 g8 r4. \bar "|"
  \time 5/8
  d8 r2 \bar "|"
  \time 4/8
  fis8 r4. \bar "|"
  \time 3/8
  b'8 r8 cis' \bar "|"
  \time 4/8
  d'8 r b r \bar "|"
  \time 5/8
  e'8 r4. g8 \bar "|"
  \time 4/8
  c'8 r4. \bar "|"
  b8 r4. \bar "|"
  r4. d8 \bar "|"
  cis8[ fis] r4 \bar "|"
  cis'8[ f e a] \bar "|"
  \time 3/8
  c'4. \bar "|"
}

\score {

<<
  \new Staff {
    \clef bass
    \set Staff.measureBarType = ""
    \tempo 4 = 88
    \scaleDurations 100/88 {\data}
  }
  \new Staff {
    \clef treble
    \set Staff.measureBarType = ""
    \scaleDurations 100/88 {r1 r1 r1 r1 r8 \scaleDurations 4/5 {r16.} \bar "|"}
    \tempo 4 = 110
    \scaleDurations 100/110 {\transpose gis dis''' \data}
  }
>>

  \layout {
    \enablePolymeter
    \context {
      \Score
      \RemoveAllEmptyStaves
      forbidBreakBetweenBarLines = ##f
      \remove Metronome_mark_engraver
      \override SpacingSpanner.uniform-stretching = ##t
    }
    \context {
      \Voice
      \consists Metronome_mark_engraver
      \remove Forbid_line_break_engraver
    }
  }

  \midi {
    \context {
      \Score
      \remove Tempo_performer
      \remove Time_signature_performer
    }
  }
}