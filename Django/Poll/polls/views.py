from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import get_object_or_404, render
from django.template import RequestContext, loader
from django.core.urlresolvers import reverse

from .models import Choice, Question

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
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})

def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)

    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        return render(request, 'polls/details.html', {
            'error_message': "You didn't select a choice"
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()

        # Return a request object for posts to prevent posting data
        # twice if back button is pressed
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
