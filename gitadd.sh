
#find * -size +90M | sed 's|^\./||g' >> .gitignore; awk '!NF || !seen[$0]++' .gitignore

#find * -size +90 -type f -print >> .gitignore
find * -size -100M -type f -print | xargs git add
