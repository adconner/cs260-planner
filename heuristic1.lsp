(setf factor (/ 1.0 (apply #'max (mapcar #'(lambda (x) (length (second x))) *ops*))))
(defun h (state) (* factor (length (set-difference *gspec* state :test #'equal))))
