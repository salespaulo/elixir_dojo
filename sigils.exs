# Sigil ~r is used to create regular expression
"FOO" =~ ~r/foo/
#false
"FOO" =~ ~r/foo/i
#true
"foo" =~ ~r/foo|bar/i
#true
"BAR" =~ ~r/foo|bar/i
#true

# Sigil ~s is used to create strings or better bitstring
~s(this is a string with "double" quotes, not 'single' ones)
#"this is a string with \"double\" quotes, not 'single' ones"

# Sigil ~c is used to create char lists
~c(this is a char list containing 'single quotes')
#'this is a char list containing \'single quotes\''

# Sigil ~w is used to create words
~w(foo bar bat)
#["foo", "bar", "bat"]