from openai import OpenAI
import os
import sys

# Ekrandaki yazıların renk ayarı
_USE_COLOR = sys.stdout.isatty() and os.getenv("NO_COLOR") is None
_REASONING_COLOR = "\033[90m" if _USE_COLOR else ""
_RESET_COLOR = "\033[0m" if _USE_COLOR else ""

# BURAYA DİKKAT: Alttaki tırnak işaretlerinin içine Adım 2'de aldığın YENİ NVIDIA şifreni yapıştır!
NVIDIA_SIFRESI = "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"

client = OpenAI(
  base_url = "https://integrate.api.nvidia.com/v1",
  api_key = "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"
)

# Yapay zekaya göndereceğimiz soru
soru = "Merhaba, sen hangi modelsin ve neleri çok iyi yapabilirsin?"

print("Yapay zeka düşünmeye başlıyor...\n")

completion = client.chat.completions.create(
  model="z-ai/glm-5.1",
  messages=[{"content": soru, "role": "user"}],
  temperature=1,
  top_p=1,
  max_tokens=16384,
  extra_body={"chat_template_kwargs":{"enable_thinking":True,"clear_thinking":False}},
  stream=True
)

for chunk in completion:
  if not getattr(chunk, "choices", None):
    continue
  if len(chunk.choices) == 0 or getattr(chunk.choices[0], "delta", None) is None:
    continue
  delta = chunk.choices[0].delta
  reasoning = getattr(delta, "reasoning_content", None)
  
  # Yapay zekanın arka plandaki düşünme süreci gri renkle yazdırılır
  if reasoning:
    print(f"{_REASONING_COLOR}{reasoning}{_RESET_COLOR}", end="")
  # Yapay zekanın asıl cevabı normal renkle yazdırılır
  if getattr(delta, "content", None) is not None:
    print(delta.content, end="")