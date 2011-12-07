(setf *ops* '(
		;; pass to ?x from ?y
		((pass ?x ?y)
		((not-guarded ?x) (has-ball ?y) (next-to ?y ?x))
		((not-guarded ?x) (has-ball ?y))
		((has-ball ?x) (guarded ?x)))
		
		;; tackle ?x with ?y
		((tackle ?x ?y)
		((has-ball ?x) (guarded ?x) (matchup ?x ?y))
		((has-ball ?x))
		((has-ball ?y)))

		((get-open ?x)
		((guarded ?x))
		((guarded ?x))
		((not-guarded ?x)))

		;; in our world, only a forward can score, so these functions
		;; force the bindings to forward and opforward

		((dangle-goalie forward)
		((has-ball forward) (not-guarded forward))
		()
		((net-open)))

		((score-goal forward)
		((net-open) (has-ball forward) (not-guarded forward))
		((net-open) (has-ball forward))
		((scored) (has-ball opgoalie)))

		((dangle-goalie opforward)
		((has-ball opforward) (not-guarded opforward))
		()
		((opnet-open)))

		((score-goal opforward)
		((opnet-open) (has-ball opforward) (not-guarded opforward))
		((opnet-open) (has-ball opforward))
		((opscored) (has-ball goalie)))

		((guard ?x)
		((not-guarded ?x))
		((not-guarded ?x))
		((guarded ?x)))

             ))
