# 99 Bottles

## Chapter 1 Simplicity

CONCRETE vs ABSTRACT

- How difficult was it to write?
- How hard is it to understand?
- How expensive will it be to change?
- Judging Code & Complexity (Flog/ABC/Dah!) - Assignments, "branches", conditions

### Ideas:
* Consistency - changes make the reader have to rethink!
* Duplication
* Names/Incomprehensibly Concise
* Too General (example: unnecessary complexity/tries to guess the future.)
* Concretely Abstract (example: too many small definitions)

### Solutions
** _Complexity_ derived from being too _general_ **

#### Notes:
* People have a tendancy to abstract too soon and to the _wrong_ abstraction.

* A "message" is sent by an object to invoke behavior. I.e., the `song` method sends the `verses` message to the implicit receiver `self`. There are many ways to receive to a message. The object receives the messages and looks to respond by looking at method definitions.

* Code is easy to understand when it clearly reflects the problem it’s solving. I.e., the "Ahh, that makes f'in sense" test.

* Complexity is not forbidden, it is required to pay its own way.
  ** Assignments is a count of variable assignments.
  ** Branches counts not branches of an if statement (as one could forgivably infer) but branches of control, meaning function calls or message sends.
  ** Conditions counts conditional logic.

Testing: `ruby test/bottles_test.rb` => `minitest` is ruby, `rspec` is a DSL.

## Chapter 2 TDD

Parts: Setup, Do, Verify

* Code like this `pluralize` method gets written when programmers take the *DRY* principle to extremes, as if they’re allergic to duplication

## To Talk About

* SOLID...

## Chapter 3 - Unearthing Concepts - Refactor Gradually (via Flocking Rules) - S.O.L.I.D.!

* SOLID PRINCIPLES! YAYYYY!!!!
* Martin Flower: [Refactoring: Improving the Design of Existing Code](https://books.google.com/books/about/Refactoring.html?id=HmrDHwgkbPsC) & Code Smells. In Ruby: https://martinfowler.com/books/refactoringRubyEd.html

* Change only when change is needed - and not for aesthetics. Some code that never changes doesn't need to change. “Code that needs to be changed must be changeable...But generally it’s best to clarify requirements, and then write the minimum necessary code.”

* **“Conditionals are the bane of OO”** and compounding conditional sins can occur.
 
* 6-pack: “The current Bottles class is not open to the "6-packs" requirement because adding new verse variants requires editing the conditional.”

* Other Code Smells:
  * Divergent Change
  * Feature Envy
  * Primitive Obsession
  * Inappropriate Intimacy
  * Shotgun Surgery

* When refactoring “You don’t have to know how to solve the whole problem in advance.”
* Specs: “Tests are the wall at your back. Successful refactorings lean on green. ”

Steps:
  1. Try to find the abstration...but you don't have to see it!
  1. **Encapsulate the variations** -> Flocking Rules - make smallest change to remove differences in code: “The focus here is encapsulating the concept that varies, a theme of many design patterns.” Samll changes result in a solution that is discovered by refactoring.
  1. Solve the simple problems first: “It is common to find that hard problems are hard only because the easy ones have not yet been solved.”
  1. “you must decide what this **difference** means.” Wow, compare 1 to 2 to 6! OMG! The issue is not pluralization. General rule v. new requirement.
  1. Conditions: make a **TABLE** to figure out name. What is this object/unit. In OOO actually find a the word you use in converation.
  1. Don't change everything b/c “If you simultaneously change many things and something breaks, you’re forced to understand everything in order to fix anything.”
  1. **Flocking Rules**: Easier said than done.
    * Select the things that are most alike.
    * Find the smallest difference between them.
    * Make the simplest change to remove that difference:
      * parse the new code
      * parse and execute it
      * parse, execute and use its result
      * delete unused code
    * As you’re following the rules:
      * In general, change only one line at a time.
      * Run the tests after every change.
      * If you go red, undo and make a better change.”

* Question: is the fact that `container` returns a default now now mater what, but can be augmented in the future with a different value an example of Open/Close?

* **“... refactor the existing code to be open to the new requirement, next, add the new code...Making existing code open to a new requirement often requires identifying and naming abstractions.”**

Open and Closed: if a new requirement is needed look to see how to do it.  It you can't, then make your code open for *this* modification.

## Chapter 4

* WOW: “If all verse variants are alike in an underlying, more abstract, way, then "it" and "one" must represent a smaller abstraction within that larger one.”

* Good point about naming: “ The words "it" and "one" are so innately generic that naming the underlying concept is particularly tough. Names should neither be too general nor too specific.”
  * LOL: “Some folks allot themselves five to ten minutes to ponder (usually with thesaurus in hand),”

* LOL: `pronoun`

Great point to remember: **“Remember that the goal is to locate the next small difference, not the next clump of differences.”**

#### Going Further with Abstractions
| Number |    XXX?   |
|--------|-----------|
|   99   |   '99'    |
|--------|-----------|
|   50   |   '50'    |
|--------|-----------|
|   1    |   '1'     |
|--------|-----------|
|   0    | 'no more' |
|--------|-----------|

```
 1   def quantity(number)
 2     if number == 0
 3       "no more"
 4     else
 5       number
 6     end
 7   end
 8 
 9   def pronoun(number)
10     if number == 1
11       "it"
12     else
13       "one"
14     end
15   end
16 
17   def container(number)
18     if number == 1
19       "bottle"
20     else
21       "bottles"
22     end
23   end
```

**“Each has a single responsibility. They are identical in shape. All take the same argument.”**

#### Obeying the Liskov Substitution Principle

* **“Every piece of knowledge is a dependency, and the way that quantity is written requires verse to know too many things. If quantity were more trustworthy, verse could know less.”**
* Liskov: “subtypes must be substitutable for their supertypes.”
* That means: **“objects be what they promise they are.”**
* **“The Liskov Substitution Principle also applies to duck types.”**
* GREAT EXAMPLE WITH `quantity(number)` following Liskov!
