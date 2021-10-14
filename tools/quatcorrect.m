function quat_out = quatcorrect(quat00, quat01)

tmp= quatinv(quat00(:,2:5));

quat_out = quatprod([quat00(:,1), tmp], quat01);
end
