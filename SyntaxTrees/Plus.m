% Class handling all addition expressions
classdef Plus < BinaryExpr
    methods
        % Constructor
        function obj = Plus(l, r)
            obj@BinaryExpr(l,r);
        end
        % Stringor
        function str = str(obj)
            str = strcat("(", obj.l.str(), " + ", obj.r.str(), ")");
        end
        % Evaluator
        function val = eval(obj, var_map)
            val = obj.l.eval(var_map) + obj.r.eval(var_map);
        end
    end
end