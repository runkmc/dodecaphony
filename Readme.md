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
Dodecaphony.new %w[a a# b c c# d d# e f f# g g#]
```

Each pitch must begin with a valid letter name (a through g) and can be
followed by one or more accidentals. `#`, `+`, `b` and `-` are the four valid
accidentals.

Once you have your row, you can ask it for any prime, inversion, retrograde, or
retrograde inversion like so:

```ruby
tone_row = Dodecaphony.new %w[ A ab a# b c c# d eb e f gb g ]

tone_row.p0    # ["a", "f#", "g", "ab", "e", "f", "b", "bb", "d", "c#", "c", "eb"]
```
