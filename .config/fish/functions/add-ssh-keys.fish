function add-ssh-keys
    set keys (ssh-add -l | grep -e 'id_rsa' -e 'work_onetech' | wc -l)
    if [ $keys -ne 2 ]
        ssh-add ~/.ssh/id_rsa ~/.ssh/work_onetech
    end
end
