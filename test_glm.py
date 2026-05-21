from openai import OpenAI
import os
import sys

client = OpenAI(
  base_url = "https://integrate.api.nvidia.com/v1",
  api_key = "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"
)

completion = client.chat.completions.create(
  model="z-ai/glm-5.1",
  messages=[{"role":"user","content":"Which number is larger, 9.11 or 9.8?"}],
  temperature=1,
  top_p=1,
  max_tokens=8192,
  extra_body={"chat_template_kwargs":{"enable_thinking":False,"clear_thinking":True}},
  stream=True
)

for chunk in completion:
  if not getattr(chunk, "choices", None):
    continue
  if len(chunk.choices) == 0 or getattr(chunk.choices[0], "delta", None) is None:
    continue
  delta = chunk.choices[0].delta
  if getattr(delta, "content", None) is not None:
    print(delta.content, end="")