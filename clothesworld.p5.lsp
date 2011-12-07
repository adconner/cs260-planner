; Complex test case with no variables.
; Steps: 
;	1. put-on-underwear
;	2. put-on-pants
;	3. put-on-shirt
;	4. put-on-jacket
; Steps 2 and 3 can be interchangeable.
(setf *initpsd* '((naked)))
(setf *gspec* '((shirt-on)(pants-on)(jacket-on)))