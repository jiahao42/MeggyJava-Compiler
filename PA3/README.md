# CS6620 - PA3

## Basic info 

* GitHub username: jiahao42
* email: jc4mf@virginia.edu

## Info about PA3

### Problem (Will implemented in PA4)

* 1. Operator for (Int, Byte) and (Byte, Byte) not implemented, only supports (Int, Int) right how. 
  * Because No Symbol Table yet, which means there is no way to know the size of the variable (e.g. byte or int?), thus I can only assume that all the int constant to be the type of int, regardless of `(byte)1` or `1`. I will fix this problem (for operators like `+/-/*`) when I start to implement the Symbol Table.

* 2. Mupltiply operation not implemented. 
  * As the AVR instruction shows, the `mul` instruction only supports `8 bits * 8 bits` which returns 16 bits, but here we may have `16 bits * 16 bits` and `16 bits * 8bits`.