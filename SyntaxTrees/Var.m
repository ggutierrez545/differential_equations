% Class to handle variables in expressions
classdef Var < Expr
    properties
        name
    end
    methods
        % Constructor
        function obj = Var(name)
            if nargin > 0
                obj.name = name;
            end
        end
        % Name property setter
        function obj = set.name(obj, name)
           if isstring(name)
               obj.name = name;
           else
               fprintf("%d is not a suitable variable name", name);
           end
        end
        % String representation
        function str = str(obj)
            str = obj.name;
        end
        % Assign value to variable when evaluation expression
        function val = eval(obj, var_map)
            val = var_map(obj.name);
        end
    end
end