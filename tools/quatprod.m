function out = quatprod(qa,qb)
%function returns product of quat a and b
if ( size(qa) ~= size(qb))
    error('quats not the same size!');
elseif (~isequal(qa(:,1),qb(:,1)))
    error('quats not sorted properly')
end

nAtoms = length(qa);

out = zeros(nAtoms, 5);
f = zeros(1,4);
for i = 1:nAtoms
    a = qa(i,2:5);
    b = qb(i,2:5);
    f(1)=a(1)*b(1)-a(2)*b(2)-a(3)*b(3)-a(4)*b(4);
    f(2)=a(1)*b(2)+a(2)*b(1)+a(3)*b(4)-a(4)*b(3);
    f(3)=a(1)*b(3)+a(3)*b(1)+a(4)*b(2)-a(2)*b(4);
    f(4)=a(1)*b(4)+a(4)*b(1)+a(2)*b(3)-a(3)*b(2);
    out(i,1:5) = [qb(i,1), f(1:4)];
end

end
