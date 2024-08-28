from django.shortcuts import render
from django.http import HttpResponse
from PIL import Image

from blog_post.models import Post
# Create your views here.
def home(requests):
    #1.資料查詢->QuerySet Class
    posts = Post.objects.all()
    
    #2.處理資料
    data_contain = list()
    for count,post in enumerate(posts):
        data_contain.append("<h2>#{}: {} </h2><hr>".format(str(count+1), post.title))
        data_contain.append("<small>{}</small><br><hr>".format(post.content))
   

    # 3. 渲染並回傳
    return HttpResponse(data_contain)

from datetime import datetime
def home_template(requests):
    posts = Post.objects.all()
    now = datetime.now()
    return render(requests, 'pages/index.html', locals())

# def showpost(requests, slug):
    #data_contain = "<h1>{}</h1>".format(str(slug))
    #return HttpResponse(data_contain)


from django.shortcuts import redirect
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
def showpost(requests, slug):
    try:
        post = Post.objects.get(slug = slug)
    except ObjectDoesNotExist:
        return redirect('/')
    except MultipleObjectsReturned:
        post = Post.objects.filter(slug = slug).first
   
    return render(requests, 'pages/post.html' , locals())