#!/bin/bash
# エラーが発生したらスクリプトを即座に終了する
set -e

echo '--- 外部モデルの初期セットアップを開始します ---'

echo '[1/3] Groq (llama3-8b) を作成中...'
# ollama create コマンドに標準入力(-)経由でModelfileの内容を渡す
ollama create groq-llama3-8b -f - <<'EOF'
FROM openai
PARAMETER model llama3-8b-8192
PARAMETER api_base https://api.groq.com/openai/v1
PARAMETER api_key $GROQ_API_KEY
EOF

echo '[2/3] OpenRouter (deepseek-r1) を作成中...'
# モデル名を openrouter-deepseek に変更
ollama create openrouter-deepseek -f - <<'EOF'
FROM openai
# モデルを deepseek/deepseek-r1:free に変更
PARAMETER model deepseek/deepseek-r1:free
PARAMETER api_base https://openrouter.ai/api/v1
PARAMETER api_key $OPENROUTER_API_KEY
EOF

echo '[3/3] Ollama (gpt-oss:20b) をダウンロード中...'
# gpt-oss:20b の pull コマンドを追加
ollama pull gpt-oss:20b

# (末尾の 's' のタイポを修正)
echo '--- セットアップが完了しました ---'