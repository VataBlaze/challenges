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

actor {

    // Challenge 1
    
    public type Alien = Custom.Alien;
    let Martian : Alien = {
        name = "Marvin";
        age = 73;
    };

    public func alienname() : async Text {
    return(Martian.name);
    };

    public func alienage() : async Nat {
    return(Martian.age);
    };

    // Challenge 2

    public type Animal = Animal.Animal;
    let fido : Animal = {
        species = "Canine";
        energy = 100;
    };

    var a: Animal = fido;

    public func energy() : async Nat {
        return(a.energy);
    };

    // Challenge 3

    public func gotosleep (): async Nat {
        var tmp: Animal = Animal.animal_sleep(fido);
        return (tmp.energy)
    };

    // Challenge 4

    public func create_animal_then_takes_a_break(species : Text, energy : Nat) : async Animal {
        var animal : Animal ={
            species = species;
            energy = energy;
        };
        return Animal.animal_sleep(animal);
    };

    // Challenge 5

    public type List<Animal> = ?(Animal, List<Animal>);
        var animals: List<Animal> = List.nil<Animal>();

    // Challenge 6

    func push_animal (loki : Animal) : async () {
        animals:= List.push(loki, animals);
    };
    public func get_animals () : async [Animal] {
        return List.toArray(animals);
    };

    // Challenge 7 Write a function is_null that takes l of type List<T> and returns a boolean indicating if the list is null . Tips : 
    // Try using a switch/case

    // Challenge 8 Write a function last that takes l of type List<T> and returns the optional last element of this list

    // Challenge 9 Write a function size that takes l of type List<T> and returns a Nat indicating the size of this list.
    // Note : If l is null , this function will return 0

    // Challenge 10 Write a function get that takes two arguments : l of type List<T> and n of type Nat this function should return the optional 
    // value at rank n in the list

    // Challenge 11 Write a function reverse that takes l of type List and returns the reversed list


}