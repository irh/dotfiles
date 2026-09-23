function ask --wraps llm
    llm \
        --sf $HOME/.config/llm/fragments/no-chat-footer \
        -m openai-codex/gpt-5.6-luna \
        --option reasoning_effort low \
        $argv | glow
end
