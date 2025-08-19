FROM python:3.12-slim

WORKDIR /app/OpenManus

RUN apt-get update && apt-get install -y --no-install-recommends git curl \
    && rm -rf /var/lib/apt/lists/* \
    && (command -v uv >/dev/null 2>&1 || pip install --no-cache-dir uv)

COPY . .
 
# Use python -m pip for reliable installs inside Docker (avoids relying on a separate 'uv' shim)
RUN python -m pip install --no-cache-dir -r requirements.txt
 
CMD ["bash"]
