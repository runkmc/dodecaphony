Dodecaphony
-----------

Dodecaphony calculates twelve tone rows for
you. To learn more about what this means, [read
this](http://www.tufts.edu/~mdevoto/12TonePrimer.pdf).

Dodecaphony is a ruby gem. Install with
```
gem install dodecaphony
```

Examples
---

First, you'll need a `Dodecaphony::Row` object. `Dodecaphony::Row`
requires an array of 12 strings, each representing a unique pitch. Each
pitch must begin with a valid letter name (a through g) and can be
followed by one or more accidentals. `#`, `+`, `b` and `-` are the four
valid accidentals.

```ruby
my_row = Dodecaphony::Row.new %w[a a# b c c# d d# e f f# g g#]
```
A row can be converted to either an array of pitch names, or a string with
pitch names separated by a space.
```ruby
my_row.to_a    # ['a', 'a#', 'b', 'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#']

my_row.to_s    # "a a# b c c# d d# e f f# g g#"
```
You can also ask a row to respell itself, favoring flats or sharps:
```ruby
tone_row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]

tone_row.spell_with_sharps # ["A", "F#", "G", "G#", "E", "F", "B", "A#", "D", "C#", "C", "D#"]

tone_row.spell_with_flats # ["A", "Gb", "G", "Ab", "E", "F", "B", "Bb", "D", "Db", "C", "Eb"]
```
The `Dodecaphony::Calculator` class initializes with a `Dodecaphony::Row`
object.
```ruby
tone_row = Dodecaphony::Row.new %w[ a f# g ab e f b bb d c# c eb ]
calc = Dodecaphony::Calculator.new tone_row
```
The calculator can then return any prime, inversion, retrograde, or retrograde
inversion. Each of these rows is a method of the calculator object, the names
being the initial of the type of row you want, followed by the number of the
row you want. Observe:
```ruby
#  "p" followed by 0 through 11 returns the corresponding prime row
tone_row.p0    # ["a", "f#", "g", "ab", "e", "f", "b", "bb", "d", "c#", "c", "eb"]

#  "r" followed by 0 through 11 returns the corresponding retrograde
tone_row.r11   # ["d", "b", "c", "c#", "a", "bb", "e", "eb", "g", "f#", "f", "ab"]

#  "i" followed by 0 through 11 returns the corresponding inversion
tone_row.i2    # ["b", "d", "c#", "c", "e", "eb", "a", "bb", "f#", "g", "ab", "f"]

# "ri" followed by 0 through 11 returns the corresponding retrograde inversion
tone_row.ri6   # ["a", "c", "b", "bb", "d", "c#", "g", "ab", "e", "f", "f#", "eb"]
```
