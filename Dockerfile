# -------- Stage 1 --------
FROM python:3.11 AS builder

WORKDIR /app
COPY requirements.txt .

RUN pip install --user -r requirements.txt

# -------- Stage 2 --------
FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /root/.local /root/.local
COPY app.py .

ENV PATH=/root/.local/bin:$PATH

# Expose port
EXPOSE 5000

CMD ["python", "app.py"]
