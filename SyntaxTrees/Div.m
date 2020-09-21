% Class meant to handle divison operation
classdef Div < BinaryExpr
    methods
       % Constructor assigns l, r args to the BinaryExpr
       % parent class.
       function obj = Div(l,r)
           obj@BinaryExpr(l,r);
       end
       % Convert division expression to a string representation.
       % "Recursively" calls the obj.str() method of the l, r
       % classes.
       function str = str(obj)
          str = strcat(obj.l.str(), " / ", obj.r.str()); 
       end
       % Evaluate the division expression.
       % "Recursively" calls the obj.eval() method of the l, r
       % classes. 'map' is a map datastructure that contains
       % values for any Var classes in the expression.
       function val = eval(obj, map)
          val = obj.l.eval(map) / obj.r.eval(map); 
       end
    end
end