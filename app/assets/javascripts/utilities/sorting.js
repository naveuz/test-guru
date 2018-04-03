document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title');

  if(control) {
    control.addEventListener('click', sortByTitle);
  }
});

function sortByTitle() {
  var table = document.querySelector('table');
  var rows = document.querySelectorAll('tr');
  var arrRows = Array.prototype.slice.call(rows);

  arrRows.shift();

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    arrRows.sort(sortByAsc);
    this.querySelector('.octicon-arrow-up').classList.remove('hide');
    this.querySelector('.octicon-arrow-down').classList.add('hide');
  } else {
    arrRows.sort(sortByDesc);
    this.querySelector('.octicon-arrow-down').classList.remove('hide');
    this.querySelector('.octicon-arrow-up').classList.add('hide');
  }

  var sortedTable = document.createElement('table');
  sortedTable.classList.add('table');
  sortedTable.appendChild(rows[0]);

  for (var i = 0; i < arrRows.length; i++) {
    sortedTable.appendChild(arrRows[i]);
  }

  table.parentNode.replaceChild(sortedTable, table);
}

function sortByAsc(row1, row2) {
  firstTitle = row1.querySelector('td').textContent
  secondTitle = row2.querySelector('td').textContent

  if (firstTitle < secondTitle) {
    return -1;
  } else if (firstTitle > secondTitle) {
    return 1;
  } else {
    return 0;
  }
}

function sortByDesc(row1, row2) {
  firstTitle = row1.querySelector('td').textContent
  secondTitle = row2.querySelector('td').textContent

  if (firstTitle < secondTitle) {
    return 1;
  } else if (firstTitle > secondTitle) {
    return -1;
  } else {
    return 0;
  }
}
