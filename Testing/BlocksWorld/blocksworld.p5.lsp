; Simple test case, with undefined variables in goal state.
; 2 steps.
; Pickup a
; Stack a c
(setf *initpsd* '((clear a) (clear c) (on b a) (ontable c) (ontable b) (handempty)))
(setf *gspec* '((on c ?x)(ontable ?y)))
