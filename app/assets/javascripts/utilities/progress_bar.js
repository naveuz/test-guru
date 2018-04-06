document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.progress');
  if (progress) {
    var questionNumber = progress.dataset.questionNumber;
    var questionCount = progress.dataset.questionCount;
    var value = (questionNumber / questionCount) * 100;
    progress.value = value;
  }
});
