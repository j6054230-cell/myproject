# myapp/views.py
from django.shortcuts import render
from django.http import JsonResponse
from .models import Post


def index(request):
    """Asosiy sahifa — barcha postlarni ko'rsatadi"""
    posts = Post.objects.all()
    return render(request, 'myapp/index.html', {'posts': posts})


def health_check(request):
    """CI/CD deploy muvaffaqiyatli bo'lganini tekshirish uchun"""
    return JsonResponse({
        'status': 'ok',
        'message': 'Server ishlayapti!'
    })

