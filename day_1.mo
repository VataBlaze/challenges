import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";

actor {

    // Challenge 1
    public func add(n : Nat, m : Nat) : async Nat {
        return(n + m);
    };

    // Challenge 2
    public func square(n : Nat) : async Nat {
        return(n * n);
    };

    // Challenge 3
    public func days_to_second(n : Nat) : async Nat {
        return(n * 86400);
    };

    // Challenge 4
    // Create a mutable variable
    var counter : Nat = 0;

    public func increment_counter(n : Nat) : async Nat {
        counter += n;
        return (counter);
    };

    public func clear_counter() : async Text {
        counter := 0;
        return ("Bankrupt");
    };

    // Challenge 5
    // Boolean type
    let a : Bool = true;
    let b : Bool = false;

    public func divide(n : Nat, m : Nat) : async Bool {
        return(n % m == 0);
    };

    public func dividebool(n : Nat, m : Nat) : async Bool {
        let remainder : Nat = n % m;
        if(remainder == 0){
            return(true);
        }   else {
            return(false);
        }
    };

    public func dividetext(n : Nat, m : Nat) : async Text {
        if(n % m == 0) {
            return("yes");
        } else {
            return("no");
        }
    };

    // Challenge 6
    public func is_even(n : Nat) : async Bool {
        return(n % 2 == 0);
    };

                            
    // Challenge 7

    let array : [Nat] = [3, 2, 1];

    public func sum_of_array() : async Nat {
        if(array.size() == 0) {
            return(0);
        } else {
            return(array[0] + array[1] + array[2]);
        }
    };

    /* Challenge 8
    public func maximum() : async Nat {
        if(array.size() == 0) {
            return(0);
        } else {
        }    
        };
    */
    

}