% Add SytaxTrees folder to search path.
% Folder containers classes that allow us to
% create and evaluate expressions with ease.
addpath("SyntaxTrees")

% In this case our solution was:
% x^2 + 2x + 2 - 9e^(x-1)

% Using our sytax tree format, we can break this
% expression up into something understandable by
% the computer, without hardcoding it into a loop.

% Let's turn x^2 + 2x (the left side) into an expression
% And display it using the classes str() method
left_side = Plus(Exp(Var("x"), Const(2)),Times(Const(2),Var("x")));
display(left_side.str());

% And now the right side, 2 - 9e^(x-1)
% First, let's handle the exponential piece
exp = Exp(Const("e"),Sub(Var("x"),Const(1)));
display(exp.str());

% And then the rest,
right_side = Sub(Const(2), Times(Const(9), exp));
display(right_side.str());

% Now our final solution is just the addition of 
% the left and right side.
solution = Plus(left_side, right_side);
display(solution.str());

% Next we can use solution to construct our
% EquationGrapher class!
% (In future pieces of this project, this class
% will contain the logic to actually solve the 
% differential equation, but for now it just
% graphs the result).
grapher = EquationGrapher(solution);


% Now use the graph_solution() method of the EqGrapher
% class to plot our solution! So for part a) we had:
% x0 = 1.0, h = 0.2, and n = 20. These are the arguments
% for our method:
grapher.graph_solution(1.0, 0.2, 20);

% And similarly for part b) we had:
% x0 = 1.0, h = 0.05, and n = 80.
grapher.graph_solution(1.0, 0.05, 80);


