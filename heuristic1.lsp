(setf factor (/ 1.0 (apply #'max (mapcar #'(lambda (x) (length (second x))) *ops*))))
(defun h (state) (* factor (length (set-difference 
         (remove-if-not #'(lambda (prop) (every #'(lambda (x) (not (varp x))) prop)) *gspec*) 
         state :test #'equal))))
