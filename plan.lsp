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
(defun match (description state) 
  (if (subsetp description state :test #'equal)
     '(nil) nil))

; predicate which tells if a symbol represents a variablle
(defun varp (symb) (equal "?" (subseq (symbol-name symb) 0 1)))

; returns all pairs (specific operator, result) of results of applying a generic operator to a state
(defun applyop (state op)
  (mapcar #'(lambda (x) (union 
                          (set-difference state (sublis (third op) x) :test #'equal ) 
                          (sublis (second op) x) :test #'equal )) 
          (match (second op) state)))
