from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import get_object_or_404, render
from django.template import RequestContext, loader
from django.core.urlresolvers import reverse
from django.utils import timezone
from django.views import generic

from .models import Choice, Question

class IndexView(generic.ListView):
    # Uses polls/index.html as the template for this generic view along with
    # latest_question_list as the name of the variable in the template that
    # will be listed.
    template_name = 'polls/index.html'
    context_object_name = 'latest_questions'

    # Returns the last 5 published questions.
    def get_queryset(self):
        # Return the last 5 questions that were published now or before now
        return Question.objects.filter(pub_date__lte=timezone.now()).order_by('-pub_date')[:5]

class DetailView(generic.DetailView):
    # Expects to detail Question objects now and uses polls/details.html as the
    # template for it.
    model = Question
    template_name = 'polls/detail.html'

class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'

# Doesn't display an actual view, rather votes based on the message passed in
# the POST request, and redirects to the results view for the question.
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
