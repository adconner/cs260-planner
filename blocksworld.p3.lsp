; Simple test case, with no variable.
; Only step would either be putdown or stack.
(setf *initpsd* '((clear b) (on a b) (ontable a) (ontable b) (holding c)))
(setf *gspec* '((hand-empty) (clear b)))
