ssh -L 10000:localhost:10000 paulf@10.50.3.45 -t socat -T10 TCP4-LISTEN:10000,fork UDP4:10.50.3.14:53
sudo socat UDP4-LISTEN:53,fork TCP4:localhost:10000
