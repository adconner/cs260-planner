(defun h (state) (return 0))

; heuristic dfs of state space (which consists of the world description only)
(defun dfs (state costbound) 
  (cond ((match gspec state) t)
        (t (dolist (i (sort (mapcar 
                              #'(lambda (x) (cons (+ (+ 1 costbound) (h (cadr x))) x)) 
                          (reduce #'append (mapcar 
                                             #'(lambda (x) (applyop state x)) 
                                             *ops*)))
                  #'(lambda (lhs rhs) (< (car lhs) (car rhs)))))
             (if (<= (car i) costbound) 
               (let ((cur (dfs (caddr i) (- costbound 1))))
                 (if cur (return (cons (cadr i) (if (eq cur 't) nil cur))))))))))


; match function which returns a list of all lists of assignments of variables to values in dotted pair format which result in the description being a subset of the state, nil if no such assignment can be made (will only substitute into the description field, no variables should appear in state, to avoid naming conflicts). For clarity, if there are no variables to assign and the inclusion holds, (nil) is returned, corresponding to the single empty assignment which satisfies the inclusion. This is consistent with the definition
; this is a contraint satisfaction problem to which a brute force solution is given
(defun match (description state) 
  (reduce #'(lambda (x y) (intersection x y :test #'(lambda (x y) (and (subsetp x y) (subsetp y x)))))
          ; use set equivalence for the comparison
          (mapcar #'(lambda (x) (match-sing x state)) description)))
  ;(if (subsetp description state :test #'equal)
     ;'(nil) nil))

; helper function for match which finds the possible values a variable may take given the state, used to determine the domains on which to brute force.
(defun find-domain (var description state) 
  (reduce #'union 
    (mapcar #'(lambda (item) 
      ; build up partial domain list using reduce
      (reduce #'(lambda (x y) (if (and y (not (eq y t))) (cons y x) x))
        (cons nil (mapcar #'(lambda (stateitem) 
          ; reduce to nil if no match possible, t if trivial match, x=var if match involving var is found
          (reduce #'(lambda (x y) (and x y (cond ((eq x t) y)
                                                 ((eq y t) x)
                                                 ((eq x y) x)
                                                 (t nil))))
            ; find the possible match for this pairing
            (mapcar #'(lambda (x y) (cond ((varp x) (if (eq var x) y t))
                                          ((eq x y) t)
                                          (t nil))) item stateitem))) 
                          state)))) description)))

; helper function for match which gives all variables in the description
(defun find-vars (description) 
  (cond ((not (listp description)) (if (varp description) (list description) nil))
        (t (reduce #'union (mapcar #'find-vars description))))) 

; helper function for match which produces the all possible variable assignments
; on which to brute force
(defun find-domains (description state)
  (reduce #'(lambda (partial-pool newvar) 
              (reduce #'append 
                      (mapcar #'(lambda (pool-item) 
                (mapcar #'(lambda (domval) (cons (cons newvar domval) pool-item))
                        (find-domain newvar description state))) 
                              partial-pool)))
          (cons '(nil) (find-vars description))))

; predicate which tells if a symbol represents a variablle
(defun varp (symb) (equal "?" (subseq (symbol-name symb) 0 1)))

; returns all pairs (specific operator, result) of results of applying a generic operator to a state
(defun applyop (state op)
  (mapcar #'(lambda (x) (list (sublis x (first op)) (union 
                          (set-difference state (sublis x (third op)) :test #'equal ) 
                          (sublis x (fourth op)) :test #'equal )))
          (match (second op) state)))
; todo account for additional variables introduced in the effects and name of an operator
