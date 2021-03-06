classdef oppHGN3d < oppSpot
% pSPOT wrapper for the Gauss-Newton Hessian of F3d.m
%
% use:
%   H = oppHGN3d(m,Q,model)
%
% see PDEfunc3D.m for further documentation
%
%         
%
% You may use this code only under the conditions and terms of the
% license contained in the file LICENSE provided with this source
% code. If you do not agree to these terms you may not use this
% software.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Properties
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties
        mt,Q,model,params;
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Methods
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods

       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       % Constructor
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       function op = oppHGN3d(mt,Q,model,params)            
           n = numel(mt);                                       
           op = op@oppSpot('oppHGN3d', n,n);
           op.cflag     = 0;  
           op.linear    = 1;
           op.sweepflag = 0;
           op.mt        = mt;
           op.Q         = Q;
           op.model     = model;
           op.params = params; 
       end                      
       
    end
        
    methods ( Access = protected )
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       % Multiply
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       function y = multiply(op,x,~)
           y = PDEfunc_dist(PDEopts.HESS_GN,op.mt,op.Q,x,[],op.model,op.params);       
       end %multiply
       
    end %protected methods
    
end %classdef

    
    
    
