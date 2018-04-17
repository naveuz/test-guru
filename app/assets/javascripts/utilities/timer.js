document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');

  if (timer) {
    var counter = timer.dataset.time;

    setInterval(function () {
      minutes = parseInt(counter / 60, 10)
      seconds = parseInt(counter % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      timer.innerHTML = minutes + ":" + seconds;

      if (--counter < 0) {
        alert('Время истекло!')
        document.querySelector('form').submit();
      }
    }, 1000);
  }
});
