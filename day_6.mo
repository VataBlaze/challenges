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
import Custom "custom";
import Animal "animal";
import List "mo:base/List";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";

actor {

// Challenge 1 

type TokenIndex = Nat;
    type Error = {
        #DefaultError;
        #UserError;
    };

// Challenge 2 

stable var registryEntry : [(TokenIndex, Principal)] = [];
    let registry : HashMap.HashMap<TokenIndex, Principal> = HashMap.fromIter<TokenIndex, Principal>(registryEntry.vals(), 0, Nat.equal, Hash.hash);

// Challenge 3 

var nextTokenIndex : Nat = 0;
    public shared({ caller }) func mint() : async Result.Result<(), Error> {
        if (caller == Principal.fromText("2vxsx-fae")) return #err(#UserError);
        registry.put(nextTokenIndex, caller);
        nextTokenIndex += 1;
        lastMinter := caller;
        return #ok;
    };

// Challenge 4 

public shared({ caller }) func transfer(to: Principal, tokenIndex: Nat) : async Result.Result<(), Error> {
        let owner: ?Principal = registry.get(tokenIndex);
        switch(owner) {
            case(null) return #err(#UserError);
            case(?principal) {
                if (principal != caller) return #err(#UserError);
            };
        };
        registry.put(tokenIndex, to);
        #ok;
    };

// Challenge 5 

public shared({ caller }) func balance() : async [TokenIndex] {
        Iter.toArray(HashMap.mapFilter<TokenIndex, Principal, Principal>(
            registry, 
            Nat.equal, 
            Hash.hash, 
            func(key : TokenIndex, val : Principal) {
                if(val == caller) {
                    return ?val;
                };
                return null;
                }).keys());
    };

    var lastMinter : Principal = Principal.fromText("2vxsx-fae");

// Challenge 6


// Challenge 7

system func preupgrade() {
        registryEntry := Iter.toArray<(TokenIndex, Principal)>(registry.entries());
    };

    system func postupgrade() {
        registryEntry := [];
    };

// Challenge 8

}