% Class handling all subtraction expressions
classdef Sub < BinaryExpr
    methods
        % Constructor
        function obj = Sub(l,r)
           obj@BinaryExpr(l, r);
        end
        % Stringifier
        function str = str(obj)
           str = strcat("(", obj.l.str(), " - ", obj.r.str(), ")"); 
        end
        % Evaluator
        function val = eval(obj, map)
           val = obj.l.eval(map) - obj.r.eval(map); 
        end
    end
end