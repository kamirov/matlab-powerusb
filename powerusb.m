function powerusb(outlet1, outlet2, outlet3)
% Turns on outlets 1-3 on the powerUSB AC power controller. Pass no
% arguments to turn on all 3 outlets.
%
% Sample usage:
%     - powerusb(1, 1, 0);   % turns on outlets 1 and 2, turns off outlet 3
%     - powerusb(0, 0, 0);   % turns off all outlets
%     - powerusb();          % turns on all outlets
%
% Notes: 
%     - This uses the 'pwrusbcmd' executable. The alternative is to use the
%       provided API. At the moment, the API is 32-bit, making it impossible to
%       use with 64-bit MATLAB. If the API is ever used, this function rewritten
%       into a more versatile power_controller class.
% 
%     - pwrusbcmd.exe and PwrUSBDll.dll must be in the same directory as
%       this function

    % 'All on' case
    if (nargin < 1)
        outlet1 = 1;
        outlet2 = 1;
        outlet3 = 1;
    end
    
    % If we have invalid data, then just turn off the corresponding outlet
    if outlet1 ~= 0 && outlet1 ~= 1
        outlet1 = 0;
    end
    if outlet2 ~= 0 && outlet2 ~= 1
        outlet2 = 0;
    end
    if outlet3 ~= 0 && outlet3 ~= 1
        outlet3 = 0;
    end

    % Get directory of executable
    filename = [mfilename '.m'];
    dir = which(mfilename);
    dir = dir(1:end-numel(filename));
    
    % The output arguments below are to suppress output from dos
    [a, b] = dos([dir 'pwrusbcmd ' ...
                 num2str(outlet1) ' ' ...
                 num2str(outlet2) ' ' ...
                 num2str(outlet3) ' ']);
end