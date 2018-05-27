cd hexo
hexo clean
hexo generate
cd ..

./push.sh $1
ansible-playbook deploy_remote.yml
