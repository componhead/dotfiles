The regular-expression construct `[···]`, usually called a *character class*, lets you list the characters you want to allow at that point in the match.
This particular class might be useful as part of `<H[123456]>`, which matches `<H1>`, `<H2>`, `<H3>`, etc. This can be useful when searching for HTML headers. Within a character class, the character-class metacharacter `-` (dash) indicates a range of characters: `<H[1-6]>` is identical to the previous example. Dot `.` is a metacharacter outside of a class, but not within one. Conversely, a dash `-` is a metacharacter within a class (usually), but not outside.  Moreover, a caret `^` has one meaning outside, another if specified inside a class immediately after `[` (as a negation), and a third if given elsewhere in the class.

A very convenient metacharacter is `|`, which means “or”. It allows you to combine multiple expressions into a single expression that matches any of the individual ones. When combined this way, the subexpressions are called *alternatives*. The alternation is constrained by the parentheses `(` and `)` and can’t be negated like a character class.

You can use the (perhaps odd looking) *metasequences* `\<` and `\>` if your version happens to support them. You can think of them as word-based versions of `ˆ` and `$` that match the position at the start and end of a word (alphanumeric data surrounded by not alphanumeric data), respectively. Like the line anchors caret and dollar, they anchor other parts of the regular expression but don’t actually consume any characters during a match. Note that `<` and `>` alone are not metacharacters; when combined with a back-slash, the sequences become special.

The metacharacter `?` means “zero or oner” occurrence of the immediately-preceding item, `+` means “one or more” and `*` means “any number, including none”, occurrences of the item. These three metacharacters, question mark `?`, plus `+`, and star `*`, are called *quantifiers* because they influence the quantity of what they govern.
Metasequences for providing minimum and maximun occurrences are called *intervals* and are two numbers written between `{` and `}`.

*Backreferencing* is used to “remember” text matched by the subexpression they enclose. Usually is possible backreference with `\n` with n>0. Ex.: `\<([A-Za-z]+) +\1\>` This example define a double word occurrence. `/1` refer to preceding occurrence between `(` and `)`.

The sequence `\.` is described as an *escaped period* or *escaped dot*, and you can do this with all the normal metacharacters, except in a *character- class*.

- `/<···/>` *word boundary*. equivalent to `\b···\b``
- `[···]` represent *character classes* definition
- `.` any character of any type character class
- `\w` any alphanumeric char. equivalent to `[a-zA-Z0-9]` character class
- `\W` any NOT alphanumeric char. equivalent to `[^a-zA-Z0-9]` character class
- `\d` any digit char. equivalent to `[0-9]` character class
- `\D` any NOT digit char. equivalent to `[^0-9]` character class
- `\s` any whitespace
- `\S` any NOT whitespace. equivalent to `[^ \n\t\r]` character class
- `\n` linefeed character
- `\t` horizontal tab character
- `\r` carriage return character
- `[^···]` represent negation *character classes* definition
- `(···)` represent *capturing group* definition
- `{···}` are used for *minmax quantifier*
- `?` *quantifier metacharacter* “0 or 1”
- `*` *quantifier metacharacter* “0 or more”
- `+` *quantifier metacharacter* “at least 1”
- `^` begin of line *anchor*
- `$` end of line *anchor*
- `|` indicates *alternation*
