\version "2.24.3"

% 840 notes before convergence
% 46 2/3 

#(define (naturalize-pitch p)
   (let ((o (ly:pitch-octave p))
         (a (* 4 (ly:pitch-alteration p)))
         ;; alteration, a, in quarter tone steps,
         ;; for historical reasons
         (n (ly:pitch-notename p)))
     (cond
      ((and (> a 1) (or (eqv? n 6) (eqv? n 2)))
       (set! a (- a 2))
       (set! n (+ n 1)))
      ((and (< a -1) (or (eqv? n 0) (eqv? n 3)))
       (set! a (+ a 2))
       (set! n (- n 1))))
     (cond
      ((> a 2) (set! a (- a 4)) (set! n (+ n 1)))
      ((< a -2) (set! a (+ a 4)) (set! n (- n 1))))
     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))
     (ly:make-pitch o n (/ a 4))))

#(define (naturalize music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map naturalize es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (naturalize e)))
     (if (ly:pitch? p)
         (begin
           (set! p (naturalize-pitch p))
           (ly:music-set-property! music 'pitch p)))
     music))

naturalizeMusic =
#(define-music-function (m)
   (ly:music?)
   (naturalize m))

music = \relative {
  \time 4/4
  c,1~ \bar "|"
  2.~ 8. cis32[ d] \bar "|"
  es1~ \bar "|"

  es1~ \bar "|"
  es1 \bar "|"
  aes,4 r2. \bar "|"

  aes4 r2. \bar "|"
  r2. r8 r32 gis[ a ais] \bar "|"
  b4 r2. \bar "|"

  b4 r2 r8 aes32[ g ges f] \bar "|"
  e1~ \bar "|"
  e1~ \bar "|"

  e1~ \bar "|"
  e2.~ e8~ e32[ f a c] \bar "|"
  e4 r2. \bar "|"

  % page 2
  e4 r2. \bar "|"
  r2. r8 r32 g[ ges f] \bar "|"
  e1~ \bar "|"

  e1~ \bar "|"
  e1~ \bar "|"
  e1 \bar "|"

  es4 r2 r8 a,32[ ais b c] \bar "|"
  des1~ \bar "|"
  des1~ \bar "|"

  des1~ \bar "|"
  des2.~ 8~[ 32 des, f aes] \bar "|"
  c4 r2. \bar "|"

  % page 3
  r1 \bar "|"
  r1 \bar "|"
  bes4 r2 r8 b,32[ c cis d] \bar "|"

  es4 r2. \bar "|"
  r1 \bar "|"
  r1 \bar "|"

  r2. r16 a'32[ f d b g e] \bar "|"
  c1~ \bar "|"
  c1~ \bar "|"

  % page 4
  c1~ \bar "|"
  c1 \bar "|"
  b4 r2. \bar "|"

  r1 \bar "|"
  r1 \bar "|"
  r1 \bar "|"

  r2. r16. g'32[ gis a as b] \bar "|"
  c4. b32[ bes a aes] g8 r4. \bar "|"
  fis2 g8 r4. \bar "|"

  % page 5
  d'4.~ 16[ des32 c] b8 r4. \bar "|"
  r2. r8 r32 bes[ a aes] \bar "|"
  g1~ \bar "|"
 
  g1~ \bar "|"
  g1~ \bar "|"
  g2.~ 16.[ d'32 bes g es c] \bar "|"
 
  aes1 \bar "|"
  g4 r2. \bar "|"
  r1 \bar "|"
 
  % page 6
  r1 \bar "|"
  r4. r32 b[ dis fis] b4.~ 32[ des, f aes] \bar "|"
  des4.~ 32[ es, g bes] es4.~ 32[ e, gis b] \bar "|"

  e4.~ 32[ fis, ais cis] fis4.~ 16.[ des,32 f aes c e] \bar "|"
  g1~ \bar "|"
  g1~ \bar "|"

  g1~ \bar "|"
  g4.~ 32[ dis e f] fis8 r4. \bar "|"
  r1 \bar "|"

  % page 7
  r1 \bar "|"
  r1 \bar "|"
  r1 \bar "|"

  r1 \bar "|"
  r1 \bar "|"
  r1 \bar "|"

  r2. r8 d32[ dis e f] \bar "|"
  ges1 \bar "|"
  f8 r4 r32 d[ dis e] f8 r4. \bar "|"

  % page 8
  r2. r8 r32 ges[ f e] \bar "|"
  dis4 r2 r8 r32 cis[ d dis] \bar "|"
  e4 r2 r8 r32 f[ e es] \bar "|"

  d4 r2 r8 a32[ ais b c] \bar "|"
  cis2 fis,8 r4. \bar "|"
  r1 \bar "|"

  r1 \bar "|"
  r1 \bar "|"
  \set tieWaitForNote = ##t
  e8 r4. r16 es[~ g~] <es g bes>2~ \bar "|"

  % page 9 
  1~ \bar "|"
  2.~ 8~ [16 b'32 c] \bar "|"
  cis8 r4. d,8 r4. \bar "|"

  r4. r32 g[ c es] g2~ \bar "|"
  g4.~ 16[ d dis] e2 \bar "|"
  c4 r2 r8. cis32[ d] \bar "|"

  es1~ \bar "|"
  es1 \bar "|"
  d4 r2. \bar "|"

  % page 10
  r2. r8 aes32[ g ges f] \bar "|"
  e1~ \bar "|"
  e1~ \bar "|"

  e2.~ e8[ cis32 d] \bar "|"
  es2 d8 r4. \bar "|"
  r4. r8 cis32[ d dis e] \bar "|"

  f8 r4 r32 aes[ g ges] f2~ \bar "|"
  f1~ \bar "|"
  f4.~ f32[ cis d dis] e8 r4. \bar "|"

  % page 11
  r1 \bar "|"
  r1 \bar "|"
  r1 \bar "|"

  r1 \bar "|"
  d'8 r4 r32 des,[ f aes] des2~ \bar "|"
  des2.~ 8.[ d32 dis] \bar "|"

  % 102 × 4/4
  \time 6/4
  % 1 × 6/4
  f8 r4. r2 \bar "|"
  \time 2/4
  fis2~ \bar "|"
  4.~ 16[ g32 gis] \bar "|"
  a2~ \bar "|"

  % page 12
  a2~ \bar "|"
  a2 \bar "|"
  d,8 r4. \bar "|"
  d8 r4. \bar "|"
  r4. r16 dis32[ e] \bar "|"
  f8 r4. \bar "|"

  f8 r4 d32[ des c b] \bar "|"
  bes2~ \bar "|"
  bes2~ \bar "|"
  bes2~ \bar "|"
  bes~ 32[ b dis fis] \bar "|"
  ais8 r4. \bar "|"

  ais8 r4. \bar "|"
  r4. r32 des32[ c b] \bar "|"
  bes2~ \bar "|"
  bes2~ \bar "|"
  bes2~ \bar "|"
  bes2 \bar "|"

  % page 13
  a8 r4 dis,32[ e f fis] \bar "|"
  g2~ \bar "|"
  g2~ \bar "|"
  g2~ \bar "|"
  g2~ \bar "|"
  g2~ \bar "|"

  g2~ \bar "|"
  g2~ \bar "|"
  g4.~ g32[ d dis e] \bar "|"
  f4 f,8 r8 \bar "|"
  r4 f8 r8 \bar "|"
  r2 \bar "|"

  f8 r4 \bar "|"
  r4 ges8 r8 \bar "|"
  r8. dis32[ e] f4 \bar "|"
  bes8 r8 r8. cis,32[ d] \bar "|"
  es8 r4. \bar "|"
  aes8 r4. \bar "|"

  % page 14
  r8. b32[ c] des4 \bar "|"
  g8 r8 r8. dis32[ e] \bar "|"
  f8 r8 r8. ges32[ f] \bar "|"
  e8 r8 e'8 r8 \bar "|"
  r4 e,8 r8 \bar "|"
  r8. dis32[ e] f8 r8 \bar "|"

  f'8 r8 r8. d,32[ dis] \bar "|"
  e8 r8 fis r8 \bar "|"
  gis r a r \bar "|"
  b r cis r \bar "|"
  d r d, r \bar "|"
  dis'4 e8 r8 \bar "|"

  r4 cis8 r8 \bar "|"
  d8 r8 cis8 r8 \bar "|"
  dis4 e8 r \bar "|"
  r4. r32 es,,~[ g~ bes~] \bar "|"
  <es, g bes es>2~ \bar "|"
  4.~ 32[ d~ fis~ a~] \bar "|"

  % page 15
  <d, fis a d>2~ \bar "|"
  2~ \bar "|"
  4.~ 32[ c~ e~ g~] \bar "|"
  <c, e g c>2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  4.~ 32[ b' bes a] \bar "|"
  gis8 r8 cis r \bar "|"
  gis r b r \bar "|"
  g' r f r \bar "|"
  e r des' r \bar "|"
  r8 r32 des,[ f aes] des8 r8 \bar "|"
  r4. r32 des,[ f aes] \bar "|"
  des8 r4. \bar "|"
  r2 \bar "|"
  r2 \bar "|"
  r4. r32 cis,[ d dis] \bar "|"
  e8 r4. \bar "|"
  e4 f8 r8 \bar "|"
  r4 d8 r8 \bar "|"
  r4 d4 \bar "|"
  dis8 r4. \bar "|"
  gis8 r4 r32 b[ fis dis] \bar "|"
  b8 r4. \bar "|"
  r4. r32 e~[ gis~ b~] \bar "|"
  <e, gis b e>2~ \bar "|"
  4.~ 32[ b~ dis~ fis~] \bar "|"
  <b, dis fis b>2~ \bar "|"
  4.~ 32[ c~ e~ g~] \bar "|"
  <c, e g c>2~ \bar "|"
  4.~ 32[ f,~ a~ c~] \bar "|"
  <f, a c f>2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2 \bar "|"
  aes8 r aes' r \bar "|"
  r8 r32 e,[ es d] des8 r \bar "|"
  r4. r32 ais'[ b c] \bar "|"
  d8 r4. \bar "|"
  r8 r32 d,[ des c] b8 r \bar "|"
  bes'8 r a' r \bar "|"
  ges, r f r \bar "|"
  r r32 d[ dis e] f8 r8 \bar "|"
  r4. r32 aes32[ g ges] \bar "|"
  f8 r4. \bar "|"
  bes8 r8 g8 r \bar "|"
  es8 r16 e32[ f] ges4~ \bar "|"
  4.~ 32[ des~ f~ aes~] \bar "|"
  <des, f aes des>2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  4.~ 16[ b32 bes] \bar "|"
  a8 r a' r \bar "|"
  a, r4 r16 c32[ cis] \bar "|"
  d8 r d' r \bar "|"
  d8 r a r \bar "|"
  r8. d,32[ des] c8 r \bar "|"
  cis8 r4 r16 cis32[ d] \bar "|"
  dis8 r e r \bar "|"
  cis r fis r \bar "|"
  gis r a r \bar "|"
  b r c r \bar "|"
  r2 \bar "|"
  r2 \bar "|"
  r2 \bar "|"
  r4. r32 des~[ f~ aes~] \bar "|"
  <des, f aes des>2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  32[ b c cis d dis e f fis g gis ais b c cis] \bar "|"
  d2~ \bar "|"
  d8[ g32 ges f e] es8 r \bar "|"
  ais,32[ b c cis d dis e f fis g gis a ais b c] \bar "|"
  d2~ \bar "|"
  d2~ \bar "|"
  32[ a,, ais b c cis d dis e f fis g gis a aes b] \bar "|"
  c2~ \bar "|"
  c8[ f32 e es d] des8 r8 \bar "|"
  r32 g,,[ gis a ais b c cis d dis e f fis g gis a] \bar "|"
  ais[ b c16~] 4.~ \bar "|"
  2~ \bar "|"
  4.~ c32[ bes,~ d~ f~] \bar "|"
  <bes, d f bes>2~ \bar "|"
  2~ \bar "|"
  8~ 32[ a~ cis~ e~] <a, cis e a>4~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  8~ 32[aes~ c~ es~] <aes, c es aes>4~ \bar "|"
  4.~ 32[c cis d] \bar "|"
  dis8 r b r \bar "|"
  gis r e r \bar "|"
  f r ges r \bar "|"
  f r4. \bar "|"
  r2 \bar "|"
  r4. r32 bes32~[ d~ f~] \bar "|"
  <bes, d f bes>2~ \bar "|"
  4.~ 32[ c b bes] \bar "|"
  a8 r f r \bar "|"
  d r bes r32 a~[ cis~ e~] \bar "|"
  <a, cis e a>2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  2~ \bar "|"
  8.[ a'32 ais b16] r8 bes'32[ a \bar "|"
  aes16] r8 e32[ es d16] r8 dis,32[ e] \bar "|"
  f16 r a'32[ ais b16] r8 ges32[ f \bar "|"
  e16] r d32[ dis e16] r16 e,32[ es d des] \bar "|"
  c2~ \bar "|"
  c4~ 32[ cis d dis e f fis g] \bar "|"
  aes16 r8 b32[ bes a16] r8 c32[ cis \bar "|"
  d16] r4 r16. es32[ d des] \bar "|"
  c2~ \bar "|"
  c4. f32[ fis g gis] \bar "|"
  a8 r aes r \bar "|"
  ges r f r16 ges32[ f \bar "|"
  e16] r4 es,32[ d cis16] r8 gis'32[ a \bar "|"
  bes16] r4. a'32[ ais] \bar "|"
  b16 r4. ais32[ b \bar "|"
  c16] r8 bes32[ a aes16] r8 b32[ c \bar "|"
  cis16] r8 a32[ aes g16] r8 c32[ cis \bar "|"
  d16] r8 aes32[ g fis16] r8 cis'32[ d \bar "|"
  es16] r8 g,32[ ges f16] r8 d'32[ dis \bar "|"
  e16] r8 ges,32[ f e16] r8 dis'32[ e \bar "|"
  f16] r8 f,32[ e es16] r8 e'32[ f \bar "|"
  fis16] r16 r4. \bar "|"
  r8 f8 r bes \bar "|"
  aes[ g] r b \bar "|"
  fis8 f,32[ fis g gis a ais b c cis d dis e] \bar "|"
  f8 r e[ d] \bar "|"
  cis[ fis, b b,] \bar "|"
  r e[ fis g] \bar "|"
  r8. r32 gis[ a ais b c cis d dis e] \bar "|"
  f8 r4.
  r4 aes8[ ges] \bar "|"
  f[ ges] r f \bar "|"
  r c r des \bar "|"
  c r bes r \bar "|"
  f'[ es d] r \bar "|"
  es8 r4. \bar "|"
  r4 r32 g,,[ b d ges bes des f] \bar "|"
  aes8 r4 des,8 \bar "|"
  r8 f[ e c] \bar "|"
  r8 es r16 b32[ c cis d dis e] \bar "|"
  f8 r ges[ f] \bar "|"
  r aes[ g a] \bar "|"
  r2 \bar "|"
  fis,32[ g gis a ais b c cis d dis e f fis g gis a] \bar "|"
  % 213 × 2/4
  bes[ dis, e f fis g gis a bes16] e,32[ f fis g gis a \bar "|"
  bes16] e,32[ f fis g gis a bes16] r32
}


\score {

<<
  \new Staff {
    \clef treble
    \set Staff.measureBarType = ""
    \tempo 1 = 100
    \scaleDurations 100/85 {r4*126}
    {\naturalizeMusic \transpose c, b'' \music}
  }
  \new Staff {
    \clef treble
    \set Staff.measureBarType = ""
    \tempo 1 = 95
    \scaleDurations 100/85 {r4*88 r4*8/19 }
    \scaleDurations 100/95 {\naturalizeMusic \transpose c, g' \music}
  }
  \new Staff {
    \clef bass
    \set Staff.measureBarType = ""
    \tempo 1 = 90
    \scaleDurations 20/17 {r4*46 r4*3/2 }
    \scaleDurations 10/9 {\naturalizeMusic \transpose c, e \music}
  }
  \new Staff {
    \clef bass
    \set Staff.measureBarType = ""
    \tempo 1 = 85
    \scaleDurations 20/17 {\ottava -1 \music}
  }
>>

  \layout {
    \enablePolymeter
    \context {
      \Score
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

}