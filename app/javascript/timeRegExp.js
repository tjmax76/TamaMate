const display = () => {
  const timeElements = document.getElementsByClassName('created_at');
  const pattern = '+0900';
  const array = Array.from(timeElements);
  array.forEach(element => {
    element.innerHTML = element.innerHTML.replace(pattern, '');
    element.innerHTML = element.innerHTML.replace(/-/g, '/');

  });

}

window.addEventListener('load', display);