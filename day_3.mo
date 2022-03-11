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
import Result "mo:base/Result";

actor {
    
    // Challenge 1
    // Swap [i <--> j] in new array

  
     private func swap(array: [var Nat], i : Nat, j : Nat) : [var Nat] {
        let tmp = array[i];
        array[i] :=array[j];
        array[j] := tmp;
        return (array);
    };

    //Challenge 2
    //init_count(5) -> [0,1,2,3,4]
    //Do not use Array.append
    //Reverse: "let array : [Nat] = [1, 3 , 4];
    //          let size : Nat = array.size() // 3"?
    //then fill/count up from 0?

/*
    public func init_count(n : Nat) : async [Nat] {
      let mut = Array.init<Nat>(n, 0);
      var counter = 0;
      for(value in mut.vals()){
        array[i] := counter;
        counter += 1;
      };
      return(Array.freeze<Nat>(mut));
  };
  
    public func init_count(n : Nat) : async Nat {
        let array.size() : var Nat = n;
        return array : var Nat = [n];

    };

    public func init_count(n : Nat) : async [Nat] {
        var a : [Nat] = [];
        for (i in Iter.range(0, n-1)){
            a := Array.append(a,[i]);
        };
        return a;
    };
*/

    //Challenge 3
    //take an array [Nat] and return "Seven is found" if one digit of ANY number is 7 
    //Otherwise return "Seven not found"

    public func seven(array : [Nat]) : async Text {
      let array_text : [Text] = Array.map<Nat, Text>(array, Nat.toText);
      let seven : Char = '7';
      for(number in array_text.vals()){
        for(char in number.chars()){
          if (Char.equal(char, seven)){
            return "Seven found";
          };
        };
      };
    return "Seven not found";
  };
/*
    private func seven(n : Nat) : async Text {
    let array_1 : Nat = [n];
    if (7) {
        return("Seven is found");
        }  else  {
        return("Seven not found");
        }
    };
    
    public func seven(a: [Nat]): async Text {
        for (val in a.vals()){
            var tmp: Text = Nat.toText(val);
            if(Text.contains(tmp, text "7")){
                return "Seven is found";
            };
            return "Seven not found";
            };
        };
*/    
    //Challenge 4
    //Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat and m of type Nat
    //This function will return the value of n if n is not null 
    //If n is null it will default to the value of m

    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
    switch(n){
      case(null) return m;
      case(?n) return n; 
    };
  };

    //Challenge 5
    //day_of_the_week (1) -> "Monday"
    //day_of_the_week (7) -> "Sunday"
    //day_of_the_week (12) -> null

    public func day_of_the_week(n : Nat) : async Text {  
    switch(n){
      case(1) return "Monday";
      case(2) return "Thursday";
      case(3) return "Wednesday";
      case(4) return "Tuesday";
      case(5) return "Friday";
      case(6) return "Saturday";
      case(7) return "Sunday";
      case(_) return " ";
    };
  };

    //Challenge 6
    //Write a function populate_array that takes an array [?Nat] and returns an array [Nat] where 
    //all null values have been replaced by 0
    //Do not use a loop
/*
    public func populate_array(z : [?Nat]) : async [Nat] {
        return Array.map([z], checkval);
    };

    public func checkval (val : ?Nat) : async Nat {
        switch(val){
            case(null){
                return 0;
            };
            case(?something){
                return something;
            };
        };
    };
*/
    public func populate_array(array : [?Nat]) : async [Nat] {
    Array.map<?Nat,Nat>(array, func(x) {
      switch(x){
        case(null) return 0;
        case(?x) return x;
      };
    });
  };

    
    //Challenge 7
    //Write a function sum_of_array that takes an array [Nat] and returns the sum of a values in the array.
    //Do not use a loop

    public func sum_of_array(array : [Nat]) : async Nat {
    let sum = Array.foldLeft<Nat, Nat>(array, 0, func(a , b) {a + b});
    return(sum);
  };


    //Challenge 8
    //Write a function squared_array that takes an array [Nat] and returns a new array where 
    //each value has been squared.
    //Do not use a loop

    public func squared_array(array : [Nat]) : async [Nat] {
    return(Array.map<Nat,Nat>(array, func(x) { x*x }));
  };


    //Challenge 9
    //Write a function increase_by_index that takes an array [Nat] and returns a new array where 
    //each number has been increased by it's corresponding index.
    //increase_by_index [1, 4, 8, 0] -> [1 + 0, 4 + 1 , 8 + 2 , 0 + 3] = [1,5,10,3]
    //Do not use a loop

    public func increase_by_index(array : [Nat]) : async [Nat] {
    return(Array.mapEntries<Nat,Nat>(array, func(a, index) {a + index}));
  };
}