function retrieveSensitiveInformations
    if not set -q OPENAI_API_KEY
        set -xg OPENAI_API_KEY (op read op://Personal/OpenAI/api_key --no-newline)
    end
    gpg-cache
end
