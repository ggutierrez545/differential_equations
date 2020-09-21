% Class meant to hanlde the exponent operation
classdef Exp < Expr
   properties
      val % The expression to be exponentiated
      n % The exponent
   end
   methods
       % Constructor
       function obj = Exp(val,n)
          % Boolean to pass args to Exp class, not Expr superclass
          if nargin > 0
             obj.val = val;
             obj.n = n;
          end
       end
       % val setter
       function obj = set.val(obj, val)
          if contains('Expr', superclasses(val))
              obj.val = val;
          else
              error("%d is not a suitable expression", val);
          end
       end
       % n setter
       function obj = set.n(obj, n)
          if contains('Expr', superclasses(n))
              obj.n = n;
          else
              error("%d is not a suitable expression", n);
          end
       end
       % Convert exponential expression into string.
       % "Recursively" calls the str() method defined in
       % properties's classes.
       function str = str(obj)
          str = strcat(obj.val.str(), "^", "{", obj.n.str(), "}"); 
       end
       function val = eval(obj, map)
          val = obj.val.eval(map)^obj.n.eval(map); 
       end
   end
end