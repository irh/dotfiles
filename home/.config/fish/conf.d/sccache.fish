if command -q sccache
    set -gx RUSTC_WRAPPER sccache
    set -gx SCCACHE_CLIENT_SIDE 1
    set -gx SCCACHE_IDLE_TIMEOUT 0
    set -gx SCCACHE_SERVER_UDS /private/tmp/sccache.sock
end
