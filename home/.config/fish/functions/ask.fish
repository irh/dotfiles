function ask --wraps llm
    llm \
        --sf $HOME/.config/llm/fragments/no-chat-footer \
        -m openai-codex/gpt-5.4-mini \
        $argv | glow
end
