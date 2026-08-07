if command -q sccache
    set -x RUSTC_WRAPPER sccache
    set -x SCCACHE_CLIENT_SIDE 1
    set -x SCCACHE_IDLE_TIMEOUT 0
    set -x SCCACHE_SERVER_UDS /private/tmp/sccache.sock
end
