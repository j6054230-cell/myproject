# Pythonning eng barqaror versiyasini olamiz
FROM python:3.10-slim

# Konteyner ichidagi ishchi papka
WORKDIR /app

# Tizim uchun zarur bo'lgan kutubxonalarni o'rnatamiz
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Avval requirements faylini nusxalaymiz (keshlash uchun)
COPY requirements.txt .

# Kutubxonalarni o'rnatamiz
RUN pip install --no-cache-dir -r requirements.txt

# Loyihaning barcha fayllarini konteynerga nusxalaymiz
COPY . .

# Django serverini ishga tushirish buyrug'i
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
