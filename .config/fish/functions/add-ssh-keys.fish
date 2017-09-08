function add-ssh-keys
    set myid (ssh-add -l | grep -e 'id_rsa' | wc -l)
    if [ $myid -ne 1 ]
        ssh-add ~/.ssh/id_rsa
    end
    set ot (ssh-add -l | grep -e 'work_onetech' | wc -l)
    if [ $ot -ne 1 ]
        ssh-add ~/.ssh/work_onetech
    end
end
