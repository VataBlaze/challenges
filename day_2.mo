import Char "mo:base/Char";
import Nat "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Debug "mo:base/Debug";
import Nat32 "mo:base/Nat32";
import Prim "mo:prim";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Int "mo:base/Nat";
import Array "mo:base/Array";

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
    public func trim_whitespace(t : Text) : async Text {
        let pattern = #text(" ");
        return(Text.trim(t, p));
    };

    //Challenge 8
    
    public func duplicate_character(t : Text) : async Text {
        var characters : [Char] = [];
        for (character in t.vals()){
            switch(Array.filter(characters, f(x) : Text -> Bool {x == character})){
                case(null) {
                    characters := Array.append<Text>(characters, [character]);
                };
                case(?char){
                    return Char.toText(char);
                };
            };
        };
        return (t);
    };

    //Challenge 9

    public func size_in_bytes (t : Text) : async Nat {
        let utf_blob = Text.encodeUtf8(t);
        let array_bytes = Blob.toArray(utf_blob);
        return(array_bytes.size()); 
    };
*/
    //Challenge 10

    func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
        let mutable_array = Array.thaw<Nat>(array);
        let tmp = mutable_array[i];
        mutable_array[i] := mutable_array[j];
        mutable_array[j] := tmp;
        return(Array.freeze<Nat>(mutable_array))
    };
/*
    public func bubble_sort(array : [Nat]) : async [Nat] {
        var sorted = array;
        let size = array.size();
        for(i in Iter.range(0, size - 1){
            for (j in Iter.range(0, size - 1 - i)){
                if(sorted[i] > sorted[i + 1]){
                    sorted := _swap(sorted, i , j);
                };
            };
        };
        return (sorted)
    };
*/



/*    //Scratchwork
   
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
    return t; 
*/


}