import datetime

from django.core.urlresolvers import reverse
from django.test import TestCase
from django.utils import timezone

from .models import Question

# Utility method to create a question using the given text and adds the given
# number of days to the time right now
def create_question(question_text, days):
    time = timezone.now() + datetime.timedelta(days=days)
    return Question.objects.create(question_text=question_text, pub_date=time)

class QuestionMethodTests(TestCase):
    # was_published_recently() should return false for dates in the future.
    def test_was_published_recently_with_future_date(self):
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Question(pub_date=time)
        self.assertEqual(future_question.was_published_recently(), False)

    def test_was_published_recently_with_old_date(self):
        time = timezone.now() - datetime.timedelta(days=30)
        old_question = Question(pub_date=time)
        self.assertEqual(old_question.was_published_recently(), False)

    def test_was_published_recently_with_recent_date(self):
        time = timezone.now() - datetime.timedelta(hours=1)
        recent_question = Question(pub_date=time)
        self.assertEqual(recent_question.was_published_recently(), True)

class QuestionViewTests(TestCase):
    def test_index_view_with_no_questions(self):
        response = self.client.get(reverse('polls:index'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "No polls available")
        self.assertQuerysetEqual(response.context['latest_questions'], [])

    def test_index_view_with_past_question(self):
        create_question('Past question', -30)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_questions'],
            ['<Question: Past question>']
        )

    def test_index_view_with_future_question(self):
        create_question('Future question', 30)
        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(response.context['latest_questions'], [])

    def test_index_view_with_past_and_future_questions(self):
        create_question('Future question', 30)
        create_question('Past question', -30)

        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_questions'],
            ['<Question: Past question>']
        )

    def test_index_view_with_two_past_questions(self):
        create_question('Past question #1', -30)
        create_question('Past question #2', -60)

        response = self.client.get(reverse('polls:index'))
        self.assertQuerysetEqual(
            response.context['latest_questions'],
            ['<Question: Past question #1>', '<Question: Past question #2>']
        )
