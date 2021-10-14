quat00 = readquat('dump.00.quat',5);
quat01 = readquat('dump.01.quat',5);
quat10 = readquat('dump.10.order',9); quat10=quat10(:,5:9);
quat11 = readquat('dump.11.order',9); quat11=quat11(:,5:9);


quat0=quatcorrect(quat00,quat01);
quat1=quatcorrect(quat10,quat11);

quat_hist = quatprod(quat0, quat1);