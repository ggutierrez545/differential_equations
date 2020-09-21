% Class handling multiplication expressions
classdef Times < BinaryExpr
    methods
        % Constructor
        function obj = Times(l,r)
            obj@BinaryExpr(l,r);
        end
        % Stringifier
        function str = str(obj)
            str = strcat("(", obj.l.str(), " * ", obj.r.str(), ")");
        end
        % Evaluatorrrr
        function val = eval(obj, var_map)
            val = obj.l.eval(var_map) * obj.r.eval(var_map);
        end
    end
end