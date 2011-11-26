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


; match function which returns assignments of variables to values which result in the description being a subset of the state, nil if no such assignment can be made (will only substitute into the description field, no variables should appear in state, to avoid naming conflicts)
(defun match (description state) 
  (if (subsetp description state)
     '(nil) nil))

; returns all pairs (operator result) of results of applying a generic operator to a state
(defun applyop (state op)
  (mapcar #'(lambda (x) (union 
                          (set-difference state (resolve (third op) x)) 
                          (resolve (second op) x))) 
          (match (second op) state)))

