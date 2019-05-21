# 99 Bottles

“Code smells again guide the choice of the next refactoring.” (Chapter 5)

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

## Chapter 4 - ABSTRACTIONS

“Abstractions tell you where your code relies upon an idea.” (4.9)

Excerpt From: Sandi Metz, Katrina Owen. “99 Bottles of OOP.” Apple Books. 

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

* **“Liskov violations. Objects made promises that they did not keep. ”** _=>_ an insufficent use of polymorphism.

* **“Every piece of knowledge is a dependency, and the way that quantity is written requires verse to know too many things. If quantity were more trustworthy, verse could know less.”**
* Liskov: “subtypes must be substitutable for their supertypes.”
* _That means:_ **“objects be what they promise they are.”**
* **“The Liskov Substitution Principle also applies to duck types.”** :smile:!
* GREAT EXAMPLE WITH `quantity(number)` following Liskov!

#### Flocking Rules - Discovering Deep Abstractions!
* Just because tests pass - doesn't make a _good_ "refactor"
* Increasing conditional branching from 3 to 2 likely means the "refactor" is not better.
* Meaning should remain consistent - concepts should make sense!
* “The more confused you are, the more important it is to nibble.”
* “Easier to see how things are different if you make them more alike.”

**“If you had perfect understanding, you’d write perfect applications.”**


##### `successor(number)`

“The successor concept illustrates the power of iterative application of the Flocking Rules. This concept wasn’t even hinted at in the solutions given in Chapter 1, and if you found it when you worked the problem yourself, you’re in a minority. The concept is so subtle most programmers don’t notice it, and yet it simply appears if you follow this simple set of rules.

Successor is important, and separating it from quantity gives both methods a single responsibility. If you conflate choosing-what-to-sing-for-any-number (quantity) with deciding-what-verse-to-sing-next (successor), the resulting method would be harder to understand, future refactorings would be more difficult, and attempts to change the code for one idea might accidentally break it for the other.”

### CURRENT TRADE OFF - HOLY SHIT!

“From Flog’s point of view, all you’ve accomplished is to turn one conditional into many, while simultaneously adding 55% more code.”

## Chapter 5: “Code should be open for extension and closed for modification.”

### EXTRACT CLASS

"It recognized that many methods in Bottles obsessed on number, and undertook the Extract Class refactoring to cure this obsession."

### SAME CONCEPT
Finding objects/parameterst that are same in concept is important in refactoring...

In OO, you shouldn't need `if`/`else` that "supplies behavior" b/c that implies knowing something about the paramter.  You should only have to send messages.

SMALL CHANGES WHEN REFACTORING allows you to trust the process, have specs pass, and continue to refactor.

* What about the six-pack - still closed for motification?
* Sometimes refactoring makes things "worse", before they are better and it is hard to :eyes: to the improvement.
* **Conitinue to look for commonalities (parameters #s, shape, color, contain other methods) in specs and code.**
* “Superfluous difference raises the cost of reading code, and increases the difficulty of future refactorings.”

* **NICE:** “ Having multiple methods that take the same (i.e., same concept not necessarily identical) argument is a code smell”

* **NICE:** Benefits of `==` over `>=` or `=<` for clarity in seeing differences and future refactoring!

* **NICE:** “As an OO practitioner, when you see a conditional, the hairs on your neck should stand up”

* **NICE:** “...there’s a big difference between a conditional that selects the correct object and one that supplies behavior. The first is acceptable and generally unavoidable. The second suggests that you are missing objects in your domain....Code is striving for ignorance, and preserving ignorance requires minimizing dependencies.”

### Primitive Obsession

Solve _Primitive Obsession_ with a _Extract Class_: **Create a smarter object to stand in for the primitive.**

* **NICE:** “_Primitive Obsession_ is when you use one of these data classes to represent a concept in your domain.”

* **NICE:** “The cure for _Primitive Obsession_ is to create a new class to use in place of the primitive. For this operation, the refactoring recipe is Extract Class.”

* **YEP!:** “You’ve been introduced to the rule about naming methods at one higher level of abstraction than their current implementation”

* Name _methods_ after what they **mean**, and name _classes_ fater what they **are**.

### Caching

* **The first solution to any problem should avoid caching, use immutable objects, and treat object creation as free.**

## Chapter 6

### Data Clumps

* When similar code is clumped together often, it means maybe we are missing an abstraction.
* **BLANK LINES** denote signifying topics and **thus** multiple **responsibilities**!

### Updating Conditionals:

1. Replace Conditional with State/Strategy. => solves the problem through _composition_.
1. Replace Conditional with Polymorphism. => solves the problem through _inheritance_.

### Obsessions
Obsessions (i.e., `Integer` obessions) are cured (just like _primitive obession_) by extracting with a class.

### Factories

* When choosing we use conditions and this is the job of a **factory**.
* “Factories don’t know what to do: instead, they know how to choose who does. They consolidate the choosing and separate the chosen.”

To determine if polymorphism is correct, we need to understand the domain: **what varies**!  Is it the verse or the bottle.

* “This name is tightly coupled to the current context, and tight coupling makes code resistant to change.”