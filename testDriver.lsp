;
; This is a simple program that can be used to test the algorithm with the various worlds/tests.
;
; It will only work if you change the path names for each file to your local directory


(format t "You will need to change your file paths in code to run the Test Driver.~%")

(defun runTest(world test)
	(format t "Starting test driver for algorithm.~%")
	(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\plan.lsp")
	(cond ;Choose test
		((eql world 0) ;blocksworld 
			(progn
				(format t "Testing Blocksworld.~%")
				(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.opdefs.lsp")
				(cond
					((eql test 0) (progn (format t "Starting test: p0~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p0.lsp")))
					((eql test 1) (progn (format t "Starting test: p1~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p1.lsp")))
					((eql test 2) (progn (format t "Starting test: p2~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p2.lsp")))
					((eql test 3) (progn (format t "Starting test: p3~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p3.lsp")))
					((eql test 4) (progn (format t "Starting test: p4~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p4.lsp")))
					((eql test 5) (progn (format t "Starting test: p5~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p5.lsp")))
					((eql test 6) (progn (format t "Starting test: p6~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p6.lsp")))
					((eql test 7) (progn (format t "Starting test: p7~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p7.lsp")))
					((eql test 8) (progn (format t "Starting test: p8~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\blocksworld.p8.lsp")))
					(T (progn (format t "Incorrect Testing parameter. Aborting...") (return 0)))
				)
			)
		)
		((eql world 1) ;soccer 
			(progn
				(format t "Testing Soccer World.~%")
				(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.opdefs.lsp")
				(cond
					((eql test 0) (progn (format t "Starting test: p0~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p0.lsp")))
					((eql test 1) (progn (format t "Starting test: p1~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p1.lsp")))
					((eql test 2) (progn (format t "Starting test: p2~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p2.lsp")))
					((eql test 3) (progn (format t "Starting test: p3~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p3.lsp")))
					((eql test 4) (progn (format t "Starting test: p4~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p4.lsp")))
					((eql test 5) (progn (format t "Starting test: p5~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p5.lsp")))
					((eql test 6) (progn (format t "Starting test: p6~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p6.lsp")))
					((eql test 7) (progn (format t "Starting test: p7~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p7.lsp")))
					((eql test 8) (progn (format t "Starting test: p8~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\soccer.p8.lsp")))
					(T (progn (format t "Incorrect Testing parameter. Aborting...") (return 0)))
				)
			)
		)
		((eql world 2) ;clothesworld 
			(progn
				(format t "Testing ClothesWorld.~%")
				(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.opdefs.lsp")
				(cond
					((eql test 0) (progn (format t "Starting test: p0~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p1.lsp")))
					((eql test 1) (progn (format t "Starting test: p1~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p2.lsp")))
					((eql test 2) (progn (format t "Starting test: p2~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p3.lsp")))
					((eql test 3) (progn (format t "Starting test: p3~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p4.lsp")))
					((eql test 4) (progn (format t "Starting test: p4~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p5.lsp")))
					((eql test 5) (progn (format t "Starting test: p5~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p6.lsp")))
					((eql test 6) (progn (format t "Starting test: p6~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p7.lsp")))
					((eql test 7) (progn (format t "Starting test: p7~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p8.lsp")))
					((eql test 8) (progn (format t "Starting test: p8~%")(load "C:\\Users\\ZachAzar\\Documents\\VandyWork\\Fall\\AI\\Proj3\\GitProj\\clothesworld.p9.lsp")))
					(T (progn (format t "Incorrect Testing parameter. Aborting...") (return 0)))
				)
			)
		)
		
		(T (progn (format t "Incorrect World parameter. Aborting...") (return 0)))
	)	
	(format t "Searching for soln. Please wait...~%")
	(let 	( 	(time (get-universal-time)) ;else, we have something to prove, start the timer
			)
			(format t "Results: ~S ~%" (plan 1000))		
			(format t "The search took ~S seconds!~%" (-(get-universal-time)time))
			
	)
)

(defun average (times)
	(/ (reduce #'+ times) (length times))
)

