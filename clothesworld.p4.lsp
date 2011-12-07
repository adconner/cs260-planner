; Trivial test case with two variables. (Start = Goal)
(setf *initpsd* '((shoe-on 'left)(shirt-on) (underwear-on) (pants-on) (sock-on 'left) (sock-on 'right)))
(setf *gspec* '((sock-on 'left) (sock-on 'left) (underwear-on) (shoe-on 'left)))