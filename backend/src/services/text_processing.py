

from __future__ import annotations

import re

def require_model_content(text: str) -> str:
    pass
    lowered = text.lower()
    notices = (
        "accounts that have not been recharged can only try",
        "you have no credits remaining",
        "insufficient_quota",
    )
    if any(notice in lowered for notice in notices):
        raise RuntimeError("模型服务额度不足，未生成有效研究内容。请检查模型平台额度或更换可用模型配置。")
    return text

def strip_tool_calls(text: str) -> str:
    pass

    if not text:
        return text

    pattern = re.compile(r"\[TOOL_CALL:[^\]]+\]")
    return pattern.sub("", text)

