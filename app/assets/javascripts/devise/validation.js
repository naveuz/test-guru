document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.password-confirm');

  if (control) {
    control.addEventListener('input', validate);
  }
});

function validate() {
  var password = document.querySelector('.password');
  var passwordConfirm = document.querySelector('.password-confirm');
  var passwordValue = document.querySelector('.password').value;
  var passwordConfirmValue = document.querySelector('.password-confirm').value;
  var pwd = document.querySelector('.pwd');
  var confirm = document.querySelector('.confirm');

  if (!passwordConfirmValue) {
    password.classList.remove('invalid');
    passwordConfirm.classList.remove('invalid');
    password.classList.remove('valid');
    passwordConfirm.classList.remove('valid');
    pwd.querySelector('.octicon-alert').classList.add('hide');
    confirm.querySelector('.octicon-alert').classList.add('hide');
    pwd.querySelector('.octicon-check').classList.add('hide');
    confirm.querySelector('.octicon-check').classList.add('hide');

  } else if (passwordConfirmValue === passwordValue) {
    password.classList.remove('invalid');
    passwordConfirm.classList.remove('invalid');
    password.classList.add('valid');
    passwordConfirm.classList.add('valid');
    pwd.querySelector('.octicon-check').classList.remove('hide');
    confirm.querySelector('.octicon-check').classList.remove('hide');
    pwd.querySelector('.octicon-alert').classList.add('hide');
    confirm.querySelector('.octicon-alert').classList.add('hide');
  } else {
    password.classList.remove('valid');
    passwordConfirm.classList.remove('valid');
    password.classList.add('invalid');
    passwordConfirm.classList.add('invalid');
    pwd.querySelector('.octicon-alert').classList.remove('hide');
    confirm.querySelector('.octicon-alert').classList.remove('hide');
    pwd.querySelector('.octicon-check').classList.add('hide');
    confirm.querySelector('.octicon-check').classList.add('hide');
  }
}
