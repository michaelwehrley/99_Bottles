# 99 Bottles

## Chapter 1 Simplicity

CONCRETE vs ABSTRACT

- How difficult was it to write?
- How hard is it to understand?
- How difficult was it to write?
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

## Chapter 2 TDD

Parts: Setup, Do, Verify

* Code like this `pluralize` method gets written when programmers take the *DRY* principle to extremes, as if they’re allergic to duplication