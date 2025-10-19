#!/bin/bash
# エラーが発生したらスクリプトを即座に終了する
set -e

echo '--- 外部モデルの初期セットアップを開始します ---'

echo '[1/2] Groq (llama3-8b) を作成中...'
# ollama create コマンドに標準入力(-)経由でModelfileの内容を渡す
ollama create groq-llama3-8b -f - <<'EOF'
FROM openai
PARAMETER model llama3-8b-8192
PARAMETER api_base https://api.groq.com/openai/v1
PARAMETER api_key $GROQ_API_KEY
EOF

echo '[2/2] OpenRouter (gemini-pro) を作成中...'
ollama create openrouter-gemini -f - <<'EOF'
FROM openai
PARAMETER model google/gemini-pro
PARAMETER api_base https://openrouter.ai/api/v1
PARAMETER api_key $OPENROUTER_API_KEY
EOF

echo '--- セットアップが完了しました ---'s