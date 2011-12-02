(defun h (state) (return 0))

(defun plan (depth) ; expand operations and goal states into *ops-full*,

; heuristic dfs of state space (which consists of the world description only)
(defun dfs (state costbound) 
  (cond ((match gspec state) t)
        (t (dolist (i (sort (mapcar 
                              #'(lambda (x) (cons (+ (+ 1 costbound) (h (cadr x))) x)) 
                          (reduce #'append (mapcar 
                                             #'(lambda (x) (applyop state x)) 
                                             *ops-full*)))
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

; substitutes the var value pairs into the description
(defun resolve (description varvalues) 
  (if (not varvalues) description
    (substsingle (resolve (rest varvalues)) (first varvalues))))

; helper function for previous which substitutes a single var value
(defun substsingle (description varvalue)
  (if (not (listp description)) 
    (if (eq description (first varvalue))
      (second varvalue))
    (mapcar #'(lambda (x) (substsingle x varvalue)) description)))
