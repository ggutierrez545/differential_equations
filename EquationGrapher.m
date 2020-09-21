classdef EquationGrapher
    properties
        eq
    end
    methods
        % Class constructor
        function obj = EquationGrapher(eq)
            % Make sure args are passed to this class and not any
            % super classes (Even though there are none...)
            if nargin > 0
                obj.eq = eq;
            end
        end
        % General code to graph values from an expression
        function graph_solution(obj,x0,step_size,num_steps)
            % Initialize some arrays of length = num_steps
            % so we can save our calculated values
            y_values = zeros(1, num_steps);
            x_values = zeros(1, num_steps);
            % Set our current_value to our first x, ie x0
            curr_v = x0;
            % For each entry in our y_values array (for each step)
            for i = 1:length(y_values)
                % Map the variable x to its current value
                map = containers.Map('x',curr_v);
                % Update this value's entry in our x_values array
                x_values(i) = curr_v;
                % Evaluate our equation with the x map and
                % update the appropriate value in y_values 
                y_values(i) = obj.eq.eval(map);
                % Increment up our current value for the next
                % iteration
                curr_v = curr_v + step_size;
            end
            % Once the loop is done, create a figure instance
            figure();
            % Plot our values
            plot(x_values, y_values);
            % Write some stuff for the title
            top_line = strcat("Plot of ",obj.eq.str(), ", where");
            bottom_line = sprintf("x0 = %d, h = %d, & n = %d", x0, step_size, num_steps);
            title({top_line, bottom_line});
            % Label the axes
            xlabel("x");
            ylabel("y(x)");
        end
    end
end