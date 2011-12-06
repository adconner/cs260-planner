;; this just defines who is next to who so the pass function knows
;; who to give the ball to

(setf *field* '((goalie defenseman)
		(defenseman midfield)
		(midfield forward)))

(setf *opfield* '((opgoalie opdefenseman)
		(opdefenseman opmidfield)
		(opmidfield opforward)))

;; this just defines who is guarding who so that the tackle function knows
;; who to give the ball to

(setf *matchups* '((opdefenseman forward) 
		   (opmidfield midfield) 
		   (opforward defenseman)))

(setf *opmatchups* '((forward opdefenseman)
		     (midfield opmidfield)
		     (defenseman opforward)))

(setf *ops* '(
		((pass ?x)
		((not-guarded ?x) (has-ball ?x))
		((not-guarded ?x) (has-ball ?x))
		((has-ball (assoc ?x *field*)) (guarded ?x)))

		((oppass ?x)
		((not-guarded ?x) (has-ball ?x))
		((not-guarded ?x) (has-ball ?x))
		((has-ball (assoc ?x *opfield*)) (guarded ?x)))

		((get-open ?x)
		((has-ball ?x))
		((guarded ?x))
		((not-guarded ?x)))

		;; in our world, only a forward can score, so force the variable
		;; to bind with 'forward

		((dangle-goalie forward)
		((has-ball forward) (not-guarded forward))
		(())
		((net-open)))

		((score-goal forward)
		((net-open) (has-ball forward) (not-guarded forward))
		((net-open) (has-ball forward) (not-guarded forward))
		((scored) (guarded forward)))

		((dangle-goalie opforward)
		((has-ball opforward) (not-guarded opforward))
		(())
		((opnet-open)))

		((score-goal opforward)
		((opnet-open) (has-ball opforward) (not-guarded opforward))
		((opnet-open) (has-ball opforward) (not-guarded opforward))
		((opscored) (guarded opforward)))

		((guard ?x)
		(())
		((not-guarded ?x))
		((guarded ?x)))

		;; ?x is the opposing player we are trying to tackle
		((tackle ?x)
		((has-ball ?x) (guarded ?x))
		((has-ball ?x))
		;; gives the ball to the person on our team who guards the 
		;; opposing player
		((has-ball (assoc ?x *matchups*))))

		;; ?x is the opposing player we are trying to tackle
		((optackle ?x)
		((has-ball ?x) (guarded ?x))
		((has-ball ?x))
		;; gives the ball to the person on our team who guards the 
		;; opposing player
		((has-ball (assoc ?x *opmatchups*))))
             ))
