% Class meant to contain logic for
% storing pieces of a binary expression
classdef BinaryExpr < Expr
   properties
       l % left side of expression
       r % right side of expression
   end
   methods
       % Create class constructor
       function obj = BinaryExpr(l,r)
          % Assign constructor args to properties
          obj.l = l;
          obj.r = r;
       end
       % Define setter for l property
       function obj = set.l(obj, l)
          if contains('Expr',superclasses(l))
              obj.l = l;
          else
             error("Class %d is not a sublcass of Expr", l);
          end
       end
       % Define setter for r property
       function obj = set.r(obj, r)
          if contains('Expr',superclasses(r))
              obj.r = r;
          else
             error("Class %d is not a sublcass of Expr", r);
          end
       end
   end
end