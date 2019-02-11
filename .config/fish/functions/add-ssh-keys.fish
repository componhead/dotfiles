function add-ssh-keys
    set myid (ssh-add -l | grep -e 'id_rsa' | wc -l)
    if [ $myid -ne 1 ]
        ssh-add ~/.ssh/id_rsa
    end
    set ot (ssh-add -l | grep -e 'work_onetech' | wc -l)
    if [ $ot -ne 1 ]
        ssh-add ~/.ssh/work_onetech
    end
    set t4f (ssh-add -l | grep -e 't4f' | wc -l)
    if [ $t4f -ne 1 ]
        ssh-add ~/.ssh/t4f
    end
end
