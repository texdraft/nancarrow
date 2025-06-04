\version "2.25.26"

\include "articulate.ly"

% next three things from @maisjene
timeRatio = 
#(define-music-function (frac ratio) (fraction? number?)
  #{ \time #(cons (car frac) (* (cdr frac) ratio))
     \set Staff.timeSignatureFraction = #frac
  #} )

#(define tilde-path '((moveto 0.4 -0.45)
                      (curveto 0.1 -0.2 0 0.5 0.5 0.5)
                      (curveto 0.8 0.5 0.9 0.2 0.8 0)
                      (curveto 0.7 -0.2 0.8 -0.5 1.1 -0.5)
                      (curveto 1.6 -0.5 1.5 0.2 1.2 0.45)))

tilde = #(define-music-function (m) (ly:music?)
  #{ \once\override NoteHead.stem-attachment = #(lambda (grob) (cons (car (ly:note-head::calc-stem-attachment grob)) 0))
     \once\override NoteHead.stencil = #(lambda (grob)
       (grob-interpret-markup grob (markup #:halign -1 #:path 0.2 tilde-path)))
     \scaleDurations 5/4 $m  #} )

% next four things from LSR https://lsr.di.unimi.it/LSR/Item?id=445
#(define (octave-up m t)
 (let* ((octave (1- t))
      (new-note (ly:music-deep-copy m))
      (new-pitch (ly:make-pitch
        octave
        (ly:pitch-notename (ly:music-property m 'pitch))
        (ly:pitch-alteration (ly:music-property m 'pitch)))))
  (set! (ly:music-property new-note 'pitch) new-pitch)
  new-note))

#(define (octavize-chord elements t)
 (cond ((null? elements) elements)
     ((eq? (ly:music-property (car elements) 'name) 'NoteEvent)
       (cons (car elements)
             (cons (octave-up (car elements) t)
                   (octavize-chord (cdr elements) t))))
     (else (cons (car elements) (octavize-chord (cdr elements ) t)))))

#(define (octavize music t)
 (if (eq? (ly:music-property music 'name) 'EventChord)
       (ly:music-set-property! music 'elements (octavize-chord
(ly:music-property music 'elements) t)))
 music)

makeOctaves = #(define-music-function (arg mus) (integer? ly:music?)
 (music-map (lambda (x) (octavize x arg)) (event-chord-wrap! mus)))

lowerOstinato = \relative {
    % page 1
    f,8[(\mp g bes-.]) r d( | \allowBreak
    f,[ g)]-. r bes[( d] | \allowBreak
    f,)-. r g[( bes d)]-. | \allowBreak

    r f,([ g bes-.]) r | \allowBreak
    d([ f, g-.]) r bes( | \allowBreak
    d[ f,]-.) r g[( bes] | \allowBreak

    d-.) r f,([ g bes-.]) | \allowBreak
    r d[( f, g-.)] r | \allowBreak
    bes[( d f,-.)] r g( | \allowBreak

    bes[ d])-. r f,[( g] | \allowBreak
    bes-.) r d[( f, g)]-. | \allowBreak
    r bes[( d f,-.)] r | \allowBreak

    % page 2
    g([ bes d-.]) r f,( | \allowBreak
    g[ bes-.]) r d[( f,] | \allowBreak
    g-.) r bes[( d f,-.)] | \allowBreak

    r g[( bes d-.)] r | \allowBreak
}

upperOstinato = \relative {
  \repeat unfold 8 {
    aes,8-.\mp r des-. r aes-. r |
    des-. r aes-. r des-. r |
  }
}

ostinato = <<
  \new Staff \relative {
    \clef bass
    \time 3/4
    \tempo 4 = 69
    \upperOstinato
    \transpose aes des \upperOstinato
    \upperOstinato
    \transpose aes es \upperOstinato
    \upperOstinato
    \bar "|."
  }
  \new Staff \relative {
    \clef bass
    \time 3/4
    \tempo 8 = 280
    \set Staff.timeSignatureFraction = 5/8
    \scaleDurations 6/5 {
      \lowerOstinato
      \transpose aes des \lowerOstinato
      \lowerOstinato
      \transpose aes es \lowerOstinato
      \lowerOstinato
      \bar "|."
    }
  }
>>

upperuppermelody = \relative {
  \time 3/4
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  \time 1/4
  r4 |
  \timeRatio 10/16 #5/4
  \set Staff.beatStructure = 5,5
  \scaleDurations 4/5 \makeOctaves #1 {
    r2\mf bes8~ |
    \tilde 4~ \tilde 4 |
    \clef bass
    bes,8. \clef treble bes'8~ \tilde bes4 |
    \ottava 1
    bes'8. d8 f,8. g8 |

    bes16 r8 bes8~ \tilde bes4~ |
    \tilde bes4~ bes8. d8 |
    f8. bes8 des,8. c8 |
    \tilde bes4~ % upper flat missing
      \tilde bes4~ |
    \tilde bes4~

    % page 9
      bes8. \ottava 0 bes,8 |
    d8. f8 g16 r8 aes8~ |
    \tilde aes4~ \tilde aes4 |
    f8. a8 c,8. d8 |
    aes8. g8 f16 r8 f~ |

    \tilde f4~ \tilde f4~ |
    \tilde f4 \tilde f'4~ |
    \tilde f4 aes8. f8 |
    a8. c8 es16 r8 des8~ |
    \tilde des4~

      des8. d,8 |
    f8. aes8 c8. a8 |
    bes8. d8 f,8. g8 |
    bes16 r8 bes8 d8. f,8 |
    g16 r8 \ottava 1 bes8~ bes8. d8 |

    % page 10
    f8. bes8 des,8. c8 |
    \tilde bes4~ \tilde bes4~ |
    \tilde bes4~ bes8 r8. \bar "|."
  }
}

uppermelody = \relative {
  \time 3/4
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  \time 1/4
  r4 |


  \timeRatio 1/8 #5/4
  \scaleDurations 4/5 {
    r8 |
    \timeRatio 2/4 #5/4
    \clef bass
    r4 r8.\mf
    <<
      { es'16~ | 2 | }
      \\
      { s16 | <fis, g bes>16 r8. r4 | }
    >>
    es8. es'16~ es4 |
    \clef treble
    es'8. g16 bes,8. c16 |
    <<
      { es16 r8 es16~ 4~ | 4~ 8. g16 | }
      \\
      { r4 <fis, g bes>16 r16 }
    >>

    bes'8. es16 ges,8. f16 |
    es2~ |
    4~ 8. es,16 |
    g8. bes16 c16 r8 
    <<
      { des16~ | 2 }
      \\
      { s16 | <es, fis g>16 r8. r4 }
    >>
    bes'8. d16 f,8. g16 |
    des8. c16 bes16 r8 \clef bass
    <<
      { bes16~ | 2~ | 4 }
      \\
      { s16 | <es, fis g>16 r8. r4 }
    >>
    \clef treble bes''4~ |
    4 des8. bes16 |

    % page 3
    d8. f16 aes16 r8
    <<
      { ges16~ | 4~ 8. g,16 | }
      \\
      { s16 | <fis g bes>16 r8. r4 }
    >>
    bes8. des16 f8. d16 |
    es8. g16 bes,8. c16 |
    es16 r8 es16 g8. bes,16 |
    <<
      { c16 r8 es16~ 8. g16 | }
      \\
      { r4 <fis, g bes>16 r8. }
    >>

    bes'8. es16 ges,8. f16 |
    es2~ |
    4~ 8. bes16~ |
    2 |
    bes,8. bes'16~ 4 |
    \ottava 1
    bes'8. % 8~ 16

      d16 f,8. g16 |
    bes16 r8 bes16~ 4~ |
    4~ 8. d16 |
    f8. bes16 des,8. c16 |
    bes2~ |
    4~ 8.

    % page 4
    \ottava 0
      bes,16 |
    d8. f16 g16 r8 aes16~ |
    2 |
    f8. a16 c,8. d16 |
    aes8. g16 f16 r8 f16~ |
    2~ |
    4

      \ottava 1
      f'4~ |
    4 aes8. f16 |
    a8. c16 es16 r8 des16~ |
    4~ 8. d,16 |
    f8. aes16 c8. a16 |
    bes8. d16 f,8. g16 |
    bes16

      r8 bes16 d8. f,16 |
    g16 r8 bes16~ 8. d16 |
    f8. bes16 des,8. c16 |
    bes2~ |
    2 |
    \ottava 0
    \clef bass
    f,,2 | % 4.~ 8

    % page 5
    f,8. f'16~ 4 |
    \clef treble
    f'8. a16 c,8. d16 |
    f16 r8 f16~ 4~ |
    4~ 8. a16 |
    c8. f16 aes,8. g16 |
    f2~ | % 8.~ 8.~ 8

    4~ 8. f,16 |
    a8. c16 d r8 es16~ |
    2 |
    \clef bass
    c8. e16 g,8. a16 |
    es8. d16 c r8 c16~ |

    % page 6
    2~ |
    4 \clef treble c'~ |
    4 es8. c16 |
    e8. g16 bes16 r8 aes16~ |
    4~ 8. a,16 |
    c8. es16 g8. % 16~ 8

      e16 |
    f8. a16 c,8. d16 |
    f16 r8 f16 a8. c,16 |
    d16 r8 f16~ 8. a16 |
    c8. f16 aes,8. g16 |
    f2 |
    f,8. % 8~ 16

    % page 7
      f'16~ 4 |
    f'8. a16 c,8. d16 |
    f16 r8 f16~ 4~ |
    4~ 8. a16 |
    c8. f16 aes,8. g16 |
    f2~ | % 4~ 8.~ 16

    4~ 8. f,16 |
    a8. c16 d16 r8 es16~ |
    2 |
    c8. e16 g,8. a16 |
    es8. d16 c16 r8 c16~ |
    c2~ | % 4~ 4

    4 c'~ |
    4 es8. c16 |
    e8. g16 bes16 r8 aes16~ |
    4~ 8. a,16 |
    c8. es16 g8. e16 |
    f8. % 16~ 8

    % page 8
      a16 c,8. d16 |
    f16 r8 f16 a8. c,16 |
    d16 r8 f16~ 8. a16 |
    c8. f16 aes,8. g16 |
    f2 \bar "|."
  }
}

middlemelody = \relative {
  \time 3/4
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. |

  \tempo 8. = 115
  \timeRatio 6/16 #5/4
  \scaleDurations 4/5 {
    % page 3
    r4. |
    r8. r8 es'16~\mf |
    4. |
    es,8 es'16~ 8. |
    es'8 g16 b,8 c16 |

    es16 r es~ 8.~ |
    8.~ 8 g16 |
    bes8 es16 ges,8 f16 |
    es4.~ |
    8.~ % missing flag
      8 e,16 |
    g8 bes16 c r des~ |
    4. |
    bes8 d16

    % page 4
      f,8 g16 |
    des8 c16 bes r bes~ |
    4.~ |
    8. bes'~ |
    8. des8 bes16 |
    d8 f16 aes r ges~ |
    8.~ 8 g,16 |
    bes8 des16 f8 d16 |

    es8 g16 bes,8 c16 |
    es r es g8 bes,16 |
    c r es~ 8 g16 |
    bes8 es16 ges,8 f16 |
    e4.~ |
    \timeRatio 5/16 #5/4
    4 bes16~ |
    \timeRatio 10/16 #5/4
    \set Staff.beatStructure = 5,5
    \tilde bes4~ \tilde 4 |

    bes,8. bes'8~ \tilde bes4 |
    \ottava 1
    bes'8. d8 f,8. g8 |
    bes16 r8 bes8~ \tilde bes4~ |
    \tilde bes4~ 8. d8|
    f8. bes8

    % page 5
      des,8. c8 |
    \tilde bes4~ \tilde bes4~ |
    \tilde bes4~ 8. bes,8 |
    d8. f8 g16 r8 aes8~ |
    \tilde aes4~ \tilde aes4 |

    \ottava 0
    f8. a8 c,8. d8 |
    aes8. g8 f16 r8 f8~ |
    \tilde f4~ \tilde f4~ |
    \tilde f4 \ottava 1 \tilde f'4~ |
    \tilde f4

    % page 6
      aes8. f8 |
    a8. c8 es16 r8 des8~ |
    \tilde des4~ 8. d,8 |
    f8. aes8 c8. a8 |
    bes8. d8 f,8. g8 |
    
    bes16 r8 bes8 d8. f,8 |
    g16 r8 bes8~ 8. d8 |
    f8. bes8 des,8. c8 |
    \tilde bes4~ \tilde bes4 \bar "|."
  }
}

middlemelodyagain = \relative {
  \time 3/4
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |

  \timeRatio 6/16 #5/4
  \scaleDurations 4/5 {
    r4. |
    r4. |
    \clef bass
    r8. r8 bes,16~\mf |
    4. |
    bes,8 bes'16~ 8. |
    bes'8 d16 f,8 g16 |
    bes16 r bes~ 8.~ |
    8.~

    % page 9
      8 d16 |
    \clef treble
    f8 bes16 des,8 c16 |
    bes4.~ |
    4 r16 \clef bass bes,16 |
    d8 f16 g r aes~ |
    4. |
    f8 a16 c,8 d16 |
    aes8 g16 f r f~ |
    4.~ |
    
    8. f'8.~ |
    8. aes8 f16 |
    a8 c16 es r des~ |
    8.~ 8 d,16 |
    f8 aes16 c8 a16 |
    bes8 d16 f,8 g16 |
    bes16 r bes

      d8 f,16 |
    g16 r16 \clef treble bes16~ 8 d16 |
    f8 bes16 des,8 c16 |
    bes4. \bar "|."
  }
}

lowermelody = \relative {
  \time 3/4
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  r2. | r2. | r2. |
  r2. | r2. | r2. |
  r2. | r2. | r2. |

  % page 4
  r2. r2. r2.
  r2. r2. r2.
  r2.
  \timeRatio 2/4 #5/4
  \scaleDurations 4/5 {
    r2 |
    r2 |
    r2 |
    r2 |
    % page 5
    r2 |
    r2 |
    r2 |
    r2 |
    r2 |
    r2 |
    r2 |
  }
  \tempo 8. = 115 % 4. = 57.5
  \timeRatio 6/8 #5/4
  \scaleDurations 4/5 {
    r2. |
    r4. r4 f''8~ |
    2. |

    % page 6
    f,4 f'8~ 4. |
    \ottava 1
    f'4 a8 c,4 d8 |
    f8 r f~ f4.~ |
    f4.~ f4 a8 |
    c4 f8 aes,4 g8 |
    f2.~ |
    f4.~ f4 f,8 |

    % page 7
    a4 c8 d r es~ |
    2. |
    c4 e8 g,4 a8 |
    es4 d8 c r c~ |

    2.~ |
    4. c'4.~ |
    c4. es4 c8 |
    e4 g8 bes

      r aes~ |
    4.~ 4 a,8 |
    c4 es8 g4 e8 |
    f4 a8 c,4 d8 |
    f8 r f

    % page 8
      a4 c,8 |
    d8 r f~ f4 a8 |
    c4 f8 aes,4 g8 |
    f2. \bar "|."
  }
}

melodies = \relative {
  <<
    \new Staff {
      \upperuppermelody
    }
    \new Staff {
      \uppermelody
    }
    \new Staff {
      \middlemelody
    }
    \new Staff {
      \middlemelodyagain
    }
    \new Staff {
      \lowermelody
    }
  >>
}

\score {
  \new StaffGroup <<
    \accidentalStyle StaffGroup.modern
    \melodies
    \ostinato
  >>
  \layout {
    \enablePolymeter
    \context {
      \Score
      \RemoveAllEmptyStaves
      %forbidBreakBetweenBarLines = ##f
      \remove Metronome_mark_engraver
    }
    \context {
      \Voice
      \consists Metronome_mark_engraver
      \remove Forbid_line_break_engraver
    }
  }
  \midi {
    \enablePolymeter
  }
}
