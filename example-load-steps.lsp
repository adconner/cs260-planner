; the following is an example of the load order to test a heuristic in a world

(load 'plan.lsp)
(load 'blocksworld.opdefs.lsp)
(load 'heuristic1.lsp) ; heuristic1 needs to be loaded after the world ops 
                       ; because it does some initial calculation with the ops
                       ; There is a warning when this is loaded because we are 
                       ; redefining the trivial heuristic defined in plan.lsp
(load 'blocksworld.p1.lsp)
