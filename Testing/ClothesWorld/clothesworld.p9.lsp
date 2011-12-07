; Simple test case with variables defined, repeated.
; 2 steps
; put-on-sock left/right
; put-on-shoe left/right
(setf *initpsd* '((underwear-on) (shirt-on) (pants-on)))
(setf *gspec* '((sock-on left) (sock-on right) (sock-on left)))