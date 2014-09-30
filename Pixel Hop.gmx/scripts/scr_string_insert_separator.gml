// string_insert_separator(str, sep, n)

// Returns with a string where the given separator have been

// inserted after every nth character, from right to left.

//Example:string_insert_separator("10040394", ",", 3)
//Will Returne Will draw 10,040,394

var str, sep, n, l, a;

str = string(argument0)

sep = argument1

n = argument2

l = string_length(str) - 1

for (a = 0 a < floor(l / n) a += 1) str = string_insert(sep, str, l + 2 - n * (a + 1))

return str
