% Class meant to handle constants. Some special cases are
% handled here, such as e and pi. Probably need to find a 
% better way to handle these special cases...
classdef Const < Expr
    properties
        s_vals = containers.Map({'e', 'pi'}, [2.71828, 3.14259])
        val
        name
    end
    methods
        % Constructor
        function obj = Const(val)
            % Boolean to assign constructor args to Const class
            % instead of parent class Expr
            if nargin > 0
                obj.val = val;
            end
        end
        % Define setter for val property
        function obj = set.val(obj, val)
            if isnumeric(val)
                obj.val = val;
                obj.name = string(val);
            % matlab is upset that I'm referencing another property
            % within this setter, but we'll just ignore it for now...
            elseif isKey(obj.s_vals, val)
                obj.val = obj.s_vals(val);
                obj.name = val;
            else
                error("%d is not suitable for as a constant", val);
            end
        end
        % Convert Const.val into a string representation
        function str = str(obj)
            str = string(obj.name);
        end
        % Evaluate the constant, i.e. pass back it's numerical
        % value. 'map' here is negligible and is included
        % in the args to keep the Const class consistent with
        % the other Expr subclasses.
        function val = eval(obj, map)
            val = obj.val;
        end
    end
end