./sos blob-server -store /sos/data -port 4001 &
./sos api-server -blob-server http://localhost:4001
