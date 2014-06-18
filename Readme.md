Dodecaphony
-----------

Dodecaphony calculates twelve tone rows for
you. To learn more about what this means, [read
this](http://www.tufts.edu/~mdevoto/12TonePrimer.pdf).

Examples
---

Dodecaphony takes an array of twelve strings, one for each pitch in your
twelve tone row.

```ruby
Dodecaphony::Row.new %w[a a# b c c# d d# e f f# g g#]
```

Each pitch must begin with a valid letter name (a through g) and can be
followed by one or more accidentals. `#`, `+`, `b` and `-` are the four valid
accidentals.

Once you have your row, you can ask it for any prime, inversion, retrograde, or
retrograde inversion like so:

```ruby
tone_row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]

#  "p" followed by 0 through 11 returns the corresponding prime row
tone_row.p0    # ["a", "f#", "g", "ab", "e", "f", "b", "bb", "d", "c#", "c", "eb"]

#  "r" followed by 0 through 11 returns the corresponding retrograde
tone_row.r11   # ["d", "b", "c", "c#", "a", "bb", "e", "eb", "g", "f#", "f", "ab"]

#  "i" followed by 0 through 11 returns the corresponding inversion
tone_row.i2    # ["b", "d", "c#", "c", "e", "eb", "a", "bb", "f#", "g", "ab", "f"]

# "ri" followed by 0 through 11 returns the corresponding retrograde inversion
tone_row.ri6   # ["a", "c", "b", "bb", "d", "c#", "g", "ab", "e", "f", "f#", "eb"]
```

You can also ask a row to respell itself, favoring flats or sharps:
```ruby
tone_row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]

tone_row.spell_with_sharps # ["A", "F#", "G", "G#", "E", "F", "B", "A#", "D", "C#", "C", "D#"]

tone_row.spell_with_flats # ["A", "Gb", "G", "Ab", "E", "F", "B", "Bb", "D", "Db", "C", "Eb"]
```

