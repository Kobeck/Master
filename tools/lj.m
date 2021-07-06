function v = lj(eps, sig, cut, r)
% this function evaluates the lj126 potential for a given eps sigma and
% cutoff
% shiftet to 0 at cutoff


shift= 4*eps * ((sig./cut).^12 - (sig./cut).^6);
v=4*eps * ((sig./r).^12 - (sig./r).^6) - shift;


end
