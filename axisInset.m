function h = axisInset(ax,varargin)
% h = axisInset(ax,varargin)
% creates and returns a handle to an inset axis
% Specify inset position using ('name',value) pairs
% 'scale' - proportion of parent axis to scale inset. Can be scalar or 2*1. (default 0.3)  
% 'buffer' - proportion of parent axis to indent from edge. Default 0.04
% 'position' - compass direction or 'center' for inset. Default 'NE'
%           - can be specified as e.g. 'NW','south','centre'.
%
% Usage examples
% ax = axes;
% plot(ax,1:3);
% h1 = axisInset(ax,'scale',0.25,'buffer',0.05);
% plot(h1,[8 4 2 1]);
% h2 = axisInset(ax,'position','SE')
% plot(h2,[1 2 4 8]);
% set(h2,'xtick',[],'ytick',[])
%
% Nicholas Price - 290622

p = inputParser;
addRequired(p,'ax',@(x) isa(x,'matlab.graphics.axis.Axes'));
addOptional(p,'scale',0.3)%,@isnumeric);
addOptional(p,'buffer',0.04)%,isnumeric);
addOptional(p,'position','NE')
parse(p,ax,varargin{:});

scale = p.Results.scale;
if length(scale)==1, scale = scale*[1 1]; end
buffer = p.Results.buffer;
posText = p.Results.position;

pos = get(ax,'position'); % [left bottom width height]

switch lower(posText)
    case {'n','north'}
        left = pos(1) + (1-scale(1))*pos(3)/2;
        bottom = pos(2) + (1-buffer-scale(2))*pos(4);
    case {'e','east'}
        left = pos(1) + (1-buffer-scale(1))*pos(3);
        bottom = pos(2) + (1-scale(2))*pos(4)/2;
    case {'s','south'}
        left = pos(1) + (1-scale(1))*pos(3)/2;
        bottom = pos(2) + buffer*pos(4);        
    case {'w','west'}
        left = pos(1) + buffer*pos(3);
        bottom = pos(2) + (1-scale(2))*pos(4)/2;
        
    case {'ne','northeast'}
        left = pos(1) + (1-buffer-scale(1))*pos(3);
        bottom = pos(2) + (1-buffer-scale(2))*pos(4);
    case {'se','southeast'}
        left = pos(1) + (1-buffer-scale(1))*pos(3);
        bottom = pos(2) + buffer*pos(4);
    case {'sw','southwest'}
        left = pos(1) + buffer*pos(3);
        bottom = pos(2) + buffer*pos(4);        
    case {'nw','northwest'}
        left = pos(1) + buffer*pos(3);
        bottom = pos(2) + (1-buffer-scale(2))*pos(4);
    case {'c','center','centre'}
        left = pos(1) + (1-scale(1))*pos(3)/2;
        bottom = pos(2) + (1-scale(2))*pos(4)/2;
    otherwise
        error('Did not recognise position code');
end

insetPos = [left bottom scale.*pos(3:4)];
h = axes(get(ax,'parent'),'position',insetPos);
