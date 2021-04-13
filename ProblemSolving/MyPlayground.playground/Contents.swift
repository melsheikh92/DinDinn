import UIKit
/*
**** THE PROBLEMS ****
Given a string str consisting of letters only and an integer n, the task is to replace every character of the given string by a character that is n times more than it. If the letter exceeds ‘z’, then start checking from ‘a’ in a cyclic manner.

Examples:
Input: str = “abc”, n = 2
Output: cde
a is moved by 2 times which results in character c
b is moved by 2 times which results in character d
c is moved by 2 times which results in character e

Input: str = “abc”, n= 28
Output: cde
a is moved 25 times, z is reached. Then the 26th character will be a, 27th b and 28th c.
b is moved 24 times, z is reached. 28-th is d.
c is moved 23 times, z is reached. 28-th is f.

Question:
a/ Write an algorithm to solve the above issue. Please consider the complexity of the algorithm.
b/ What is the disadvantage of using the ASCII value of the letters to solve this problem?

 */

/****  ANSWER ****/
// 1- Write an algorithm to solve the above issue. Please consider the complexity of the algorithm.

// assuming charchters are all english and only from a-z and the input will be always from the given alpahabet
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

/// Complexity O(n)
func evaluateAlphabet(inputStr: String, moves: Int, alphabet: [String]) -> String {
    var result = ""
    for (idx, _) in inputStr.enumerated() {
        if idx + moves > alphabet.count {
            let newIdx = (moves + idx) % alphabet.count
            result += alphabet[newIdx]
        } else {
            let newIdx = idx + moves
            result += alphabet[newIdx]
        }
    }
    return result
}

print(evaluateAlphabet(inputStr: "abc", moves: 2, alphabet: alphabet))
print(evaluateAlphabet(inputStr: "abc", moves: 28, alphabet: alphabet))
// b/ What is the disadvantage of using the ASCII value of the letters to solve this problem?
// 1- ASCI Value consider (a) and (A) are different characters with different code
// 2- solution is limited due to the low space available for ASCI so it cant handle another languages
// 3- the start of the of the first index for (a) is 96

