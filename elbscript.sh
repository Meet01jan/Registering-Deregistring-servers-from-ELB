#!/bin/bash
read -p "ELB name : " elb_name
read -p "instance ID : " instance_id
option=("register" "deregister")
select opt in "${option[@]}"
do
    case $opt in
        "register")
            echo "Attaching instance to ELB"
            aws elb register-instances-with-load-balancer --load-balancer-name $elb_name --instances $instance_id
            break
            ;;
        "deregister")
            echo "Detaching instance from ELB"
            aws elb deregister-instances-from-load-balancer --load-balancer-name $elb_name --instances $instance_id
            break
            ;;
    esac
done
