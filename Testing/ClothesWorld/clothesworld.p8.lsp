; Simple test case with variable not defined.
; 2 steps
; put-on-sock left/right
; put-on-shoe left/right
(setf *initpsd* '((underwear-on) (pants-on) (shirt-on) (jacket-on)))
(setf *gspec* '((shirt-on)(shoe-on ?a)))