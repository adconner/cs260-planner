; Complex test case with 2 variables defined.
; Steps: 
;	1. put-on-underwear
;	2. put-on-pants
;	3. put-on-shirt
;	4. put-on-jacket
;	5. put-on-sock 'right
;	6. put-on-shoe 'right
; The order of steps do not matter as long as 1-4 appears sequentially with the preconditions satisfied.
(setf *initpsd* '((sock-on left) (naked)))
(setf *gspec* '((pants-on)(jacket-on)(shoe-on right) (sock-on right) (sock-on left)))