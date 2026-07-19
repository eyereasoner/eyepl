different(alice, bob).
why(
  different(alice, bob),
  proof(
    goal(different(alice, bob)),
    by(rule("herbrand-semantics.pl", clause(2))),
    uses([
      proof(
        goal(neq(alice, bob)),
        by(builtin(neq, 2))
      )
    ])
  )
).

different(ticket(alice), ticket(bob)).
why(
  different(ticket(alice), ticket(bob)),
  proof(
    goal(different(ticket(alice), ticket(bob))),
    by(rule("herbrand-semantics.pl", clause(3))),
    uses([
      proof(
        goal(neq(ticket(alice), ticket(bob))),
        by(builtin(neq, 2))
      )
    ])
  )
).

