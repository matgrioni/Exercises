from django.http import HttpResponse, Http404
from django.shortcuts import render
from django.template import RequestContext, loader

from .models import Question

def index(request):
    latest_questions = Question.objects.order_by('-pub_date')[:5]
    context = { 'latest_questions': latest_questions }
    return render(request, 'polls/index.html', context)

def detail(request, question_id):
    # Try to get the requested object but if it doesn't exist throw an
    # Http404 error
    try:
        question = Question.objects.get(pk=question_id)
    except:
        raise Http404("Question does not exist")
    
    return render(request, 'polls/detail.html', {'question': question})

def results(request, question_id):
    response =  "You're looking at the results of question {}"
    return HttpResponse(response.format(question_id))

def vote(request, question_id):
    response = "You're voting on question {}"
    return HttpResponse(response.format(question_id))
