nsenter -t $(nerdctl inspect k6 --format '{{.State.Pid}}')  -n  ss -an | grep tcp | awk '{print $2}' | sort | uniq -c
