# https://gist.github.com/leolovenet/207017a3f6c41bcf50e7df57f0032e5f#file-proxy-fish-L2

function __proxy_enable
    set IP 127.0.0.1
    set PORT 7890
    set PROT socks5
    set OPT -gx

    if test (count $argv) -gt 0
        for i in (seq 1 (count $argv))
            set arg $argv[$i]
            switch $arg
                case "-non-global"
                    set OPT "-x"
                case -socks -socks5     # set socks proxy (local DNS)
                    set PROT socks5
                case -socks5h           # set socks proxy (remote DNS)
                    set PROT socks5h
                case -http              # set HTTP proxy
                    set PROT http
                case '*'
                    if test (string sub -l 1 -- "$arg") != "-"
                        set PORT "$arg"
                    end
            end
        end
    end

    set PROXY "$PROT://$IP:$PORT"

    echo set $OPT HTTP_PROXY $PROXY
    echo set $OPT HTTPS_PROXY $PROXY
    echo set $OPT ALL_PROXY $PROXY
    echo set $OPT NO_PROXY localhost,127.0.0.1
end

function proxy_enable
   source (__proxy_enable $argv | psub)
end

function proxy_disable
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    set -e ALL_PROXY
    set -e NO_PROXY
end
