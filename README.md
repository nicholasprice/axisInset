# axisInset
```
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
```
