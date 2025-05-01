# Engraving Nancarrow

## Issues

The biggest difficulty is that I am not that good with Lilypond. XD

### Xenochrony

Polytempo and polymeter mess up some invariants that good engraving practice assumes. For example, time signature changes in one staff invariably disrupt the spacing of the other staves. Nancarrow handwrote his scores in pen or pencil and could make time signatures small and unobtrusive, writing them above the music if necessary. Bartók used a similar style at times in conventionally engraved music (e.g., [Bagatelles](https://www.youtube.com/watch?v=2iaprGXqViY)).

A bigger challenge lies in the works that use non-durational notation, where horizontal spacing is the only indication of rhythm. These scores enjoy none of the clarity and redundancy of traditional Western rhythmic notation and are not amenable to Lilypond input. Some (like #23) contain both non-durational and conventional rhythm, so we might be able to work with them. Otherwise, we will have to obtain physical reproductions of the manuscripts and do a lot of measuring.

### Ottavas

The scores contain many passages with 8va/8vb lines, often spanning many pages. I think it would be better to use octave clefs, or maybe a Sorabji-like **Î** notation.

### ~

Nancarrow uses a tilde notehead to mean a duration of five eighth notes. It's unclear to me whether this was a mere abbreviation or supposed to indicate metrical structure better. If the former, we can readily replace `~`s with their expansion, at the cost of cluttering the scores; if the latter, we should probably keep them. In any case, for documentation we should *probably* keep track of what notes were tildes in the source material, by using something like a `\tildeNote` function.

### Critical edition

There are many minor errors in the scores; see [Nemire's list](https://web.archive.org/web/20160123114909/http://homepages.wmich.edu/~jscriven/Nancarrow%20scores-Errata.pdf) (which is not exhaustive) for examples. Thus corrections will have to be made, and they should be recorded.

## The music

See https://www.youtube.com/watch?v=AfmVJmQKdj4

Also [String Quartet 3](https://www.youtube.com/watch?v=cE9EgqCPNNA).

### Simple studies (should be a data entry task more than anything)

* #1 (polymeter, tuplet-equivalent polytempo)
* #2 (polytempo)
* #3 (polymeter)
* #4 (polymeter)
* #5 (polymeter)
* #6 (polytempo—all measures line up)
* #7 (polymeter)
* #10 (polymeter)
* #11 (polymeter)
* #12 (polymeter)
* #13 (polytempo)
* #14 (basic tempo canon)
* #15 (basic tempo canon with a tempo switch at convergence point)
* #16 (polytempo)
* #18 (basic tempo canon)
* #19 (basic tempo canon; note weird barlines)
* #26 (in 1/1)
* #31 (basic tempo canon)
* #36 (basic tempo canon)

### Studies with tricky polytempo (tempo switches etc.)

* #9
* #17
* #24
* #33
* #34
* #37
* #40
* #41
* #43

### Studies with non-durational portions

* #8
* #20 (was punched on a grid, but still)
* #21
* #22
* #23
* #25
* #27
* #28
* #29
* #35
* #45
* #46
* #48
* #49
* #50
