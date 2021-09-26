function hsf
  hugo server -DEF --cleanDestinationDir --port 8080 --bind 0.0.0.0 --baseURL http://(ip -4 addr| grep 'inet 192' | awk '{print $2}'|cut -d/ -f1) $argv; 
end
