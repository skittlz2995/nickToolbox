function formatFig(varargin)
% Function to setup figure how I like it.
%
% Optional Inputs:
%   h   - Figure Handle (default gcf)
%   ax  - Figure Axis (default gca)
%
% Author: Nick Andreasen, Aug 2019

if nargin == 2
    h = varargin{1};
    ax = varargin{2};
else
    h = gcf;
    ax = gca;
end

% Axis Settings
set(ax,'FontSize',14)
if isprop(ax.Children,'CData')
    colorbar;
else
    grid(ax,'on');
end

% Figure Settings
set(h,'Color','w')

% Set Children Properties
nChildren = numel(ax.Children);
for iChild = 1:nChildren
    switch class(ax.Children(iChild))
        case 'matlab.graphics.chart.primitive.Line'
            if isequal(ax.Children(iChild).LineStyle,'none')
                ax.Children(iChild).MarkerSize = 15;
            else
                ax.Children(iChild).LineWidth = 2;
            end
    end
end


end