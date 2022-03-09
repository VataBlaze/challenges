import Char "mo:base/Char";
import Nat "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Debug "mo:base/Debug";
import Nat32 "mo:base/Nat32";
import Prim "mo:prim";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Int "mo:base/Nat";

actor {

    //Challenge 1

    public func nat_to_nat8(n : Nat) : async Nat8 {
      return(Nat8.fromNat(n));
    };

    // Challenge 2

    public func max_number_with_n_bits(n : Nat) : async Nat {
        return ((2 ** n)-1)
    };

    // Challenge 3

/*   
    public func decimal_to_bits(n : Nat) : async Text {
        let remainder : Nat = n % 2
        let quotient : Nat = n / 2
            if quotient == 0,
                return char[remainder(last)], char[remainder(next-to-last)], char[remainder(next-to-next-to-last)], etc.
    
    }   
*/
     public func decimal_to_bit(n : Nat) : async Text {
         if (n == 0) {
             return "DNE"
         };
         var tmp: Nat = n;
         var binary : Nat = 0;
         var counter : Nat = 0;
         while (tmp > 0) {
             binary := ((tmp % 2)*(10**counter)) + binary;
             tmp := (tmp/2);
             counter := 1; 
         };
         var output = Nat.toText(binary);
         return output;
     };
/*
    public func decimal_to_bit(n : Nat) : async Text {
        var result : Text ="";
        for(i in Inter.range(0, n)){
            result.Text.concat((n % 2) : Text, result : Text);
            n := n / 2;
        };
        return result;
    };
*/ 
     // Challenge 4

    public func capitalize_character(t: Text) : async Text {
        return Text.map(t, Prim.charToUpper);
    };


/*
    public func capitalize_character(c : Char) : async Text {
        let toNat32 : (c : Char) -> Nat32; 
        let f32 : Nat32 = (toNat32 - 32);
        let char : Char = Char.fromNat32(f32);
    	    return(Char.toText(char));
    } */
/*
    public func capitalize_characterz () : async Text {
        var c : Char = 'c';
        var tmp : Nat32 = Char.toNat32(c);
        tmp -= 32;
        var output: Char = Char.fromNat32(tmp);
        return Char.toText(output);
    };
    */
/*
    public func unicode_to_character(n : Nat32) : async Text {
    	let char : Char = Char.fromNat32(n);
    	return(Char.toText(char));
    };
    */

    // Challenge 5
/*
    public func capitalize_tex(t : Text) : async Text {

    }
*/
    public func capitalize_text(t: Text) : async Text {
        label letters for (c in t.chars()) {
    Debug.print(debug_show(c));
    }; return Text.map(t, Prim.charToUpper);
    };

    // Challenge 6
   
    let a : Bool = true;
    let b : Bool = false;
/*
    public func maybe_inside (t : Text, c: Text) : async Bool {
    for (tc in t.chars())
    for (cc in c.chars())
        if (tc == cc)
            return (true)
            else
            return (false)
    };
 */   
    public func is_inside (t : Text, c: Text) : async Bool {
    var counter = 0;
    for (char in t.chars()){
      for (char2 in c.chars()){
        if  (char == char2) {
          counter +=1;
        };};};
    return counter >= 1;
  };
/*
    //Challenge 7
    let isWhitespace : (c : Char) -> Bool
    public func trim_whitespace(t : Text) : async Text {
        

    }

    //Challenge 8
    
    public func duplicated_character(t : Text) : async Text {

    }

    //Challenge 9

    public func size_in_bytes(t: Text) : async Nat {

  };

    //Challenge 10

    public func bubble_sort array




    
   
    public func is_in_alphabet(word : Text) : async Bool {
        var array : [Bool] = [];
        for (c in word.chars()){
            array := Array.append<Bool>(array, [Chard.isAlphabetic(c)])
        };
        return(array);
    };



    while (temp > 0)
      {
        natBit += (temp % 2) * (10 ** p);
        p += 1;
        temp := temp / 2;
      };
      let bits = Nat.toText(natBit);
      return bits;

    // Challenge ?

    var trie:Trie.Trie<Char, ()> = TrieSet.empty();
    for(i in t.chars()){
        if(TrieSet.mem(trie,i)){
            return Text.fromChar(i);
        }
        else{
            TrieSet.put(trie,i);
        }
    };
    return t; */



}