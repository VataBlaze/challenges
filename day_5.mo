import Char "mo:base/Char";
import Chard "mo:base/Char";
import Nat "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Int "mo:base/Text";
import Nat32 "mo:base/Nat32";
import Prim "mo:prim";
import Bool "mo:base/Bool";
import Result "mo:base/Result";
import Buffer "mo:base/Buffer";
import List "mo:base/List"; 
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";

    
actor {
    //Challenge 1

/*       
    public shared(msg) func whoami() : async Principal {
        let principal_caller = msg.caller;
        return(principal_caller);
    };

    public func is_anonymous() : async Bool {
        let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
            if (whoami == anonymous_principal) {
                return true;
            } else {
                return false;
            };
        };
*/
    public shared({caller}) func whoami() : async Principal {
        return(caller);
    };

    

    //Challenge 2

    

    let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
    favoriteNumber.put(anonymous_principal, 26);

    public func test() : async ?Nat {
        return(favoriteNumber.get(Principal.fromText("2vxsx-fae")));
    };

    

    //Challenge 3
/*
    let myprincipal : Principal = whoami(); 
    public func add_favorite_number(n : Nat) : () {
        favoriteNumber.put(anonymous_principal, n);
    };

    public func show_favorite_number(): async ?Nat {
        return(favoriteNumber.get(anonymous_principal));
    };
*/
    

    //Challenge 4

    public shared({caller}) func add_favorite_number1(n:Nat): async Text {
        let existing_n : ?Nat = favoriteNumber.get(caller);
        switch(existing_n){
            case(null){
                favoriteNumber.put(caller, n);
                return ("You've successfully registered your number");
            };
            case(_) {
                return ("You've already registered your number");
            };
        };
    };
/*
    public func add_favorite_number2(n: Nat) : async Text {
        var tmp: ?Nat = favoriteNumber.get(Principal.fromText("2vxsx-fae"));
        if (tmp == n) {
            return "You've already registered";
        } else {
        favoriteNumber.put(anonymous_principal, n);
            return "You've successfully registered your number";
        };
    };
*/
    //Challenge 5

    public shared ({caller}) func update_favorite_number(n : Nat) : () {
        favoriteNumber.put(caller, n);
    };

        public shared({caller}) func delete_favorite_number() : () {
            favoriteNumber.delete(caller);
        };

    //Challenge 6

    public func deposit_cycles() : async Nat {
        let available = Cycles.available();
        let accepted = Cycles.accept(available);
        assert(available == accepted);
        accepted;
    };


    //Challenge 7

    //Challenge 8

    stable var counter : Nat = 0;
    stable var version_number : Nat = 0;
    public func increment_counter(n : Nat) : async Nat {
        counter += n;
        return (counter);
    };

    public func clear_counter() {
        counter := 0;
    };

    public func version() : async Nat {
        return (version_number);
    };

    system func preupgrade() {

    };

    system func postupgrade() {
        version_number += 1;
    };
    
}