OOP Inheritence and Generics in Haskell
=======================================

This repo shows a simple example of how to model inheritence relationships in Haskell, and to achieve results similar to object oriented programming.

The main module demonstrates -
  - Defining a *Superclass* `Shape` which has *Traits* `Drawable` and `Locatable`. The Traits are actually regular class definitions in Haskell. `Shape` is implemented as a datatype with class constraints.
  - Defining a function `process` that operates on a list of objects of the generic superclass `Shape`.
  - Defining a few *Subclasses* `Rect`, `Circle` etc. which inherit from `Shape`. These are also implemented as datatypes.
  - Instantiating objects of the subclasses `newRect` and `newCircle`.
  - `Casting` objects of the subclass to objects of superclass. Then passing them to the generic function `process`.

Comparison with Java/Kotlin Inheritence and Generics
====================================================

I've found that generics in Haskell are much easier to use and think about, than similar features in Java/Kotlin. Since objects are immutable in Haskell, there is no need to "features" like wildcard types (in Java) or type varience (in Kotlin).

