git add .

echo -n "Please enter git message:" ---：

read name
git commit -m "$name"
git push